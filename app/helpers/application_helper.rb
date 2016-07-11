# General module
module ApplicationHelper
  def see_edit?(user)
    user.eql?(current_user) || policy(current_user).create?
  end
end
