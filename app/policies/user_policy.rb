class UserPolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end

  def index?
    user.admin? || user.namager?
  end

  def show?
    user.admin? || (user.manager? && model.user_id == user.id)
  end

  def edit?
    user.admin? || (user.manager? && model.user_id == user.id)
  end

  def update?
    user.admin? || (user.manager? && model.user_id == user.id)
  end

  def new?
    user.admin? || (user.manager? && model.user_id == user.id)
  end

  def create?
    user.admin? || (user.manager? && model.user_id == user.id)
  end

  def destroy?
    user.admin? || (user.manager? && model.user_id != user.id)
  end

  def create_manager?
    user.admin?
  end

  def new_manager?
    user.admin?
  end
end
