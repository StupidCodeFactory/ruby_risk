require 'spec_helper'

RSpec.describe RubyRisk::Game do
  let(:player_one) do
    { name: 'Yann', color: RubyRisk::Player::COLORS[0] }
  end

  let(:player_two) do
    { name: 'Yann', color: RubyRisk::Player::COLORS[1] }
  end

  let(:player_three) do
    { name: 'Katya', color: RubyRisk::Player::COLORS[2] }
  end

  let(:player_four) do
    { name: 'Ivan', color: RubyRisk::Player::COLORS[3] }
  end

  let(:player_five) do
    { name: 'Jade', color: RubyRisk::Player::COLORS[4] }
  end

  let(:player_six) do
    { name: 'Santiago', color: RubyRisk::Player::COLORS[5] }
  end

  let(:players) do
    [
      player_one, player_two, player_three, player_four, player_five, player_six
    ]
  end

  context 'when the maximum amount of player has not be reached' do
    it 'adds a player' do
      expect do
        subject.add_player(player_one)
      end.to change { subject.players }.from([]).to([instance_of(RubyRisk::Player)])
    end
  end

  context 'when the maximum amount of player has be reached' do
    before do
      players.each do |player|
        subject.add_player(player)
      end
    end

    it 'raises an error' do
      expect do
        subject.add_player(player_one)
      end.to raise_error(ArgumentError, 'You have reached the maximum amount of players.')
    end
  end

  describe 'integration' do
    let(:game) { subject }

    def add_players
      players.each do |player|
        game.add_player(player)
      end
    end

    it 'plays' do
      add_players

      game.start

      game.deal_infanteries

      game.players.each do |player|
        expect(player.infanteries.size).to eq(20)
      end

      first_player = game.roll_dice(DiceRoll::Outcomes::ClaimTerritory.new).player
      pp "First player is: #{first_player.name}"

      game.claims_territories.join

      pp first_player.occupied_territories
      pp first_player.infanteries
      # game.

    end
  end
end
