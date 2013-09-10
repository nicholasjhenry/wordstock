class SpellCheckerController < ApplicationController

  def check
    result = spell_check(params[:q])
    render json: result.to_json
  end

  private

  def spell_check(word)
    Wordstock::SpellChecker.check(word)
  end
end
