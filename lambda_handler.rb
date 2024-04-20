# lambda_handler.rb
require_relative 'app'

def lambda_handler(event:, context:)
  request = Rack::Request.new(Rack::MockRequest.env_for(
    event['path'],
    :method => event['httpMethod'],
    :params => event['queryStringParameters']
  ))

  status, headers, body = App.call(request.env)

  {
    statusCode: status,
    headers: headers,
    body: body.join
  }
end