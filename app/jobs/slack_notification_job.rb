class SlackNotificationJob < ApplicationJob
  def perform(message:, channel: "orga")
    return if slack_webhook_url.blank? || message.blank?

    @message = message
    @channel = channel
    send_slack_message
  end

  private

  attr_reader :message, :channel

  def send_slack_message
    uri = URI.parse(slack_webhook_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.request_uri, "Content-Type" => "application/json")
    request.body = { text: message, channel: channel_by_envrionment }.to_json
    puts channel_by_envrionment
    http.request(request)
  rescue => e
    Rails.logger.error "Couldn't send slack notification because of error: #{e.class} #{e.message}"
  end

  def channel_by_envrionment
    # post to #orga in production and #orga-dev in other environments
    return channel if Rails.env.production? && !channel.include?("dev")

    "#{channel}-dev"
  end

  def slack_webhook_url
    ENV["SLACK_WEBHOOK_URL"]
  end
end
