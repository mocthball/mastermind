require_relative 'display.rb'

# GameBoard class contains board array of rows(guess attempts), the code to break along with guess attempt keys
class GameBoard
  include Display
  attr_reader :board, :code, :rows

  def initialize(code: Array.new(4, 'white'), rows: 12, board: empty_board(rows))
    @rows = rows
    @code = code
    @board = board
  end

  def print_board
    Display.top_row
    12.times do |i|
    end
  end

  def self.create_row(guess: Array.new(4, 'empty'), keys: Array.new(4, 'empty'))
    [{ guess: guess, keys: keys }]
  end

  def empty_board(rows)
    Array.new(rows) { GameBoard.create_row[0] }
  end

  def insert_guess(row_index, index, guess)
    @board[row_index][:guess][index] = guess
  end

  def create_keys(row_index)
    @board[row_index][:guess].each_with_index do |str, i|
      @board[row_index][:keys][i] = keys_select(str, i)
      puts str
    end
  end

  def keys_select(str, index)
    if @code[index].eql?(str)
      'red'  # return approraite colour
    elsif @code.include?(str)
      'white'
    else
      'empty'
    end
  end

  def board_template
    game_rows = board
                .map { |obj| game_row(obj[:guess], obj[:keys]) }
                .join("\n" + middle_row + "\n")
    top_row + "\n" + game_rows + "\n" + bottom_row
  end

  def code_break
    @board.each do |input|
      return true if @code == input[:guess]
    end
    false
  end
end
