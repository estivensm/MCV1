CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJ3QDXZRZCMX4IGUQ',                        # required
    :aws_secret_access_key  => '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'                         # required
  }
  config.fog_directory  = "primerbk"                     # required
end