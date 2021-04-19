# frozen_string_literal: true

class BankTools::Global::BIC
  # http://sv.wikipedia.org/wiki/ISO_9362
  RE = /\A
    [A-Z]{4}
    ([A-Z]{2})
    [A-Z0-9]{2}
    (?:[A-Z0-9]{3})?
  \z/ix

  COUNTRY_CODES = %w[ AD AE AF AG AI AL AM AN AO AQ AR AS AT AU AW AX AZ BA BB BD BE BF BG BH BI BJ BL BM BN BO BR BS BT BV BW BY BZ CA CC CD CF CG CH CI CK CL CM CN CO CR CU CV CX CY CZ DE DJ DK DM DO DZ EC EE EG EH ER ES ET FI FJ FK FM FO FR FX GA GB GD GE GF GG GH GI GL GM GN GP GQ GR GT GU GW GY HK HM HN HR HT HU ID IE IL IM IN IO IQ IR IS IT JE JM JO JP KE KG KH KI KM KN KP KR KW KY KZ LA LB LC LI LK LR LS LT LU LV LY MA MC MD ME MG MH MK ML MM MN MO MP MQ MR MS MT MU MV MW MX MY MZ NA NC NE NF NG NI NL NO NP NR NU NZ OM PA PE PF PG PH PK PL PM PN PR PT PW PY QA RE RO RS RU RW SA SB SC SD SE SG SH SI SJ SK SL SM SN SO SR ST SV SY SZ TC TD TF TG TH TJ TK TM TN TO TP TR TT TV TW TZ UA UG UM US UY UZ VA VC VE VG VI VN VU WF WS YE YT ZA ZM ZW ]

  def initialize(raw)
    @raw = raw
  end

  def valid?
    errors.empty?
  end

  def errors
    match = @raw.to_s.match(RE)
    return [ :bad_format ] unless match

    country_code = match.captures.first.upcase
    return [ :unknown_country ] unless COUNTRY_CODES.include?(country_code)

    []
  end
end
