# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Products", type: :request do
  let(:valid_attrs) { { product: attributes_for(:product) }.as_json }
  let(:invalid_attrs) { { product: attributes_for(:product, name: nil, barcode: nil) }.as_json }
  let(:user) { create(:user) }

  describe "/v1/products" do
    context "GET" do
      before { create_list(:product, 3) }
      context "when logged in" do
        before(:each) { get v1_products_path, headers: authenticated_header(user) }

        it "should be returns success" do
          expect(response).to have_http_status(200)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("products")
        end

        it "should be returns a products list" do
          expect(response.body).not_to be_blank
          expect(json).not_to be_empty
          expect(json["data"].count).to be >= 3
        end
      end

      context "when logged out" do
        before(:each) { get v1_products_path }

        it_behaves_like "a unauthorized error"
      end
    end

    context "POST" do
      context "valid product attributes" do
        before(:each) { post v1_products_path, params: valid_attrs, headers: authenticated_header(user) }

        it "should return a created product" do
          expect(response).to have_http_status(200)
        end

        it "validate serializer" do
          expect(response).to match_response_schema("product")
        end

        it_behaves_like "a json pattern" do
          let(:body) { json }
          let(:attrs) { valid_attrs }
        end

        it_behaves_like "a product attributes" do
          let(:body) { json }
          let(:attrs) { valid_attrs }
        end
      end

      context "invalid product attributes" do
        before(:each) { post v1_products_path, params: invalid_attrs, headers: authenticated_header(user) }

        it_behaves_like "a unprocessable error", :products
      end

      context "when logged out" do
        before(:each) { post v1_products_path, params: valid_attrs }

        it_behaves_like "a unauthorized error"
      end
    end
  end

  describe "/v1/products/:id" do
    let(:product) { create(:product) }

    context "GET" do
      context "when logged in" do
        context "valid product attributes" do
          before(:each) { get v1_product_path(product.id), headers: authenticated_header(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate product serializer" do
            expect(response).to match_response_schema("product")
          end

          it "should be returns a product" do
            expect(response.body).not_to be_blank
            expect(json["data"]).not_to be_empty
          end

          it_behaves_like "a json pattern" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end

          it_behaves_like "a product attributes" do
            let(:body) { json }
            let(:attrs) { valid_attrs }
          end
        end
        context "invalid product attributes" do
          before(:each) { get v1_product_path(0), headers: authenticated_header(user) }

          it_behaves_like "a not found error", :product, 0
        end

        context "when logged out" do
          before(:each) { get v1_product_path(product.id) }

          it_behaves_like "a unauthorized error"
        end
      end
    end

    context "PUT" do
      let(:new_valid_attrs) { valid_attrs }

      context "when logged in" do
        context "valid product attributes" do
          before(:each) { put v1_product_path(product.id), params: new_valid_attrs, headers: authenticated_header(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate product serializer" do
            expect(response).to match_response_schema("product")
          end

          it_behaves_like "a json pattern" do
            let(:body) { json }
            let(:attrs) { new_valid_attrs }
          end

          it_behaves_like "a product attributes" do
            let(:body) { json }
            let(:attrs) { new_valid_attrs }
          end
        end

        context "with invalid product attributes" do
          describe "invalid id" do
            before(:each) { put v1_product_path(0), params: new_valid_attrs, headers: authenticated_header(user) }

            it_behaves_like "a not found error", :product, 0
          end

          describe "invalid params" do
            before(:each) { put v1_product_path(product.id), params: invalid_attrs, headers: authenticated_header(user) }

            it_behaves_like "a unprocessable error", :product
          end
        end
      end

      context "when logged out" do
        before(:each) { put v1_product_path(product.id), params: new_valid_attrs }

        it_behaves_like "a unauthorized error"
      end
    end

    context "PATCH" do
      let(:new_valid_attrs) { valid_attrs }

      context "when logged in" do
        context "valid product attributes" do
          before(:each) { patch v1_product_path(product.id), params: new_valid_attrs, headers: authenticated_header(user) }

          it "should be returns success" do
            expect(response.content_type).to eq("application/json")
            expect(response).to have_http_status(200)
          end

          it "validate product serializer" do
            expect(response).to match_response_schema("product")
          end

          it_behaves_like "a json pattern" do
           let(:body) { json }
           let(:attrs) { new_valid_attrs }
         end

          it_behaves_like "a product attributes" do
            let(:body) { json }
            let(:attrs) { new_valid_attrs }
          end
        end

        context "with invalid product attributes" do
          describe "invalid id" do
            before(:each) { patch v1_product_path(0), params: new_valid_attrs, headers: authenticated_header(user) }

            it_behaves_like "a not found error", :product, 0
          end

          describe "invalid params" do
            before(:each) { patch v1_product_path(product.id), params: invalid_attrs, headers: authenticated_header(user) }

            it_behaves_like "a unprocessable error", :product
          end
        end
      end

      context "when logged out" do
        before(:each) { patch v1_product_path(product.id), params: new_valid_attrs }

        it_behaves_like "a unauthorized error"
      end
    end

    context "DELETE" do
      context "when logged in" do
        context "valid product attributes" do
          before(:each) { delete v1_product_path(product.id), headers: authenticated_header(user) }

          it "should destroy a product" do
            expect(response.body).to be_empty
            expect(response).to have_http_status(204)
          end
        end

        context "invalid product attributes_" do
          before(:each) { delete v1_product_path(0), headers: authenticated_header(user) }

          it_behaves_like "a not found error", :product, 0
        end
      end

      context "when logged out" do
        before(:each) { delete v1_product_path(product.id) }

        it_behaves_like "a unauthorized error"
      end
    end
  end
end
