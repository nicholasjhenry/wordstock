class SpellCheckerController < ApplicationController

  def check
    result = spell_check(params[:q])
    render json: result.to_json

  rescue Wordstock::SpellChecker::BadWord => e
    render json: format_messages(e.message), status: :bad_request
  end

  private

  def spell_check(word)
    Wordstock::SpellChecker.check(word)
  end

  def format_messages(messages)
    {messages: Array(messages)}.to_json
  end
end
