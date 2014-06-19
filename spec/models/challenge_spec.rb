require 'spec_helper'

describe Challenge do
  let(:challenge) { Challenge.create(model_name: 'GoatContainer') }

  describe '#model' do
    it 'returns the capitalized, singular form of the model name' do
      expect(challenge.model).to eq('Goat Container')
    end
  end

  describe '#table_name' do
    it 'returns the lowercase, plural form of the model name' do
      expect(challenge.table_name).to eq('goat_containers')
    end
  end

  describe '#migration_name' do
    it 'returns the name of migration' do
      expect(challenge.migration_name).to eq('CreateGoatContainers')
    end
  end

end
