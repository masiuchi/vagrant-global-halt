
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vagrant/global_halt/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-global_halt"
  spec.version       = Vagrant::GlobalHalt::VERSION
  spec.authors       = ["Masahiro IUCHI"]
  spec.email         = ["masahiro.iuchi@gmail.com"]
  spec.licenses      = ['MIT']

  spec.summary       = %q{Vagrant plugin to halt all virtual machines.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/masiuchi/vagrant-global-halt"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/masiuchi/vagrant-global-halt"
    spec.metadata["changelog_uri"] = spec.metadata['source_code_uri']
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
end
