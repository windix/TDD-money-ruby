class Money
  # Chap3: In ruby: this cannot be set to private
  attr_accessor :amount
  attr_reader :currency
  
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def ==(money)
    self.currency == money.currency && @amount == money.amount
  end

  def self.dollar(amount)
    Money.new(amount, "USD")
  end
  
  def self.franc(amount)
    Money.new(amount, "CHF")
  end

  def times(multiplier)
    Money.new(@amount * multiplier, @currency)
  end

  def plus(addend)
    #Money.new(@amount + addend.amount, @currency)
    Sum.new(self, addend)
  end

  def reduce(to_currency)
    self
  end
end

class Bank
  def reduce(source, to_currency)
    source.reduce(to_currency)
  end
end

# Sum of Money
class Sum
  attr_accessor :augend, :addend

  def initialize(augend, addend)
    @augend, @addend = augend, addend
  end

  def reduce(to_currency)
    amount = @augend.amount + @addend.amount
    Money.new(amount, to_currency)
  end
end

