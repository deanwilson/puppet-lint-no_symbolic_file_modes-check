Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-no_symbolic_file_modes-check'
  spec.version     = '1.0.0'
  spec.homepage    = 'https://github.com/deanwilson/puppet-lint-no_symbolic_file_modes-check'
  spec.license     = 'MIT'
  spec.author      = 'Dean Wilson'
  spec.email       = 'dean.wilson@gmail.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'puppet-lint no_symbolic_file_modes check'
  spec.description = <<-EOF
    Extends puppet-lint to ensure all file resource modes are defined as octal
    values and not symbolic ones. 
  EOF

  spec.add_dependency             'puppet-lint', '~> 1.1'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rake'
end
