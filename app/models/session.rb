class Session < ApplicationRecord
  belongs_to :user

  before_create do
    self.user_agent = Current.user_agent
    self.ip_address = Current.ip_address
  end

  after_create  { user.events.create! action: "signed_in" }
  after_destroy { user.events.create! action: "signed_out" }

  before_create :set_timeout

  TIMEOUT = 1.minute

  def timeout
    Time.at(read_attribute(:timeout))
  end

  def expired?
    timeout < Time.current
  end

  private

  def set_timeout
    self.timeout = TIMEOUT.from_now
  end


end
