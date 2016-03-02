require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test "add activity with credit" do
    a = Activity.new(amount: 500.00)
    recievers(:user).activities << a
    assert_equal 500, Activity.find(a.id).amount
    assert_equal 1, Activity.find(a.id).reciever_id
  end

  test "add activity with debit" do
    a = Activity.new(amount: -100.00)
    recievers(:verizon).activities << a
    assert_equal -100, Activity.find(a.id).amount
    assert_equal 2, Activity.find(a.id).reciever_id
  end
end
