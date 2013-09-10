require 'spec_helper'
require 'support/custom_request_matchers'

describe "spell check" do

  include CustomRequestMatchers

  let(:headers) do
    {
      'HTTP_ACCEPT' => 'application/json',
      'HTTP_CONTENT_TYPE' => 'application/json'
    }
  end

  context "given a correctly spelled word" do
    let(:correct_word) { 'scintillating' }

    it "returns a response the word is correct" do
      get '/spell', {q: correct_word}, headers

      expect(response.status).to eq(200)
      expect(response.body).to original_word_eq(correct_word)
      expect(response.body).to correctly_spelled?
    end
  end
end
