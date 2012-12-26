module Paperclip
  class Waveform < Processor
    def initialize file, options = {}, attachment = nil
      super

      @basename = File.basename(file.path)
      @waveform_opts = options[:convert_options]
      @waveform_opts[:force] = true
    end

    def make
      wav = Tempfile.new [ @basename, '.wav']
      wav.binmode

      begin
        Paperclip.run("ffmpeg", "-y -i :source -f wav :dest", :source => "#{File.expand_path(file.path)}", :dest => File.expand_path(wav.path))
      rescue Cocaine::ExitStatusError => e
        raise Paperclip::Error, "error while processing wav for #{@basename}: #{e}"
      end

      png = Tempfile.new [ @basename, 'png' ]

      ::Waveform.generate wav, png, @waveform_opts

      png
    end
  end
end
