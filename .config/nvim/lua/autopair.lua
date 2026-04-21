local M = {}

-- Simple autopair implementation mimicking common autopair plugins
-- Features:
--   • Typing an opening bracket/quote auto-inserts the closing pair and places cursor in between
--   • Typing the closing character when the next char is already the closer just moves the cursor past it
--   • Backspacing while cursor is between a matching pair deletes BOTH characters
--     (NEW: for quotes only — if the line has an *odd* number of that quote char, delete only one)
--   • Special rule for single quote: if the character immediately before the cursor is a word character
--     (like in "can't", "isn't", "it's"), it does NOT auto-close — just inserts a bare '
--   • NEW FEATURE: For quotes (' " `) the autopair logic now checks the count of that exact character
--     on the *current line*. If the count is odd, typing the quote inserts only one character
--     (no auto-pair). This matches your request exactly (e.g. 3 quotes → type quote = insert 1, not 2).

function M.setup()
  -- Define all supported pairs (add/remove as you like)
  local open_to_close = {
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['"'] = '"',
    ["'"] = "'",
    ['`'] = '`',
  }

  -- Helper to count occurrences of a character on the current line
  local function count_char(line, char)
    local _, count = line:gsub(char, "")
    return count
  end

  -- Helper: opening character handler (used for brackets where open ≠ close)
  local function open_handler(open, close)
    return function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local prev = col > 0 and line:sub(col, col) or ''

      -- Special rule ONLY for single quote
      local should_pair = true
      if open == "'" and prev:match('%w') then
        should_pair = false
      end

      if should_pair then
        return open .. close .. '<Left>'
      else
        return open
      end
    end
  end

  -- Helper: closing character handler (used for brackets where open ≠ close)
  local function close_handler(close)
    return function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local next_char = line:sub(col + 1, col + 1)

      if next_char == close then
        return '<Right>'
      else
        return close
      end
    end
  end

  -- Helper: combined handler for quotes (open == close)
  -- Now includes the new odd/even count rule for the specific quote character
  local function quote_handler(q)
    return function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local next_char = line:sub(col + 1, col + 1)

      -- NEW: count how many of *this exact quote character* are already on the line
      local count = count_char(line, q)

      if next_char == q then
        -- We are at a closing quote → just move past it (unchanged)
        return '<Right>'
      else
        -- We are typing a quote → decide whether to auto-pair
        local prev = col > 0 and line:sub(col, col) or ''

        -- New rule: only auto-pair if the current count is EVEN
        local should_pair = (count % 2 == 0)

        -- Keep the original single-quote contraction rule (only checked when we would otherwise pair)
        if should_pair and q == "'" and prev:match('%w') then
          should_pair = false
        end

        if should_pair then
          return q .. q .. '<Left>'
        else
          return q
        end
      end
    end
  end

  -- Set up mappings for every pair
  for open, close in pairs(open_to_close) do
    if open == close then
      -- Quotes (' " `) use the combined handler (now with odd/even logic)
      vim.keymap.set('i', open, quote_handler(open), { expr = true, noremap = true })
    else
      -- Brackets (different open/close) get separate handlers — unchanged
      vim.keymap.set('i', open, open_handler(open, close), { expr = true, noremap = true })
      vim.keymap.set('i', close, close_handler(close), { expr = true, noremap = true })
    end
  end

  -- Backspace handler: delete both characters when cursor is between a matching pair
  -- NEW: For quotes only — if the line has an *odd* number of that quote character,
  --      we do NOT delete the pair (just normal backspace). This prevents "deleting the quote right next to it"
  --      exactly as you requested. Brackets keep the original behavior.
  vim.keymap.set('i', '<BS>', function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]

    if col == 0 then
      return '<BS>'
    end

    local char_before = line:sub(col, col)
    local char_after = line:sub(col + 1, col + 1)

    -- If we are between a known opening and its matching closer
    if open_to_close[char_before] == char_after then
      if char_before == char_after then
        -- Quote pair ( ' " ` )
        local count = count_char(line, char_before)
        if count % 2 == 1 then
          -- Odd number of this quote on the line → delete only one character
          return '<BS>'
        else
          -- Even number → delete the whole pair (original behavior)
          return '<BS><Del>'
        end
      else
        -- Bracket pair ( ( [ { ) → unchanged, always delete both
        return '<BS><Del>'
      end
    else
      return '<BS>'
    end
  end, { expr = true, noremap = true })
end


return M
