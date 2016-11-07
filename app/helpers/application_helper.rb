# General module
module ApplicationHelper
  def see_edit?(user)
    user.eql?(current_user) || policy(current_user).create?
  end
  def manager?(activity)
    policy(activity).project_manager?
  end
  def bootstrap_class_flash(type)
    case type
      when 'success'
        'alert-success'
      when 'error'
        'alert-error'
      when 'alert'
        'alert-warning'
      when 'notice'
        'alert-info'
      else
        type.to_s
    end 
  end
end
