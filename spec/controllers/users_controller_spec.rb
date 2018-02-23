# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:valid_attributes) { attributes_for(:user) }
  let(:valid_admin_attributes) { attributes_for(:user, :with_admin_role) }
  let(:invalid_attributes) { attributes_for(:user, name: nil) }

  let(:valid_session) { authenticated_header(create(:user)) }
  before(:each) { request.headers.merge! valid_session }

  describe "GET #index" do
    before { @user = User.create! valid_attributes }
    before(:each) { get :index, params: {} }
    
    it "returns a success response" do
      expect(response).to be_success
      expect(response.content_type).to eq "application/json"
    end

    it "assign all users as @users" do
      expect(assigns(:users)).to include(@user)
    end
  end

  describe "GET #show" do
    context "with valid params" do
      before { @user = User.create! valid_attributes }
      before(:each) { get :show, params: { id: @user.to_param } }

      it "returns a success response" do
        expect(response).to be_success
        expect(response.content_type).to eq "application/json"
      end

      it "assigns the requested user as @user" do
        expect(response.body).not_to be_blank
        expect(assigns(:user)).to eq(@user)
      end

      it "exists roles in user" do
        expect(response.body).not_to be_blank
        expect(assigns(:user).roles).to eq(@user.roles)
      end
    end

    context "with invalid params" do
      before(:each) { get :show, params: { id: 0 } }

      it "returns a not found response" do
        expect(response).to be_not_found
        expect(response.content_type).to eq "application/json"
      end

      it "assigns the requested user as nil" do
        expect(response.body).not_to be_blank
        expect(assigns(:user)).to be_nil
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, params: { user: valid_attributes }
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        post :create, params: { user: invalid_attributes }
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe "PUT #update" do
    before(:each) { @user = User.create! valid_attributes }

    context "with valid params" do
      let(:new_attributes) { attributes_for(:user) }

      it "updates the requested user" do
        put :update, params: { id: @user.to_param, user: new_attributes }
        @user.reload
      end

      it "assigns the requested user as @user" do
        put :update, params: { id: @user.to_param, user: valid_attributes }
        expect(assigns(:user)).to eq(@user)
      end
    end

    context "with invalid params" do
      it "assigns the user as @user" do
        put :update, params: { id: @user.to_param, user: invalid_attributes }
        expect(assigns(:user)).to eq(@user)
      end
    end
  end

  describe "DELETE #destroy" do
    it "should not destroys the requested user" do
      user = User.create! valid_attributes
      expect {
        delete :destroy, params: { id: user.to_param }
      }.to change(User, :count).by(0)
    end
  end
end
