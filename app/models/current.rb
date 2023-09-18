class Current < ActiveSupport::CurrentAttributes
  attribute :session
  attribute :user_agent, :ip_address

  attribute :account
  attribute :user


  def session=(session)
    super; self.account = session.user.account
  end

  def user
    role = "Identity::#{session.role.classify}".constantize
    session.user.becomes(role)
  end

  def user=(user)
    session.user = user
  end


end
