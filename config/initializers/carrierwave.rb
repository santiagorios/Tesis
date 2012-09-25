CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAINPNCB4O5NHQ6DBQ',
      :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'tesis-santiagorios'                     # required
end
