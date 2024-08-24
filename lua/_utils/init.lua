local settings = require "global.settings"

if settings.packer == "lazy" then
  local lazy = require "_utils.lazy"
  lazy:install_plugins()
elseif settings.packer == "rocks" then
  local rocks = require "_utils.rocks"
  rocks:install_rocks()
end
