class SpellCheckerController < ApplicationController

  rescue_from Wordstock::SpellChecker::BadWord, with: :bad_word

  def check
    return unless stale?(word, public: true)

    result = spell_check(word)

    respond_to do |format|
      format.json { render json: result }
    end
  end

  private

  def word
    params[:q]
  end

  def spell_check(new_word)
    Wordstock::SpellChecker.check(new_word)
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
