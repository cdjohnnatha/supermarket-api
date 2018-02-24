# frozen_string_literal: true

class UserWithRolesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :email
  has_many :roles
end
