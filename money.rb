#class Pair
#  attr_reader :from, :to
#
#  def initialize(from, to)
#    @from, @to = from, to
#  end
#
#  def ==(pair)
#    @from == pair.from && @to == pair.to
#  end
#
#  def eql?(o)
#    o.is_a?(Pair) && self == o
#  end
#
#  def hash
#    (@from + @to).hash
#  end
#end

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
    Sum.new(self, addend)
  end

  def reduce(bank, to_currency)
    rate = bank.rate(@currency, to_currency)
    Money.new(@amount.to_f / rate, to_currency)
  end
end

class Bank
  def initialize
    @rates = {}
  end
  
  def reduce(source, to_currency)
    source.reduce(self, to_currency)
  end

  def add_rate(from_currency, to_currency, rate)
    #@rates[Pair.new(from_currency, to_currency)] = rate
    @rates[rate_key(from_currency, to_currency)] = rate
  end

  def rate(from_currency, to_currency)
    return 1 if from_currency == to_currency

    #@rates[Pair.new(from_currency, to_currency)]
    @rates[rate_key(from_currency, to_currency)]
  end

  private 
  def rate_key(from_currency, to_currency)
    from_currency.upcase + to_currency.upcase
  end
end

# Sum of Money
class Sum
  attr_accessor :augend, :addend

  def initialize(augend, addend)
    @augend, @addend = augend, addend
  end

  def reduce(bank, to_currency)
    amount = @augend.reduce(bank, to_currency).amount + 
      @addend.reduce(bank, to_currency).amount
    Money.new(amount, to_currency)
  end
end

