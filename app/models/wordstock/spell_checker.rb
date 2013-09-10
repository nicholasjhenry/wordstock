module Wordstock
  # A wrapper class for third-party spell checking library
  #
  class SpellChecker
    def self.check(word)
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
  end
end
