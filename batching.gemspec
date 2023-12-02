# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'batching'
  s.version     = '0.2.0'
  s.licenses    = ['MIT']
  s.summary     = 'Batch processing'
  s.description = 'Adds an in_batches to Enumerable'
  s.authors     = ['Doug Youch']
  s.email       = 'dougyouch@gmail.com'
  s.homepage    = 'https://github.com/dougyouch/batching'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.metadata    = { 'rubygems_mfa_required' => 'true' }

  s.required_ruby_version = '>= 2.0'
end
