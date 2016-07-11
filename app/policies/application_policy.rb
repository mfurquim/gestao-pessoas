# Principal policy to inheritance
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  def high_users
    !user.nil? && (user.role?(:administrator) || user.role?(:personmanager))
  end

  def excluded_users
    able_user = high_users || user.role?(:assessor) || user.role?(:disable)
    able_user && !user.role?(:exclude)
  end
  # Private class to scope the permitions
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
  protected :high_users, :excluded_users
end
