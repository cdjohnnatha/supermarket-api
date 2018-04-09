# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:valid_user_attrs) { { user: attributes_for(:user) }.as_json }
  let(:admin_user) { create(:user, :with_admin_role) }
  let(:invalid_user_attrs) { { user: attributes_for(:user, name: nil) }.as_json }

  describe "/v1/users" do
    context "GET" do
      before { create_list(:user, 3) }

      context "when logged in" do
        before(:each) { get v1_users_path, headers: authenticated_header(User.first) }
        it "should be returns success" do
          expect(response).to have_http_status(200)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("users")
        end

        it "should be returns a users list" do
          expect(json).not_to be_blank
          expect(json).not_to be_empty
          expect(json["data"].count).to be >= 1
        end
      end

      context "when logged out" do
        before(:each) { get v1_users_path }

        it_behaves_like "a unauthorized error"
      end
    end

    context "POST" do
      context "valid_user_attrs" do
        before(:each) { post v1_users_path, params: valid_user_attrs, headers: authenticated_header(admin_user) }

        it "should be returns a user created" do
          expect(response).to have_http_status(201)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("user_with_roles")
        end

        it_behaves_like "a json with relationship included pattern" do
          let(:body) { json }
          let(:attrs) { valid_user_attrs }
        end

        it_behaves_like "a user with roles attributes" do
          let(:body) { json }
          let(:attrs) { valid_user_attrs }
        end
      end

      context "invalid_user_attrs" do
        describe "invalid params" do
          before(:each) { post v1_users_path, params: invalid_user_attrs, headers: authenticated_header(admin_user) }

          it_behaves_like "a unprocessable error", :user
        end
      end
    end
  end

  describe "/v1/users/id" do
    let(:user) { create(:user, :with_admin_role) }

    context "GET" do
      context "when logged in" do
        context "valid_user_attrs" do
          before(:each) { get v1_user_path(user.id), headers: authenticated_header(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate serializer" do
            expect(response).to match_response_schema("user_with_roles")
          end

          it "should be returns a user" do
            expect(response.body).not_to be_blank
            expect(json).not_to be_empty
          end

          it_behaves_like "a json with relationship pattern" do
            let(:body) { json }
            let(:attrs) { valid_user_attrs }
          end

          it_behaves_like "a user with roles attributes" do
            let(:body) { json }
            let(:attrs) { { "user": user }.as_json }
          end
        end

        context "invalid_user_attrs" do
          before(:each) { get v1_user_path(0), headers: authenticated_header(user) }

          it_behaves_like "a not found error", :user, 0
        end
      end

      context "when logged out" do
        before(:each) { get v1_user_path(user.id) }

        it_behaves_like "a unauthorized error"
      end
    end

    context "PUT" do
      let(:new_valid_user_attrs) { valid_user_attrs }

      context "when logged in" do
        context "valid_user_attrs" do
          before(:each) { put v1_user_path(user.id), params: new_valid_user_attrs, headers: authenticated_header(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate serializer" do
            expect(response).to match_response_schema("user_with_roles")
          end

          it_behaves_like "a user with roles attributes" do
            let(:body) { json }
            let(:attrs) { new_valid_user_attrs }
          end
        end

        context "invalid_user_attrs" do
          describe "invalid id" do
            before(:each) { put v1_user_path(0), params: new_valid_user_attrs, headers: authenticated_header(user) }

            it_behaves_like "a not found error", :user, 0
          end

          describe "invalid params" do
            before(:each) { put v1_user_path(user.id), params: invalid_user_attrs, headers: authenticated_header(user) }

            it_behaves_like "a unprocessable error", :user
          end
        end
      end

      context "when logged out" do
        before(:each) { put v1_user_path(user.id), params: new_valid_user_attrs }

        it_behaves_like "a unauthorized error"
      end
    end

    context "PATCH" do
      let(:new_valid_user_attrs) { valid_user_attrs }

      context "when logged in" do
        context "valid_user_attrs" do
          before(:each) { patch v1_user_path(user.id), params: new_valid_user_attrs, headers: authenticated_header(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate serializer" do
            expect(response).to match_response_schema("user_with_roles")
          end

          it_behaves_like "a user with roles attributes" do
            let(:body) { json }
            let(:attrs) { new_valid_user_attrs }
          end
        end

        context "invalid_user_attrs" do
          describe "invalid id" do
            before(:each) { patch v1_user_path(0), params: new_valid_user_attrs, headers: authenticated_header(user) }

            it_behaves_like "a not found error", :user, 0
          end

          describe "invalid params" do
            before(:each) { patch v1_user_path(user.id), params: invalid_user_attrs, headers: authenticated_header(user) }

            it_behaves_like "a unprocessable error", :user
          end
        end
      end

      context "when logged out" do
        before(:each) { patch v1_user_path(user.id), params: new_valid_user_attrs }

        it_behaves_like "a unauthorized error"
      end
    end

    context "DELETE" do
      context "when logged in" do
        context "valid_user_attrs" do
          before(:each) { delete v1_user_path(user.id), headers: authenticated_header(user) }

          it "should destroy a user" do
            expect(response.body).to be_empty
            expect(response).to have_http_status(204)
          end
        end

        context "invalid_user_attrs" do
          before(:each) { delete v1_user_path(0), headers: authenticated_header(user) }

          it_behaves_like "a not found error", :user, 0
        end
      end

      context "when logged out" do
        before(:each) { delete v1_user_path(user.id) }

        it_behaves_like "a unauthorized error with message"
      end
    end
  end
end
