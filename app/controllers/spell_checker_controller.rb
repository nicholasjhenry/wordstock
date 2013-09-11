class SpellCheckerController < ApplicationController

  rescue_from Wordstock::SpellChecker::BadWord, with: :bad_word

  def check
    result = spell_check(params[:q])

    respond_to do |format|
      format.json { render json: result.to_json }
    end
  end

  private

  def spell_check(word)
    Wordstock::SpellChecker.check(word)
  end

  def bad_word(error)
    respond_to do |format|
      format.json { render json: format_messages(error.message), status: :bad_request }
    end
  end

  def format_messages(messages)
    {messages: Array(messages)}.to_json
  end
end
