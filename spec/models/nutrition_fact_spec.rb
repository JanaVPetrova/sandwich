# frozen_string_literal: true

RSpec.describe NutritionFact do
  describe '#calories' do
    subject { described_class.new(1, 1, 1).calories }

    it { is_expected.to eq 17 }
  end

  describe '#+' do
    subject { fact + other }

    let(:fact) { described_class.new(1, 1, 1) }
    let(:other) { described_class.new(1, 1, 1) }

    it do
      is_expected.to be_instance_of(described_class)
      is_expected.to have_attributes(protein_g: 2, fat_g: 2, carbohydrates_g: 2)
    end
  end

  describe '#scale' do
    subject { fact.scale(3) }

    let(:fact) { described_class.new(1, 1, 1) }

    it do
      is_expected.to have_attributes(protein_g: 3, fat_g: 3, carbohydrates_g: 3)
    end
  end
end
