module Wordstock
  # A wrapper class for third-party spell checking library
  #
  class SpellChecker

    BadWord = Class.new(StandardError)

    def self.check(word)
      validate_word(word)
      do_spell_check(word)
    end

    private

    def self.validate_word(word)
      return if word.present?

      raise BadWord.new("Word cannot be null or blank")
    end

    def self.do_spell_check(word)
      ::Spellchecker.check(word).first
    end
  end
end
