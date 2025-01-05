return function(_, opts)
  local notify = require 'notify'
  notify.setup(opts)
  require('custom.setup.notify-utils').setup(notify)
end
