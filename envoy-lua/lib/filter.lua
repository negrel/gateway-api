function envoy_on_request(request_handle)
    request_handle:headers():add("X-Company", "FDJ")
end

function envoy_on_response(response_handle)
    body_size = response_handle:body():length()
    response_handle:headers():add("response-body-size", tostring(body_size))
end
