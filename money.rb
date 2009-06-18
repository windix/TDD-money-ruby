class Money
  # Chap3: In ruby: this cannot be set to private
  attr_accessor :amount
  
  def initialize(amount)
    @amount = amount
  end

  def ==(money)
    @amount == money.amount
  end
end

class Dollar < Money
  def times(multiplier)
    Dollar.new(@amount * multiplier)
  end

end

class Franc < Money
  def times(multiplier)
    Franc.new(@amount * multiplier)
  end
end

