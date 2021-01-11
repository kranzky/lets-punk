# frozen_string_literal: true

class GenerateSwaggerService < PUNK::Service
  def process
    path = File.join(PUNK.get.app.path, '..', 'www', 'swagger.json')
    raise PUNK::InternalServerError, 'swagger.json already exists' if File.exist?(path) && !PUNK.env.test?
    require 'swagger_yard'
    require 'punk/helpers/swagger'
    SwaggerYard.register_custom_yard_tags!
    SwaggerYard.configure do |config|
      config.api_version = PUNK.version
      config.title = PUNK.get.app.name
      config.description = PUNK.get.app.description
      config.api_base_path = PUNK.get.app.url
      config.controller_path = File.join('app', 'routes', '**', '*')
      config.model_path = [File.join('app', 'models', '**', '*')]
    end
    spec = SwaggerYard::OpenAPI.new
    blob = JSON.pretty_generate(spec.to_h)
    unless PUNK.env.test?
      FileUtils.mkdir_p(File.dirname(path))
      File.open(path, "w") { |f| f << blob }
    end
    blob
  end
end
