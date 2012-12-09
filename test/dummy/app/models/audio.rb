class Audio < ActiveRecord::Base
  attr_accessible :file

  has_attached_file :file, styles: { waveform: {} }
end
