class Account
  def initialize

  end

  def self.get_balance
    Activity.sum(:amount)
  end
end
