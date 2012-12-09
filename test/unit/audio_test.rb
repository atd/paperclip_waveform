require 'test_helper'

class AudioTest < ActiveSupport::TestCase
  def test_normal_paperclip_functioning
    Paperclip::Attachment.any_instance.expects(:post_process)
    audio = Audio.new file: File.open("#{File.dirname(__FILE__)}/../fixtures/Example.ogg")
    assert audio.file.post_processing
    assert audio.save
    assert File.exists?(audio.file.path)
  end
end
