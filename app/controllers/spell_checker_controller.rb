class SpellCheckerController < ApplicationController

  include ActionController::MimeResponds

  def check
    result = spell_check(params[:q])

    respond_to do |format|
      format.json { render json: result.to_json }
    end

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
