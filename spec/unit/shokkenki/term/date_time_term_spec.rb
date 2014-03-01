require_relative '../../spec_helper'
require 'shokkenki/term/date_time_term'

describe Shokkenki::Term::DateTimeTerm do

  context 'when created' do
    let(:datetime) { DateTime.new }
    let(:datetimelike) { double('datetime like', :to_datetime => datetime) }

    subject { Shokkenki::Term::DateTimeTerm.new datetimelike }

    it "has a type of 'date_time'" do
      expect(subject.type).to eq(:date_time)
    end

    it 'forces the given value into a date time' do
      expect(subject.value).to eq(datetime)
    end
  end

  context 'created from json' do
    let(:term) do
      Shokkenki::Term::DateTimeTerm.from_json(
        :value => '2001-02-03T04:05:06+07:00'
      )
    end

    it 'parses the value' do
      expect(term.value).to eq(DateTime.iso8601('2001-02-03T04:05:06+07:00'))
    end
  end

  context 'generating an example' do
    let(:datetime) { DateTime.new }
    subject do
      Shokkenki::Term::DateTimeTerm.new datetime
    end

    it 'uses the exact value' do
      expect(subject.example).to eq(datetime)
    end
  end

  context 'matching a compare' do
    subject do
      Shokkenki::Term::DateTimeTerm.new DateTime.iso8601('2001-02-03T04:05:06+07:00')
    end

    context 'when the compare is the same' do
      let(:compare) { DateTime.iso8601('2001-02-03T04:05:06+07:00') }
      it('matches'){ expect(subject.match?(compare)).to be_true }
    end

    context 'when the compare is not the same' do
      let(:compare) { DateTime.iso8601('2006-01-06T04:05:06+07:00') }
      it("doesn't match"){ expect(subject.match?(compare)).to be_false }
    end

    context 'when there is no compare' do
      let(:compare) { nil }
      it("doesn't match"){ expect(subject.match?(compare)).to be_false }
    end

    context 'when the compare can be converted to a date time' do
      let(:compare) { Time.parse('2001-02-03T04:05:06+07:00')  }
      it('converts the compare into a date'){ expect(subject.match?(compare)).to be_true }
    end

    context "when the compare can't be converted to a date" do
      let(:compare) { :'2001-02-03T04:05:06+07:00' }
      it('converts the compare into a string and attempts to parse it') do
        expect(subject.match?(compare)).to be_true
      end
    end

  end

end



#   context 'as a hash' do

#     subject { Shokkenki::Term::DateTerm.new Date.new(2014, 5, 4) }

#     it 'has a type' do
#       expect(subject.to_hash[:type]).to eq(:date)
#     end

#     it 'has a value which is the ISO8601 representation of the date' do
#       expect(subject.to_hash[:value]).to eq('2014-05-04')
#     end
#   end
# end