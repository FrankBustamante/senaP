class ReportPolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end

  def index?
    user.admin? || user.analyst? || user.coordinator?
  end

  def show?
    user.admin? || user.analyst? || user.coordinator? || (user.employee? && model.user_id == user.id)
  end

  def update?
    user.admin? || user.analyst? || user.coordinator? || (user.employee? && model.user_id == user.id)
  end

  def edit?
    user.admin? || user.analyst? || user.coordinator? || (user.employee? && model.user_id == user.id)
  end

  def new?
    user.admin? || user.analyst? || user.coordinator? || user.employee?
  end

  def create?
    user.admin? || user.analyst? || user.coordinator? || user.employee?
  end

  def destroy?
    user.admin? || user.analyst? || user.coordinator?
  end
end
