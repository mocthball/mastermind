require_relative 'gameboard.rb'
require_relative 'display.rb'
require_relative 'input.rb'

# encapuslates and runs elements for Mastermind game play
class Mastermind
  include Display
  include Input

  attr_reader :rows

  def initialize()
    @game = GameBoard.new(code: random_code(4))
    @turn = -1
  end

  def random_code(size)
    colours = %w[red green blue yellow purple cyan]
    colours.sample(size)
  end

  def game_play
    # consists of starting next turn
    next_turn until game_over
    clear_screen
    puts @game.board_template
    puts 'Game over!'
  end

  def next_turn
    # turn attribute to denote row being used
    @turn += 1
    #commence_next
    clear_screen
    input_of_four
    @game.create_keys(@turn)
    puts @game.board_template
  end

  def input_of_four
    # 4 times loop to fill array with guess
    4.times do |i|
      puts @game.board_template
      @game.insert_guess(@turn, i, get_guess("Take a guess index (#{i+1}): "))
    end
  end

  def game_over
    return 'You lose' if rows == @turn + 1
    return 'You Win!' if @game.code_break

    false
  end
end

game = Mastermind.new
game.game_play
