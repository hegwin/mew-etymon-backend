module RequestSpecHelper
  def data
    JSON.parse(response.body)['data']
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper, type: :request
end
