# module for all input prompts through game
module Input
  def get_guess(str)
    print str
    guess = gets.chomp[0].downcase
    until %w[r g b y p c].include? guess
      puts 'Guesses should be a valid color or letter.'.red
      puts 'Available colors are: red, green, blue, yellow, purple, and cyan.'
      guess = gets.chomp[0].downcase
    end
    color(guess)
  end

  def color(color)
    {
      'r' => 'red',
      'b' => 'blue',
      'g' => 'green',
      'p' => 'purple',
      'c' => 'cyan',
      'y' => 'yellow'
    }[color]
  end

  def commence_next
    print 'Commencing next turn press any button'
    gets.chomp
  end
end
