require_relative '../../app/services/capital_finder'

describe CapitalFinder do
  context '.for' do
    it 'finds the capital of the USA' do
      expect(described_class.for 'United States of America').to eq 'Washington D.C.'
    end

    it 'returns a nil if a country cannot be found' do
      expect(described_class.for 'ABC').to be_nil
    end
  end

  context '.code_of' do
    it 'finds the country code of the USA' do
      expect(described_class.send(:code_of, 'United States of America')).to eq 'us'
    end

    it 'returns a nil if a country cannot be found' do
      expect(described_class.send(:code_of, 'ABC')).to be_nil
    end
  end

  context '.capital_of' do
    subject {}

    it 'finds the capital of the given two-letter country code' do
      expect(described_class.for 'United States of America').to eq 'Washington D.C.'
    end

    it 'is not called if there is no country code' do
      expect(URI).not_to receive(:parse)
      described_class.for 'ABC'
    end
  end
end
