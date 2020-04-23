require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'player'
require 'board'
require 'game'
require 'pry'


def main
  #player = Player.new("Jean", "X")
  #board = Board.new
  #puts board.to_s
  #binding.pry
  game = Game.new
  game.launch_game
end

main