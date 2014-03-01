require_relative '../../../spec_helper'
require 'shokkenki/term/core_ext/time'

describe Time do

  context 'as a shokkenki term' do
    subject { Time.new.to_shokkenki_term }

    it 'is a date time term' do
      expect(subject.type).to eq(:date_time)
    end

  end
end