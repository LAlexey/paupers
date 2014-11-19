CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'] || 'xxx',     # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'] || 'xxx', # required
    #:region                 => 'Ireland',                  # optional, defaults to 'us-east-1'
    #:host                   => 's3-eu-west-1.amazonaws.com',             # optional, defaults to nil
    #:endpoint               => 'http://paupers.s3-eu-west-1.amazonaws.com' # optional, defaults to nil,
  }
  config.fog_directory  = 'paupers'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
end
