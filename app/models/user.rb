# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  rolify
  
  include Constants
  validates :email, uniqueness: true, presence: true, format: { with: EMAIL }
  validates :name, :password_digest, presence: true
  validates :password, presence: { on: :create }, length: { minimum: 8, allow_blank: true }
  
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:user) if self.roles.blank?
  end
end
