# frozen_string_literal: true

class RoleSerializer
  include FastJsonapi::ObjectSerializer
  set_type :roles
  attributes :id, :name
end
