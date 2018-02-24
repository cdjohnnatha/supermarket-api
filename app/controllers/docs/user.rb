# frozen_string_literal: true

class Docs::User
  include Swagger::Blocks

  swagger_schema :User do
    key :required, [:name, :email, :password]

    property :id do
      key :type, :integer
    end

    property :name do
      key :type, :string
    end

    property :email do
      key :type, :string
    end

    property :password do
      key :type, :string
    end
  end

  swagger_schema :UserInput do
    key :required, [:user]

    property :user do
      key :format, :object
      key :required, [:name, :email, :password]

      property :name do
        key :type, :string
      end

      property :email do
        key :type, :string
      end

      property :password do
        key :type, :string
      end
    end
  end
end