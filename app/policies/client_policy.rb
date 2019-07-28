class ClientPolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end

  def index?
    user.admin? || user.manager?
  end

  def show?
    user.admin? || user.manager?
  end

  def new?
    user.admin? || user.manager? || user.seller?
  end

  def create?
    user.admin? || user.manager? || user.seller?
  end

  def edit?
    user.admin? || user.manager? || user.seller?
  end

  def update?
    user.admin? || user.manager? || user.seller?
  end

  def destroy?
    user.admin? || user.manager?
  end
end
