#require 'carrierwave'
#require 'a9s_swift'
#
#BUCKET_NAME = "images"
#
#if Rails.env.production?
#  Anynines::Swift::Utility.configure_carrierwave(BUCKET_NAME,{fog_public: false}, "openstack")
#end

#CarrierWave.configure do |config|
#	config.fog_credentials = {
#		:provider               => 'AWS',                        # required
#		:aws_access_key_id      => ENV["AWS_ACCESS_KEY"],                        # required
#		:aws_secret_access_key  => ENV["AWS_SECRET_KEY"],                     # required
#		:region                 => ENV["S3_REGION"],                  # optional, defaults to 'us-east-1'
#	}
#
#	config.cache_dir = "#{Rails.root}/tmp/uploads"
#
#	config.fog_directory  = ENV["AWS_BUCKET"]                             # required
#end
