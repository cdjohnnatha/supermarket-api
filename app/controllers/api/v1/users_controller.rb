# frozen_string_literal: true

module Api::V1
  class UsersController < ApiController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :set_options, only: [:show, :create, :update]
    skip_before_action :authenticate_user, only: :create

    # GET /users
    def index
      @users = User.all

      render json: UserSerializer.new(@users).serialized_json
    end

    # GET /users/1
    def show
      render json: UserWithRolesSerializer.new(@user).serialized_json
    end

    # POST users
    def create
      @user = User.new(user_params)

      if @user.save
        render json: UserWithRolesSerializer.new(@user, @options).serialized_json, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: UserWithRolesSerializer.new(@user, @options).serialized_json
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
    end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_options
      @options = {}
      @options[:include] = [:roles]
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end
end
