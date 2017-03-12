require_relative 'life_counter'
require_relative 'word'

class Game
  def initialize
    @life_counter = LifeCounter.new
    @word = Word.new
  end

  def run
    game_loop
    check_result
  end

  def game_loop
    loop do
      announce_game_state

      user_char = read_input
      guessed = @word.char_exists?(user_char)

      if guessed
        break if @word.finished?
      else
        @life_counter.decrement
        break if @life_counter.dead?
      end
    end
  end

  def announce_game_state
    puts "Your life total is #{@life_counter.life_count}"
    puts "Your word is #{@word.visible_word}"
  end

  def read_input
    puts 'Enter your char:'
    gets.chomp!.to_s
  end

  def check_result
    if @word.finished?
      puts 'You win'
    else
      puts 'You dead'
    end

    puts "Your word is #{@word.secret_word}"
  end
end
