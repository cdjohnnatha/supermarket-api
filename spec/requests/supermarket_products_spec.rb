require 'rails_helper'

RSpec.describe "SupermarketProducts", type: :request do
  let(:supermarket) { create(:supermarket) }
  let(:valid_arr_attrs) { { supermarket_products: [ attributes_for(:supermarket_product) ].as_json } } 
  let(:valid_attrs) { { supermarket_products: attributes_for(:supermarket_product).as_json } } 
  let(:invalid_arr_attrs) { { supermarket_products: [ attributes_for(:supermarket_product, product_id: nil) ].as_json } } 
  let(:invalid_attrs) { { supermarket_products: attributes_for(:supermarket_product, product_id: nil).as_json } } 
  let(:user) { create(:user) }

  describe "/v1/supermarket/:supermarket_id/products" do
    context "GET" do
      before { create(:supermarket_product, :with_supermarket, supermarket_id: supermarket.id) }
      context "when logged in" do
        before(:each) { get v1_supermarket_products_path(supermarket.id), headers: authenticated_header(user) }
        
        it "should be returns a success" do
          expect(response).to have_http_status(200)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("supermarket_products")
        end

        it "should be returns a products list from supermarket" do
          expect(response.body).not_to be_blank
          expect(json).not_to be_empty
          expect(json["data"].count).to be >= 1
        end
      end

      context "when logged out" do
        before(:each) { get v1_supermarket_products_path(supermarket.id) }

        it_behaves_like "a unauthorized error"
      end
    end

    context "POST" do
      context "valid supermarket product attributes" do
        before(:each) { post v1_supermarket_products_path(supermarket.id), params: valid_arr_attrs, headers: authenticated_header(user) }

        it "should return a created supermarket product" do
          expect(response).to have_http_status(200)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("supermarket_product")
        end

        it_behaves_like "a json with relationship pattern as array" do
          let(:body) { json }
          let(:attrs) { valid_arr_attrs }
        end

        it_behaves_like "a supermarket products attributes" do
          let(:body) { json }
          let(:attrs) { valid_arr_attrs }
        end
      end

      context "invalid product attributes" do
        before(:each) { post v1_supermarket_products_path(supermarket.id), params: invalid_arr_attrs, headers: authenticated_header(user) }

        it "should return a created supermarket product" do
          expect(response).to have_http_status(200)
        end
      end

      context "when logged out" do
        before(:each) { post v1_supermarket_products_path(supermarket.id), params: valid_arr_attrs }

        it_behaves_like "a unauthorized error"
      end
    end 
  end

  describe "/v1/supermarket/:supermarket_id/products/:id" do
    let(:product) { create(:supermarket_product, :with_supermarket, supermarket_id: supermarket.id) }

    context "GET" do
      context "when logged in" do
        context "valid product attributes" do
          before(:each) { get v1_supermarket_product_path(supermarket.id, product.id), headers: authenticated_header(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate product serializer" do
            expect(response).to match_response_schema("supermarket_product")
          end

          it "should be returns a product" do
            expect(response.body).not_to be_blank
            expect(json["data"]).not_to be_empty
          end

          it_behaves_like "a json pattern" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end

          it_behaves_like "a supermarket product attributes" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end
        end
        context "invalid product attributes" do
          before(:each) { get v1_supermarket_product_path(supermarket.id, 0), headers: authenticated_header(user) }

          it_behaves_like "a not found error", :supermarketProduct, 0
        end

        context "when logged out" do
          before(:each) { get v1_supermarket_product_path(supermarket.id, product.id) }

          it_behaves_like "a unauthorized error"
        end
      end
    end

    context "PUT" do
      let(:new_valid_attrs) { valid_attrs }

      context "when logged in" do
        context "valid supermarket product attributes" do
          before(:each) { put v1_supermarket_product_path(supermarket.id, product.id), params: new_valid_attrs, headers: authenticated_header(user) }

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

          it_behaves_like "a supermarket product attributes" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end
        end

        context "with invalid supermarket product attributes" do
          describe "invalid id" do
            before(:each) { put v1_supermarket_product_path(supermarket.id, 0), params: new_valid_attrs, headers: authenticated_header(user) }

            it_behaves_like "a not found error", :supermarketProduct, 0
          end
        end
      end

      context "when logged out" do
        before(:each) { put v1_supermarket_product_path(supermarket.id, product.id), params: new_valid_attrs }

        it_behaves_like "a unauthorized error"
      end
    end

    context "PATCH" do
      let(:new_valid_attrs) { valid_attrs }

      context "when logged in" do
        context "valid supermarket product attributes" do
          before(:each) { patch v1_supermarket_product_path(supermarket.id, product.id), params: new_valid_attrs, headers: authenticated_header(user) }

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

          it_behaves_like "a supermarket product attributes" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end
        end

        context "with invalid supermarket product attributes" do
          describe "invalid id" do
            before(:each) { patch v1_supermarket_product_path(supermarket.id, 0), params: new_valid_attrs, headers: authenticated_header(user) }

            it_behaves_like "a not found error", :supermarketProduct, 0
          end
        end
      end

      context "when logged out" do
        before(:each) { patch v1_supermarket_product_path(supermarket.id, product.id), params: new_valid_attrs }

        it_behaves_like "a unauthorized error"
      end
    end

    context "DELETE" do
      context "when logged in" do
        context "valid supermarket product attributes" do
          before(:each) { delete v1_supermarket_product_path(supermarket.id, product.id), headers: authenticated_header(user) }

          it "should destroy a supermarket product" do
            expect(response.body).to be_empty
            expect(response).to have_http_status(204)
          end
        end

        context "invalid supermarket product attributes" do
          before(:each) { delete v1_supermarket_product_path(supermarket.id, 0), headers: authenticated_header(user) }

          it_behaves_like "a not found error", :supermarketProduct, 0
        end
      end

      context "when logged out" do
        before(:each) { delete v1_supermarket_product_path(supermarket.id, product.id) }

        it_behaves_like "a unauthorized error"
      end
    end

  end
end
