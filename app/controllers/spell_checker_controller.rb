class SpellCheckerController < ApplicationController

  rescue_from Wordstock::SpellChecker::BadWord, with: :bad_word

  def check
    result = spell_check(params[:q])

    respond_to do |format|
      format.json { render json: result }
    end
  end

  private

  def spell_check(word)
    Wordstock::SpellChecker.check(word)
  end

  def bad_word(error)
    respond_to do |format|
      format.json { render json: format_message(error.message), status: :bad_request }
    end
  end

  def format_message(message)
    {message: message}
  end
end
