module ApplicationHelper
  def see_edit?(user)
    user.eql? current_user or policy(current_user).create?
  end
end
