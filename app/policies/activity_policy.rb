class ActivityPolicy < ApplicationPolicy
    
    def index?
        excluded_users
    end
    def project_manager?
        high_users
    end
end
