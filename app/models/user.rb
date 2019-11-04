class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # belongs_to :branch_office
  belongs_to :area, :class_name => 'Area' unless :new_record?
  has_many :sales
  has_many :reports

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:admin, :user, :seller, :analyst, :coordinator, :manager, :employee]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def description
    "#{self.names} #{self.last_names} | #{self.identification}"
  end
end