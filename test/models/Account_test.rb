require 'test_helper'

class AccountTest < ActionController::TestCase
  test "get balance" do
    a = Activity.new(amount: 500.00)
    recievers(:user).activities << a
    assert_equal 500.00, Account.get_balance
    a2 = Activity.new(amount: -100.00)
    recievers(:verizon).activities << a2
    assert_equal 400.00, Account.get_balance
  end
end
