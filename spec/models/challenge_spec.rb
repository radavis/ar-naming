require 'spec_helper'

describe Challenge do
  let(:challenge) { Challenge.create(model_name: 'GoatContainer') }

  describe '#model' do
    it 'returns the capitalized, singular form of the model name' do
      expect(challenge.model).to eq('Goat Container')
    end
  end

  describe '#model_file_name' do
    it 'returns the lowercase, singular form' do
      expect(challenge.model_file_name).to eq('goat_container.rb')
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

  describe '#migration_file_name' do
    it 'returns the migration filename' do
      expect(challenge.migration_file_name).to end_with('create_goat_containers.rb')
    end
  end

  describe '#controller_name' do
    it 'returns the capitalized, plural form of the model name' do
      expect(challenge.controller_name).to eq('GoatContainersController')
    end
  end

  describe '#controller_file_name' do
    it 'returns the controller filename' do
      expect(challenge.controller_file_name).to eq('goat_containers_controller.rb')
    end
  end

  describe '#views_folder_name' do
    it 'returns the lowercase, plural form' do
      expect(challenge.views_folder_name).to eq('goat_containers')
    end
  end
end
