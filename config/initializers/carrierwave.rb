CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        
  config.fog_credentials = {
    provider:              'AWS',                        
    aws_access_key_id:     ENV['AMAZON_KEY'],                        
    aws_secret_access_key: ENV['AMAZON_SECRET'],                      
    region:                'ap-southeast-1',                  
  }
  config.fog_directory  = ENV['AMAZON_BUCKET_NAME']                          
  config.fog_public     = false
end