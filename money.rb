class Money
  # Chap3: In ruby: this cannot be set to private
  attr_accessor :amount
  
  def initialize(amount)
    @amount = amount
  end

  def ==(money)
    self.class == money.class && @amount == money.amount
  end

  def self.dollar(amount)
    # Chap 8: How to cast from Dollar to parent Money?
    Dollar.new(amount)
  end
  
  def self.franc(amount)
    # Chap 8: How to cast from Dollar to parent Money?
    Franc.new(amount)
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

