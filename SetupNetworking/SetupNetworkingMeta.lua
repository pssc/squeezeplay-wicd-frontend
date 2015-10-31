
    --[[
    A frontend to wicd for squeezeplay
    Copyright (C) 2011  Will Szumski

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    --]]


--[[
=head1 NAME

applets.Test.TestMeta - Test meta-info

=head1 DESCRIPTION

See L<applets.Test.TestApplet>.

=head1 FUNCTIONS

See L<jive.AppletMeta> for a description of standard applet meta functions.

=cut
--]]



local oo            = require("loop.simple")

local AppletMeta    = require("jive.AppletMeta")

local appletManager = appletManager
local jiveMain      = jiveMain


module(...)
oo.class(_M, AppletMeta)


function jiveVersion(meta)
  return 1, 1
end

function defaultSettings(meta)
  
  local defaultSetting = {}
  return defaultSetting
  
end

function registerApplet(meta)
  -- FIXME make more like squeeze os
  -- meta:registerService("setupScan")
  -- meta:registerService("setupNetworking")
  -- meta:registerService("settingsNetworking")
    
  -- our own services
  meta:registerService("isNetworkConnected")
  meta:registerService("showNetworkSetup")  
  jiveMain:addItem(meta:menuItem('appletSetupNetworking', 'settings', "SETUP_NETWORKING", function(applet, ...) applet:menu(...) end, 900))
  -- FIXME make more like squeeze OS
  --jiveMain:addItem(meta:menuItem('chooseNetwork', 'networkSettings', "NETWORK_WIRELESS_NETWORKS", function(applet, ...) applet:settingsNetworking(...) end, 2))
  
end
