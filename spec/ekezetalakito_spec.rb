require 'spec_helper'

RSpec.describe Ekezetalakito do
  it 'has a version number' do
    expect(Ekezetalakito::VERSION).not_to be nil
  end

  describe 'contains_acute_accent' do
    it 'is false if there is no acute accent in the text used by Hungarian ABC' do
      text = 'simple text without accented letters'
      expect(Ekezetalakito.contains_acute_accent(text)).to be false
    end

    it 'is true if there is any occurence of acute accents used by the Hungarian ABC', :aggregate_failures do
      expect(Ekezetalakito.contains_acute_accent("alma\u0301k")).to be true
      expect(Ekezetalakito.contains_acute_accent("to\u030br")).to be true
      expect(Ekezetalakito.contains_acute_accent("tu\u0308zes")).to be true
    end
  end

  describe 'convert' do
    it "doesn't change text without accents" do
      text = 'simple text without accented letters'
      converted_text = Ekezetalakito.convert(text.dup)
      expect(converted_text.chars).to eq(text.chars)
    end

    it "doesn't change text with non-Hungarian accents" do
      text = 'Le château est beau.'
      converted_text = Ekezetalakito.convert(text.dup)
      expect(converted_text.chars).to eq(text.chars)
    end

    it "doesn't change text correct Hungarian accents" do
      text = 'árvíztűrő tükörfúrógép ÁRVÍZTŰRŐ TÜKÖRFÚRÓGÉP'
      converted_text = Ekezetalakito.convert(text.dup)
      expect(converted_text.chars).to eq(text.chars)
    end

    it 'does change text with acute accent' do
      text = "alma\u0301k"
      converted_text = Ekezetalakito.convert(text.dup)
      expect(converted_text).not_to eql(text)
    end

    it 'does replace all acute characters with correct Hungarian characters' do
      text = "a\u0301rvi\u0301ztu\u030bro\u030b tu\u0308ko\u0308rfu\u0301ro\u0301ge\u0301p A\u0301RVI\u0301ZTU\u030bRO\u030b TU\u0308KO\u0308RFU\u0301RO\u0301GE\u0301P"
      expected_result = 'árvíztűrő tükörfúrógép ÁRVÍZTŰRŐ TÜKÖRFÚRÓGÉP árvíztűrő tükörfúrógép ÁRVÍZTŰRŐ TÜKÖRFÚRÓGÉP'
      converted_text = Ekezetalakito.convert("#{text.dup} #{text.dup}")
      expect(converted_text.chars).to eq(expected_result.chars)
    end
  end
end
