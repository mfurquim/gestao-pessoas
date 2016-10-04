class AcademicInformationPolicy < ApplicationPolicy
    
    def index?
        excluded_users
    end
    def new?
        high_users || (record.user == user)
    end
end
