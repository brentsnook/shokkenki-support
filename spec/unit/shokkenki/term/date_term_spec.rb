require_relative '../../spec_helper'
require 'shokkenki/term/date_term'

describe Shokkenki::Term::DateTerm do

  context 'when created' do
    let(:date) { Date.new }
    let(:datelike) { double('date like', :to_date => date) }

    subject { Shokkenki::Term::DateTerm.new datelike }

    it "has a type of 'date'" do
      expect(subject.type).to eq(:date)
    end

    it 'forces the given value into a date' do
      expect(subject.value).to eq(date)
    end
  end

  context 'created from json' do
    let(:term) do
      Shokkenki::Term::DateTerm.from_json(
        :value => '2014-03-01'
      )
    end

    it 'parses the value' do
      expect(term.value).to eq(Date.new(2014, 03, 01))
    end
  end

  context 'generating an example' do
    subject do
      Shokkenki::Term::DateTerm.new Date.new(2014, 1, 3)
    end

    it 'uses the exact value' do
      expect(subject.example).to eq(Date.new(2014, 1, 3))
    end
  end

  context 'matching a compare' do
    subject do
      Shokkenki::Term::DateTerm.new Date.new(2014, 6, 3)
    end

    context 'when the compare is the same' do
      let(:compare) { Date.new(2014, 6, 3) }
      it('matches'){ expect(subject.match?(compare)).to be_true }
    end

    context 'when the compare is not the same' do
      let(:compare) { Date.new(2014, 6, 1) }
      it("doesn't match"){ expect(subject.match?(compare)).to be_false }
    end

    context 'when there is no compare' do
      let(:compare) { nil }
      it("doesn't match"){ expect(subject.match?(compare)).to be_false }
    end

    context 'when the compare can be converted to a date' do
      let(:compare) { DateTime.parse('2014-06-03') }
      it('converts the compare into a date'){ expect(subject.match?(compare)).to be_true }
    end

    context "when the compare can't be converted to a date" do
      let(:compare) { :'2014-06-03' }
      it('converts the compare into a string and attempts to parse it') do
        expect(subject.match?(compare)).to be_true
      end
    end

  end

  context 'as a hash' do

    subject { Shokkenki::Term::DateTerm.new Date.new(2014, 5, 4) }

    it 'has a type' do
      expect(subject.to_hash[:type]).to eq(:date)
    end

    it 'has a value which is the ISO8601 representation of the date' do
      expect(subject.to_hash[:value]).to eq('2014-05-04')
    end
  end
end