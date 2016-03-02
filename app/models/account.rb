class Account
  def initialize

  end

  def self.get_balance
    Activity.sum(:amount)
  end

  def self.total_transactions
    Activity.count
  end
end
