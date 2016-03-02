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

  test "get count of transactions" do
    a = Activity.new(amount: 500.00)
    a2 = Activity.new(amount: 100.00)
    recievers(:user).activities << a
    recievers(:user).activities << a2
    # total is 3 because of fixtures
    assert_equal 3, Account.total_transactions
  end
end
