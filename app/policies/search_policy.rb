# Verify permissions to search manipulation
class SearchesPolicy < ApplicationPolicy
  # Define who can see users and they profiles

  def index?
    high_users
  end

end
