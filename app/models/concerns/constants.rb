# frozen_string_literal: true

module Constants
  extend ActiveSupport::Concern

  EMAIL = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  PHONE = /\A(\w+(?:[\s-]*\w+)?)(?:,\s*\g<1>)*\z/
end
