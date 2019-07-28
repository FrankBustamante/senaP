class SalePolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end

  def index?
    user.admin? || user.namager? || user.analyst? || user.seller?
  end

  def show?
    user.admin? || user.namager? || user.analyst? || user.seller? && model.user_id == user.id
  end

  def edit?
    user.admin? || user.namager? || user.coordinator?
  end

  def update?
    user.admin? || user.manager?
  end

  def new?
    user.admin? || user.manager? || user.seller?
  end

  def create?
    user.admin? || user.manager? || user.seller?
  end

  def destroy?
    user.admin? || user.manager?
  end
end