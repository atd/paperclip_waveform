class Audio < ActiveRecord::Base
  attr_accessible :file

  has_attached_file :file, styles: { waveform: { format: :png, convert_options: {} } },
                    processors: [ :waveform ]
end
