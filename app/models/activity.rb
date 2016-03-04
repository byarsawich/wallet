class Activity < ActiveRecord::Base
  belongs_to :reciever
  def reciever_name
    reciever && reciever.name
  end

  def reciever_name=(r_name)
    r = Reciever.find_by_name(r_name)
    if r
      self.reciever = r
    else
      self.reciever = Reciever.create!(name: r_name)
    end
  end
end
