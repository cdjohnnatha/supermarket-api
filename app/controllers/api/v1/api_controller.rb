# frozen_string_literal: true

module Api::V1
  class ApiController < ApplicationController
    include ExceptionHandler
    include Knock::Authenticable
    include CanCan::ControllerAdditions
    load_and_authorize_resource
    before_action :authenticate_user
  end
end
