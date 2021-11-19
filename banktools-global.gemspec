# frozen_string_literal: true

require_relative "lib/banktools/global/version"

Gem::Specification.new do |spec|
  spec.name          = "banktools-global"
  spec.version       = BankTools::Global::VERSION
  spec.authors       = [ "Henrik Nyh" ]
  spec.email         = [ "henrik@nyh.se" ]

  spec.summary       = "Validate and normalize international bank account numbers like IBAN/BIC. Based on iban-tools."
  spec.homepage      = "https://github.com/barsoom/banktools-global"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")
  spec.metadata      = { "rubygems_mfa_required" => "true" }

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/barsoom/banktools-global/blob/main/README.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.require_paths = [ "lib" ]
end
