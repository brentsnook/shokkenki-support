require_relative '../../../spec_helper'
require 'shokkenki/consumer/stubber/interactions'

describe Shokkenki::Consumer::Stubber::Interactions do
  context 'finding an interaction for a request' do
    context 'when a interaction was found' do
      it 'finds the matching response'
    end

    context 'when no response was found' do
      it 'finds nothing'
    end
  end

  context 'deleting all interactions' do
    it 'removes all interactions'
  end

  context 'adding a new interaction' do
    it 'adds the interaction'
  end
end