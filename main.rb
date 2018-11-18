require_relative 'deck'
require_relative 'player'
require_relative 'user'
require_relative 'dealer'
require_relative 'bank'
require_relative 'my_game'
require_relative 'interface'

interface = Interface.new

game = MyGame.new(interface)
game.run
