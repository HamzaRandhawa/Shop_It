# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Initialize the rails application
# MyApp::Application.initialize!

# Set the default host and port to be the same as Action Mailer.
Rails.application.default_url_options = Rails.application.config.action_mailer.default_url_options

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
end