# frozen_string_literal: true

module Api::V1
  class SupermarketsController < ApplicationController
    before_action :set_supermarket, only: [:show, :update, :destroy]

    def index 
    end

    def show
    end

    def create
    end

    def update
    end

    def destroy
    end

    private
      def set_supermarket
        @supermarket = Supermarket.find(param[:id])
      end
  end
end
