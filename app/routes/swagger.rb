# frozen_string_literal: true

# route: GET /swagger.json
PUNK.route('swagger') do
  result = GenerateSwaggerService.run.result
  response.status = 200
  response['Content-Type'] = 'application/json'
  result
end
