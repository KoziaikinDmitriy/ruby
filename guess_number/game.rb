class Game
  ATTEMPT_NUMBER = 5

  def initialize
    computer_number
    greets
  end

  def computer_number
    @computer_number = Random.new.rand(20)
  end

  def run
    if (@user_input)
      puts 'Random number reinitialized!'
      computer_number
    end
    game_course
  end

  private

  def greets
    puts 'Hello! To start game the game input the number from 1 to 20.' \
      'And try to guess it'
  end

  def game_course
    ATTEMPT_NUMBER.times do
      break if win?(user_input)
    end
  end

  def win?(user_number)
    if user_number == @computer_number
      puts 'You won!'
      true
    else
      puts "You didn't win!"
      clue = user_number > @computer_number ? 'try to go down' : 'try to go up'
      puts clue
      false
    end
  end

  def user_input
    puts 'Enter your number:'
    @user_input = gets.chomp!.to_i
  end
end
