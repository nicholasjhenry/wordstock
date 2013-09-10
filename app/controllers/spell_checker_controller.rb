class SpellCheckerController < ApplicationController

  def check
    result = spell_check(params[:q])
    render json: result.to_json
  end

  private

  def spell_check(word)
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
