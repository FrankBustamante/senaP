class SaleDetailPolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end

  def index?
    user.admin? || user.manager? || user.analyst? || user.coordinator? || user.seller?
  end

  def show?
    user.admin? || user.manager? || user.analyst? || user.coordinator? || (user.seller? && model.user_id == user.id)
  end

  def new?
    user.admin? || user.manager? || user.analyst? || user.coordinator? || user.seller?
  end

  def create?
    user.admin? || user.manager? || user.analyst? || user.coordinator? || user.seller?
  end

  def update?
    user.admin? || user.manager? || user.analyst? || user.coordinator? || (user.seller? && model.user_id == user.id)
  end

  def edit?
    user.admin? || user.manager? || user.analyst? || user.coordinator? || (user.seller? && model.user_id == user.id)
  end

  def destroy?
    user.admin? || user.manager? || user.analyst? || user.coordinator?
  end
end
