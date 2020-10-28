local prometheus = require "kong.plugins.custom_prometheus.prometheus"

return {
    ["/metrics"] = {
        GET = function()
            prometheus.collect()
        end
    }
}
