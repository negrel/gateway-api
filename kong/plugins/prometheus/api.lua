local prometheus = require "kong.plugins.prometheus.prometheus"

return {
    ["/metrics"] = {
        GET = function()
            kong.log.inspect(prometheus)
            prometheus.collect()
        end
    }
}
