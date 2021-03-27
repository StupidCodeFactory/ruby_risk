require 'spec_helper'

RSpec.describe RubyRisk::Player do
  let(:name)  { 'Yann' }
  let(:color) { described_class::COLORS.sample }
  let(:id)    { '60634e33-94d5-458b-b4f3-23b810c7fc89' }

  subject { described_class.new(name: name, color: color) }

  describe 'validations' do

    it 'assigns the name' do
      expect(subject.name).to eq(name)
    end

    it 'assigns the color' do
      expect(subject.color).to eq(color)
    end

    it 'assigns the id' do
      expect(SecureRandom).to receive(:uuid).and_return(id)
      expect(subject.id).to eq(id)
    end
  end

end
