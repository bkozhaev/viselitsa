require 'rspec'
require_relative '../lib/game.rb'

describe 'Game.rb' do

  it 'return user wins the game ' do
    game = Game.new('слово')

    expect(game.status).to eq (:in_progress)
    game.next_step('с')
    game.next_step('л')
    game.next_step('о')
    game.next_step('в')
    game.next_step('о')

    expect(game.status).to eq :won
    expect(game.errors).to eq 0
    expect(game.good_letters.length).to eq 4
    expect(game.bad_letters.length).to eq 0
  end

  it 'return user loos the game' do
    game = Game.new('бык')

    expect(game.status).to eq (:in_progress)
    game.next_step('a')
    game.next_step('й')
    game.next_step('х')
    game.next_step('я')
    game.next_step('с')
    game.next_step('ю')
    game.next_step('ж')

    expect(game.status).to eq :lost
    expect(game.bad_letters.each {|item| item}).to eq %w(A Й И Х Я С Ю Ж)

  end
end