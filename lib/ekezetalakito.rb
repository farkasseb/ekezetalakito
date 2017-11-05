require 'ekezetalakito/version'

module Ekezetalakito
  ACUTE_ACCENTS = ["\u0301", "\u0308" ,"\u030b"].freeze

  # Hungarian accented letters:
  # árvíztűrő tükörfúrógép
  # ÁRVÍZTŰRŐ TÜKÖRFÚRÓGÉP
  ACCENTED_LETTERS_MAP = {
    á: "a\u0301",
    í: "i\u0301",
    ű: "u\u030b", # Latin Extended-A
    ő: "o\u030b", # Latin Extended-A
    ü: "u\u0308",
    ö: "o\u0308",
    ú: "u\u0301",
    ó: "o\u0301",
    é: "e\u0301",
    Á: "A\u0301",
    Í: "I\u0301",
    Ű: "U\u030b", # Latin Extended-A
    Ő: "O\u030b", # Latin Extended-A
    Ü: "U\u0308",
    Ö: "O\u0308",
    Ú: "U\u0301",
    Ó: "O\u0301",
    É: "E\u0301"
  }.freeze

  def self.convert(text)
    if contains_acute_accent(text)
      ACCENTED_LETTERS_MAP.each do |char, acute_char|
        text.gsub!(acute_char, char.to_s)
      end
    end

    text
  end

  def self.contains_acute_accent(text)
    ACUTE_ACCENTS.each do |accent|
      return true unless text.index(accent).nil?
    end

    false
  end
end
