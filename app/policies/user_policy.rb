# frozen_string_literal: true

# clase Police by user
class UserPolicy
  attr_reader :user, :users

  def initialize(user, users)
    @user = user
    @users = users
  end

  def index?
    @user.has_role?(:instructor)
  end

end
