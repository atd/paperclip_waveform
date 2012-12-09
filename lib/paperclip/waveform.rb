module Paperclip
  class Waveform < Processor
    def initialize file, options = {}, attachment = nil
      super

      @basename = File.basename(file.path)
    end

    def make
      wav = Tempfile.new [ @basename, 'wav']
      wav.binmode

      begin
        Paperclip.run("ffmpeg", parameters, :source => "#{File.expand_path(file.path)}", :dest => File.expand_path(wav.path))
      rescue Cocaine::ExitStatusError => e
        raise Paperclip::Error, "error while processing wav for #{@basename}: #{e}"
      end

      png = Temfile.new [ @basename, 'png' ]

      Waveform.generate wav, png, options

      png
    end
  end
end
