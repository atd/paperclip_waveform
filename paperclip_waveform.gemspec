$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "paperclip_waveform/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "paperclip_waveform"
  s.version     = PaperclipWaveform::VERSION
  s.authors     = ["Antonio Tapiador"]
  s.email       = ["atapiador@dit.upm.es"]
  s.homepage    = "https://github.com/atd/paperclip_waveform"
  s.summary     = "Paperclip post-processor that generates a waveform image from audio files."
  s.description = "Paperclip Waveform is a Paperclip post-processor that creates a png file with the waveform of the audio attachment ."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "paperclip"
  s.add_dependency "waveform", '~> 0.1.2'

  s.add_development_dependency "rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'debugger'
end
