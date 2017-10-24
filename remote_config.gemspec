# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "remote_config/version"

Gem::Specification.new do |spec|
  spec.name          = "remote_config"
  spec.version       = RemoteConfig::VERSION
  spec.authors       = ["Andres Scarpetta"]
  spec.email         = ["andresscarpetta@gmail.com"]

  spec.summary       = "This module allows remote access to authentication credentials of an application"
  spec.description   = "This module allows remote access to authentication credentials of an application " +
                       "by requesting them to a AWS Lambda function. **WARNING:** The AWS CLI should be " +
                       "configured for the host using this gem."
  spec.homepage      = "https://github.com/andresscarpetta/remote_config_ruby"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk-lambda", "~> 1"
  spec.add_dependency "json"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
