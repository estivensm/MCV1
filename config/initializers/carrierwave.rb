CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAI5Q7NBRKUNC74IKQ',                        # required
    :aws_secret_access_key  => 'n00vZM9rpgrOWzx1g0Jm+ePt9gpgs2nzAYjgaBXAP'                        # required
  }
  config.fog_directory  = "segundobk"                     # required
end