module Slack
  extend self

  ENDPOINT = 'https://hooks.slack.com/services/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'
  SUCCESS = '200'

  def notify(message, channel = 'dev')
    response = Net::HTTP.post_form(uri, params(message, channel))
    response.code == SUCCESS
  end

  private

  def params(message, channel)
    {
      payload: { text: message }.to_json
    }
  end

  def uri
    URI(ENDPOINT)
  end
end
