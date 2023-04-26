local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window
  tab, pane, window = mux.spawn_window {
    args = {'bash', '-i', '-c' , 'cd '.. cmd.args[1] .. '; bash'},
   
    
  }
  tab:set_title 'template-factory'
  window:set_title 'template-factory'

  local watch_deploy_pane = pane:split {
    args = {'bash', '-i', '-c', 'cd '.. cmd.args[1] .. '; sleep 1; pnpm watch_deploy; bash'},
    direction = 'Bottom'
  }

  local anvil_pane = watch_deploy_pane:split {
    args= {'bash', '-i', '-c', 'anvil; bash'},
    direction = 'Right'
  }

  local watch_compile_pane = watch_deploy_pane:split {
    args = {'bash', '-i', '-c', 'cd '.. cmd.args[1] .. '; sleep 1; pnpm watch_compile; bash'},
    direction = 'Bottom'
  }
  
  

  
end)


config = {}

-- fix windows in virtualbox
config.prefer_egl=true

return config