# frozen_string_literal: true

require 'spree/core'
require 'solidus_paypal_express'

module SolidusPaypalExpress
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_paypal_express'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree.paypal_express.payment_methods", after: "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::Gateway::PayPalExpress
    end
  end
end
