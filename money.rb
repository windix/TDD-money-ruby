class Money
  # Chap3: In ruby: this cannot be set to private
  attr_accessor :amount
  attr_reader :currency
  
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(money)
    self.class == money.class && @amount == money.amount
  end

  def self.dollar(amount)
    # Chap 8: How to cast from Dollar to parent Money?
    Dollar.new(amount, "USD")
  end
  
  def self.franc(amount)
    # Chap 8: How to cast from Dollar to parent Money?
    Franc.new(amount, "CHF")
  end
end

class Dollar < Money
  def times(multiplier)
    Money.dollar(@amount * multiplier)
  end
end

class Franc < Money
  def times(multiplier)
    Money.franc(@amount * multiplier)
  end
end

