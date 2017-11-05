require 'spec_helper'

RSpec.describe Ekezetalakito::ClipboardHelper do
  describe 'pbcopy' do
    it 'should copy the given string to the Clipboard' do
      text = 'some text'
      Ekezetalakito::ClipboardHelper.pbcopy(text)
      expect(%x{pbpaste}).to eql(text)
    end
  end

  describe 'pbpaste' do
    it "should return with the Clipboard's content as a string" do
      text = 'alma'
      %x{printf '%s' '#{text}' | pbcopy}
      expect(Ekezetalakito::ClipboardHelper.pbpaste).to eql(text)
    end
  end
end
