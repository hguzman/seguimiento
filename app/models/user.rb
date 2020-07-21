class User < ApplicationRecord

  rolify

  validates :apellidos, presence: true
  validates :ndocumento, presence: true
  validates :telefono, presence: true

  after_create :assign_default_role
  after_create :user_mailer
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  def assign_default_role
    add_role(:aprendiz) if self.roles.blank?
  end

  def user_mailer
    UserMailer.bienvenida_mailer(@user).deliver_now
  end

  belongs_to :tipodocumento

  has_many :anotaciones, as: :anotable

  belongs_to :ficha

end
