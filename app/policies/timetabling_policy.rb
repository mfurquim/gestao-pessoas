class TimetablingPolicy < ApplicationPolicy
    def show?
        excluded_users
    end
    def edit?
      high_users || ( record.academic_information.user == user)
    end
end
