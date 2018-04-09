# frozen_string_literal: true

require "rails_helper"

RSpec.describe "SupermarketAddresses", type: :request do
  let(:supermarket) { create(:supermarket) }
  let(:valid_attrs) { { supermarket_address: attributes_for(:supermarket_address) }.as_json }
  let(:invalid_attrs) { { supermarket_address: attributes_for(:supermarket_address, lat: nil, lng: nil) }.as_json }
  let(:user) { create(:user) }

  describe "/v1/supermarket/:supermarket_id/products" do
    context "GET" do
      before { create(:supermarket_address, supermarket: supermarket) }
      context "when logged in" do
        before(:each) { get v1_supermarket_address_index_path(supermarket.id), headers: authenticated_header(user) }

        it "should be returns a success" do
          expect(response).to have_http_status(200)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("supermarket_products")
        end

        it "should be returns an address from supermarket" do
          expect(response.body).not_to be_blank
          expect(json).not_to be_empty
        end
      end

      context "when logged out" do
        before(:each) { get v1_supermarket_address_index_path(supermarket.id) }

        it_behaves_like "a unauthorized error"
      end
    end

    context "POST" do
      context "valid supermarket attributes" do
        before(:each) { post v1_supermarket_address_index_path(supermarket.id), params: valid_attrs, headers: authenticated_header(user) }

        it "should return a created supermarket" do
          expect(response).to have_http_status(200)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("supermarket_address")
        end

        it_behaves_like "a json pattern" do
          let(:body) { json }
          let(:attrs) { valid_attrs }
        end

        it_behaves_like "a supermarket address attributes" do
          let(:body) { json }
          let(:attrs) { valid_attrs }
        end
      end

      context "invalid supermarket address attributes" do
        before(:each) { post v1_supermarket_address_index_path(supermarket.id), params: invalid_attrs, headers: authenticated_header(user) }

        it_behaves_like "a unprocessable error", :supermarkets
      end

      context "when logged out" do
        before(:each) { post v1_supermarket_address_index_path(supermarket.id), params: valid_attrs }

        it_behaves_like "a unauthorized error"
      end
    end
  end

  describe "/v1/supermarket/:supermarket_id/products/:id" do
    let(:address) { create(:supermarket_address, :with_supermarket, supermarket_id: supermarket.id) }

    context "PUT" do
      let(:new_valid_attrs) { valid_attrs }

      context "when logged in" do
        context "valid supermarket product attributes" do
          before(:each) { put v1_supermarket_address_path(supermarket.id, address.id), params: new_valid_attrs, headers: authenticated_header(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate supermarket product serializer" do
            expect(response).to match_response_schema("supermarket_product")
          end

          it_behaves_like "a json pattern" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end

          it_behaves_like "a supermarket address attributes" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end
        end

        context "with invalid supermarket address attributes" do
          describe "invalid id" do
            before(:each) { put v1_supermarket_address_path(supermarket.id, 0), params: new_valid_attrs, headers: authenticated_header(user) }

            it_behaves_like "a not found error", :supermarketAddress, 0
          end
        end
      end

      context "when logged out" do
        before(:each) { put v1_supermarket_address_path(supermarket.id, address.id), params: new_valid_attrs }

        it_behaves_like "a unauthorized error"
      end
    end

    context "PATCH" do
      let(:new_valid_attrs) { valid_attrs }

      context "when logged in" do
        context "valid supermarket product attributes" do
          before(:each) { patch v1_supermarket_address_path(supermarket.id, address.id), params: new_valid_attrs, headers: authenticated_header(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate supermarket product serializer" do
            expect(response).to match_response_schema("supermarket_product")
          end

          it_behaves_like "a json pattern" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end

          it_behaves_like "a supermarket address attributes" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end
        end

        context "with invalid supermarket address attributes" do
          describe "invalid id" do
            before(:each) { patch v1_supermarket_address_path(supermarket.id, 0), params: new_valid_attrs, headers: authenticated_header(user) }

            it_behaves_like "a not found error", :supermarketAddress, 0
          end
        end
      end

      context "when logged out" do
        before(:each) { patch v1_supermarket_address_path(supermarket.id, address.id), params: new_valid_attrs }

        it_behaves_like "a unauthorized error"
      end
    end

    context "DELETE" do
      context "when logged in" do
        context "valid supermarket address attributes" do
          before(:each) { delete v1_supermarket_address_path(supermarket.id, address.id), headers: authenticated_header(user) }

          it "should destroy a supermarket address" do
            expect(response.body).to be_empty
            expect(response).to have_http_status(204)
          end
        end

        context "invalid supermarket address attributes" do
          before(:each) { delete v1_supermarket_address_path(supermarket.id, 0), headers: authenticated_header(user) }

          it_behaves_like "a not found error", :supermarketAddress, 0
        end
      end

      context "when logged out" do
        before(:each) { delete v1_supermarket_address_path(supermarket.id, address.id) }

        it_behaves_like "a unauthorized error"
      end
    end

  end
end
