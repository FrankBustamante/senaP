class ProductPolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? || (user.manager? && model.user_id == user.id)
  end

  def new?
    user.admin? || user.manager?
  end

  def create?
    user.admin? || user.manager?
  end

  def edit?
    user.admin? || (user.manager? && model.user_id == user.id)
  end

  def update?
    user.admin? || (user.manager? && model.user_id == user.id)
  end

  def destroy?
    user.admin? || (user.manager? && model.user_id == user.id)
  end
end
