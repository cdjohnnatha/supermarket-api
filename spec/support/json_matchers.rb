# frozen_string_literal: true

JsonMatchers.configure do |config|
  config.options[:strict] = true
end

JsonMatchers.schema_root = "spec/schemas"
