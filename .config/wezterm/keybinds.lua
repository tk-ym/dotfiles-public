local wezterm = require 'wezterm'
local act = wezterm.action

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
  local name = window:active_key_table()
  if name then
    name = "TABLE: " .. name
  end
  window:set_right_status(name or "")
end)

config = {
   keys = {
      {
	 key = "c",
	 mods = "SUPER",
	 action = act.CopyTo("Clipboard")	 
      },
      {
	 key = "v",
	 mods = "SUPER",
	 action = act.PasteFrom("Clipbaord")
      },
   },
   key_tables = {
     resize_pane = {
      { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
      { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
      { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
      { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

      -- Cancel the mode by pressing escape
      { key = "Enter", action = "PopKeyTable" },
    },
   }
}

return config
