# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MLSApidoc::Application.initialize!
DEFAULT_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/settings.yml")

