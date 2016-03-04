class Account

  def get_balance
    Activity.sum(:amount)
  end

  def total_transactions
    Activity.count
  end

  def get_total_by_month(sourcemonth)
    start_date = sourcemonth.month.ago.beginning_of_month
    end_date = sourcemonth.month.ago.end_of_month
    Activity.where("activity_date > ? AND activity_date < ? AND amount < 0", start_date, end_date).sum(:amount)
  end

  def get_transactions_by_month(sourcemonth)
    start_date = sourcemonth.month.ago.beginning_of_month
    end_date = sourcemonth.month.ago.end_of_month
    Activity.where("activity_date > ? AND activity_date < ?", start_date, end_date).count
  end

  def get_largest_transaction_by_month(sourcemonth)
    start_date = sourcemonth.month.ago.beginning_of_month
    end_date = sourcemonth.month.ago.end_of_month
    Activity.where("activity_date > ? AND activity_date < ?", start_date, end_date).order(:amount).first.amount
  end

  def get_largest_debit_ever
    Activity.order(:amount).first.amount
  end

  def get_largest_debit_reciever
    a = Activity.select("reciever_id, sum(amount)").order("sum_amount").group(:reciever_id).sum(:amount).first
    Reciever.find(a[0]).name
  end
end
