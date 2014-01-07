require 'asset_sync'

desc "Sync assets with s3"
task :asset_sync do
  puts "## Syncing assets..."

  # Weird variable to set, but it turns on AssetSync logging
  ENV['RAILS_GROUPS'] = "assets"

  # Setup AssetSync
  AssetSync.configure do |config|
    config.enabled = true                     # Needs to be set, disabled by default
    config.gzip_compression = true            # Compresses the files before uploading, if not already compressed
    config.existing_remote_files = 'keep'     # Keeps the old versions online. Necessary when working before deploying
    config.fog_provider = 'AWS'               # There are others, I use S3
    config.fog_directory = 'com.cosm.sloth.cdn'
    config.aws_access_key_id = ENV['AWS_ACCESS_KEY_ID']
    config.aws_secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    config.prefix = 'assets'                  # Same as jekyll-asset setup in _config.yml
    config.public_path = Pathname('./_site')
  end

  # Do the work
  AssetSync.sync
end
