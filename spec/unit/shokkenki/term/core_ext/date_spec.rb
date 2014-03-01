require_relative '../../../spec_helper'
require 'shokkenki/term/core_ext/date'

describe Date do

  context 'as a shokkenki term' do
    subject { Date.new.to_shokkenki_term }

    it 'is a date term' do
      expect(subject.type).to eq(:date)
    end

  end
end