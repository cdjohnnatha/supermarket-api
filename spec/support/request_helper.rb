# frozen_string_literal: true

module RequestHelper
  def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    { "Authorization": "Bearer #{token}" }
  end

  def json
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include RequestHelper
end
