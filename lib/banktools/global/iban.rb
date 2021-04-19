# frozen_string_literal: true

require "yaml"
require_relative "errors"

class BankTools::Global::IBAN
  E = BankTools::Global::Errors

  def initialize(raw)
    @raw = raw
    @pre_normalized = raw.to_s.strip.upcase
  end

  def valid?
    errors.empty?
  end

  def errors
    rule = rules[country_code]
    return [ E::UNKNOWN_COUNTRY ] unless rule

    length = rule.fetch("length")
    return [ E::WRONG_LENGTH ] unless @pre_normalized.length == length

    re = rule.fetch("bban_pattern")
    return [ E::BAD_FORMAT ] unless bban.match?(re)

    return [ E::BAD_CHECKSUM ] unless good_checksum?

    []
  end

  def normalize
     @pre_normalized.gsub(/.{4}/, '\0 ').strip
  end

  private

  def good_checksum?
    number_string =
      (bban + country_code + check_digits).chars.map { |char|
        case char
        when "0".."9" then char
        when "A".."Z" then (char.ord - 55).to_s
        else raise "Unexpected byte '#{byte}' in IBAN '#{normalize}'!"
        end
      }.join

    number_string.to_i % 97 == 1
  end

  def country_code
    @pre_normalized[0..1]
  end

  def check_digits
    @pre_normalized[2..3]
  end

  def bban
    @pre_normalized[4..-1]
  end

  def rules
    @@rules ||=
      YAML.load(File.read(File.join(File.dirname(__FILE__), "iban_rules.yml")))
        .transform_values { |h| h.merge("bban_pattern" => /\A#{h.fetch("bban_pattern")}\z/) }
  end
end
