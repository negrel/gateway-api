local prometheus = require "kong.plugins.custom_prometheus.exporter"


return {
  ["/metrics"] = {
    GET = function()
      prometheus.collect()
    end,
  },
}
