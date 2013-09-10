require 'spec_helper'

describe "spell check" do
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

      json = JSON.parse(response.body)

      match = JSONSelect('.original').match(json)
      expect(match).to eq(correct_word)

      match = JSONSelect('.correct').match(json)
      expect(match).to be_true
    end
  end
end
