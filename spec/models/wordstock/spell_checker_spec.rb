require 'spec_helper'

module Wordstock
  describe SpellChecker do

    context "given a null word" do
      it "raises an exception" do
        expect{ SpellChecker.check(nil) }.to raise_error(Wordstock::SpellChecker::BadWord)
      end
    end
  end
end
