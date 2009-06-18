class Dollar
  # Chap3: In ruby: this cannot be set to private
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

  def ==(dollar)
    @amount == dollar.amount
  end
end

class Franc
  # Chap3: In ruby: this cannot be set to private
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def times(multiplier)
    Franc.new(@amount * multiplier)
  end

  def ==(franc)
    @amount == franc.amount
  end
end
