require_relative '../../../spec_helper'
require 'shokkenki/term/core_ext/date_time'

describe DateTime do

  context 'as a shokkenki term' do
    subject { DateTime.new.to_shokkenki_term }

    it 'is a date time term' do
      expect(subject.type).to eq(:date_time)
    end

  end
end