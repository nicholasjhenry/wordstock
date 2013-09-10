require 'spec_helper'

module Wordstock
  describe SpellChecker do

    context "given a null word" do
      it "raises an exception" do
        expect{ SpellChecker.check(nil) }.to raise_error(Wordstock::SpellChecker::BadWord)
      end
    end

    context "given a correctly spelled word" do
      let(:actual) {  SpellChecker.check("scintillating") }

      it "returns the original word" do
        expect(actual[:original]).to eq("scintillating")
      end

      it "flags the word as correct" do
        expect(actual[:correct]).to be_true
      end

      it "returns no suggestions" do
        expect(actual[:suggestions]).to be_nil
      end
    end

    context "given an incorrectly spelled word" do
      let(:actual) {  SpellChecker.check("scintillatingZ") }

      it "returns the original word" do
        expect(actual[:original]).to eq("scintillatingZ")
      end

      it "flags the word as incorrect" do
        expect(actual[:correct]).to be_false
      end

      it "returns no suggestions" do
        expect(actual[:suggestions]).to eq(
          ["scintillating",
           "scintillation's",
           "scintillation",
           "scintillates",
           "scintillate"]
        )
      end
    end
  end
end
