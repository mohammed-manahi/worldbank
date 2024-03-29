class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :set_default_role

  has_many :states

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  private

  def set_default_role
    self.role ||= 'user'
  end

  def user?
    role == 'user'
  end

  def authorized_user?
    role == 'authorized_user'
  end

  def data_entry?
    role == 'data_entry'
  end

  def admin?
    role == 'admin'
  end
end
