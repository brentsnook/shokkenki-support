require_relative '../../../spec_helper'
require 'shokkenki/term/core_ext/object'

describe Object do

  context 'as a shokkenki term' do
    let(:object) { Object.new }
    subject { object.to_shokkenki_term }

    it 'is a string term' do
      expect(subject.type).to eq(:string)
    end

    it 'has the object converted to a string as value' do
      expect(subject.value).to eq(object.to_s)
    end

  end
end