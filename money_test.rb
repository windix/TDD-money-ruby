require 'test/unit'
require 'money'

class MoneyTest < Test::Unit::TestCase
  def test_dollar_multiplication
    five = Money.dollar(5)
    assert_equal(Money.dollar(10), five.times(2))
    assert_equal(Money.dollar(15), five.times(3))
  end
 
  def test_franc_multiplication
    five = Money.franc(5)
    assert_equal(Money.franc(10), five.times(2))
    assert_equal(Money.franc(15), five.times(3))
  end

  def test_equality
    assert(Money.dollar(5) == Money.dollar(5))
    assert_equal(false, Money.dollar(5) == Money.dollar(6))
    
    assert(Money.franc(5) == Money.franc(5))
    assert_equal(false, Money.franc(5) == Money.franc(6))
    
    assert_equal(false, Money.dollar(5) == Money.franc(5))
  end
end
