require 'spec_helper'

RSpec.describe RubyRisk::Game do
  let(:player_one) do
    { name: 'Yann', color: RubyRisk::Player::COLORS[0] }
  end

  let(:player_two) do
    { name: 'Kevin', color: RubyRisk::Player::COLORS[1] }
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
      expect { subject.add_player(player_one) }.to change { subject.players }.from([]).to([instance_of(RubyRisk::Player)])
    end
  end

  context 'when the maximum amount of player has be reached' do
    before { players.each { |player| subject.add_player(player) } }

    it 'raises an error' do
      expect { subject.add_player(player_one) }.to raise_error(ArgumentError, 'You have reached the maximum amount of players.')
    end
  end

  describe 'integration' do
    let(:game) { subject }

    def add_players
      players.each { |player| game.add_player(player) }
    end

    it 'plays' do
      add_players

      game.start
      game.deal_infanteries
      game.players.each { |player| expect(player.infanteries.size).to eq(20) }

      while (territory = game.unclaimed_territories.sample)
        player = game.players.next_player
        game.claim(territory, player)
        game.players.next_player
      end
      game.players.reset_turns!

      expect(game.countries_card_deck.cards.size).to eq(44)
      expect(game.missions_card_deck.cards.size).to eq(14)
      expect(game.missions_card_deck.cards.first.mission).to eq("Destroy all green troops")

      player = game.players.next_player

      player.start_turn

    end
  end
end
