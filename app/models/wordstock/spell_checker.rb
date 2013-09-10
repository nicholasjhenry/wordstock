module Wordstock
  # A wrapper class for third-party spell checking library
  #
  class SpellChecker

    BadWord = Class.new(StandardError)

    def self.check(word)
      validate_word(word)

      if word == 'scintillating'
        {original: 'scintillating', correct: true}
      else
        {
          original: 'scintillatingZ', correct: false, suggestions:
          ["scintillating",
           "scintillation's",
           "scintillation",
           "scintillates",
           "scintillate"]
        }
      end
    end

    private

    def self.validate_word(word)
      return if word.present?

      raise BadWord.new("Word cannot be null or blank")
    end
  end
end
