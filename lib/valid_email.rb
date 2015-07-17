require 'valid_email/all'

I18n.load_path += Dir.glob(File.expand_path('../../config/locales/**/*',__FILE__))

# Load list of disposable email domains
def config_file
  return local_file if File.exist?(local_file)
  gem_file
end

def local_file
  File.expand_path('config/valid_email.yml', __FILE__)
end

def gem_file
  File.expand_path('../../config/valid_email.yml', __FILE__)
end

BanDisposableEmailValidator.config = YAML.load_file(config_file)['disposable_email_services'] rescue []
