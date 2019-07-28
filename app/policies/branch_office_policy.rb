class BranchOfficePolicy
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

  def edit?
    user.admin? || (user.manager? && model.user_id == user.id)
  end

  def update?
    user.admin? || (user.manager? && model.user_id == ser.id)
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
