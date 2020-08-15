# CarrierWave.configure do |config|
#   config.storage    = :aws
#   config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
#   config.aws_acl    = 'public-read'
#   config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7
#   config.aws_credentials = {
#     access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
#     secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
#     region:            ENV.fetch('AWS_REGION') # Required
#   }
# end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV.fetch('AWS_ACCESS_KEY_ID'),       # required
    :aws_secret_access_key  => ENV.fetch('AWS_SECRET_ACCESS_KEY'),   # required
    :region                 => ENV.fetch('AWS_REGION')               # required
  }
  config.fog_directory  = ENV.fetch('S3_BUCKET_NAME')                # required
  config.asset_host     = 'https://s3.amazonaws.com'                   # optional, defaults to nil
  config.fog_public     = true                                         # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}       # optional, defaults to {}
end