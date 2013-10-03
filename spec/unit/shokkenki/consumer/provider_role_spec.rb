require_relative '../../spec_helper'
require 'shokkenki/consumer/ticket'
require 'shokkenki/consumer/provider_role'

describe Shokkenki::Consumer::ProviderRole do
  context 'when created' do

    let(:consumer) { double 'consumer' }

    subject { Shokkenki::Consumer::ProviderRole.new :name => 'providertron', :consumer => consumer}

    it 'has the name it is given' do
      expect(subject.name). to eq('providertron')
    end

    it 'has the consumer it is given' do
      expect(subject.consumer).to be(consumer)
    end
  end

  describe 'ticket' do

    let(:consumer) { double 'consumer', :name => 'consumertron' }
    subject { Shokkenki::Consumer::ProviderRole.new :name => 'providertron', :consumer => consumer}

    before do
      allow(Shokkenki::Consumer::Ticket).to receive(:new)
      subject.ticket
    end

    it 'has the consumer name' do
      expect(Shokkenki::Consumer::Ticket).to have_received(:new).with(hash_including(:consumer => 'consumertron'))
    end

    it 'has the provider name' do
      expect(Shokkenki::Consumer::Ticket).to have_received(:new).with(hash_including(:provider => 'providertron'))
    end
  end
end