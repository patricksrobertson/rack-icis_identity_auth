require 'httparty'

module Rack
  class IcisIdentityAuth
    ROOT_URL = 'http://icis-identity-example.herokuapp.com/api/v1/verify.json'

    def initialize(app)
      @app = app
    end

    def call(env)
      token    = env['HTTP_X_BEARER_TOKEN']
      uid      = env['HTTP_X_UID']
      app_name = env['HTTP_X_APP_NAME']

      return forbidden unless token && uid && app_name

      response = HTTParty.get "#{ROOT_URL}?id=#{uid}&token=#{token}&app_name=#{app_name}"

      case response.code
      when 403
        forbidden
      when 404
        error_code(404, 'Not Found')
      when 500
        error_code(500, 'Server Error')
      when 503
        error_code(503, 'Maintenance')
      when 504
        error_code(504, 'System Down')
      end

      @app.call(env)
    end

    private
    def forbidden
      error_code(403, 'Unauthorized')
    end

    def error_code(code, message)
      [code, {'Content-Type' => 'text/plain'}, [message]]
    end
  end
end
