-- Extending the Base Plugin handler is optional, as there is no real
-- concept of interface in Lua, but the Base Plugin handler's methods
-- can be called from your child implementation and will print logs
-- in your `error.log` file (where all logs are printed).
local BasePlugin = require "kong.plugins.base_plugin"
local ngx_prom = require "kong.plugins.prometheus.lib.nginx-lua-prometheus.prometheus"

local prometheus = require "kong.plugins.prometheus.prometheus"
prometheus.init()

local PrometheusHandler = BasePlugin:extend()

PrometheusHandler.VERSION = "1.0.0"
PrometheusHandler.PRIORITY = 10

-- Your plugin handler's constructor. If you are extending the
-- Base Plugin handler, it's only role is to instantiate itself
-- with a name. The name is your plugin name as it will be printed in the logs.
function PrometheusHandler:new()
    PrometheusHandler.super.new(PrometheusHandler, "prometheus")
end

function PrometheusHandler:init_worker()
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    PrometheusHandler.super.init_worker(PrometheusHandler)

    prometheus.init_worker()
end

function PrometheusHandler:preread(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    PrometheusHandler.super.preread(PrometheusHandler)

    -- Implement any custom logic here
end

function PrometheusHandler:certificate(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    PrometheusHandler.super.certificate(PrometheusHandler)

    -- Implement any custom logic here
end

function PrometheusHandler:rewrite(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    PrometheusHandler.super.rewrite(PrometheusHandler)

    -- Implement any custom logic here
end

function PrometheusHandler:access(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    PrometheusHandler.super.access(PrometheusHandler)

    local service = kong.router.get_service()

    kong.log.inspect(service)
    ngx_prom:counter(service.name, string.format("%s_service_visit_count", service.name))
end

function PrometheusHandler:header_filter(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    PrometheusHandler.super.header_filter(PrometheusHandler)

    -- Implement any custom logic here
end

function PrometheusHandler:body_filter(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    PrometheusHandler.super.body_filter(PrometheusHandler)

    -- Implement any custom logic here
end

function PrometheusHandler:log(config)
    -- Eventually, execute the parent implementation
    -- (will log that your plugin is entering this context)
    PrometheusHandler.super.log(PrometheusHandler)

    -- Implement any custom logic here
end

-- This module needs to return the created table, so that Kong
-- can execute those functions.
return PrometheusHandler
