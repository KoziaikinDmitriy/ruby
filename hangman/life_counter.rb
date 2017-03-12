class LifeCounter
  attr_reader :life_count

  DEFAULT_LIFE_COUNT = 7

  def initialize(life_count = DEFAULT_LIFE_COUNT)
    @life_count = life_count
  end

  def dead?
    @life_count == 0
  end

  def decrement
    @life_count -= 1
  end
end
