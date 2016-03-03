class Account
  def initialize

  end

  def self.get_balance
    Activity.sum(:amount)
  end

  def self.total_transactions
    Activity.count
  end

  def self.get_total_by_month(sourcemonth)
    start_date = sourcemonth.month.ago.beginning_of_month
    end_date = sourcemonth.month.ago.end_of_month
    Activity.where("activity_date > ? AND activity_date < ?", start_date, end_date).sum(:amount)
  end
end
