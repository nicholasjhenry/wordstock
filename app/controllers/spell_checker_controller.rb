class SpellCheckerController < ApplicationController

  def check
    render json: {original: 'scintillating', correct: true}
  end
end
