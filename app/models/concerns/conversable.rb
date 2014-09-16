module Conversable
  extend ActiveSupport::Concern

  included do

    def get_conversations
      uri = URI('https://api.pol.is/api/v3/conversations')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri.path, {
        'Content-Type' => 'application/json'
      })
      request.basic_auth ENV['POLIS_API_KEY'], ''

      response = http.request(request)
      response.body
    end

  end
end
