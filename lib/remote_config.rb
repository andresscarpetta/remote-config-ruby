require "remote_config/version"
require "aws-sdk-lambda"
require "json"

module RemoteConfig
  CLIENT = Aws::Lambda::Client.new(region: "us-west-2")

  def get_config_keys(key)
    req_payload = { key: key }
    env = ENV["ENV"]
    if env
      req_payload['env'] = env
    end
    payload = JSON.generate(req_payload)

    response = CLIENT.invoke({
      function_name: "remote-config",
      invocation_type: "RequestResponse",
      payload: payload
    })

    res_payload = JSON.parse(response.payload.string)
    return res_payload["value"]
  end
end
