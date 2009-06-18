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
end
