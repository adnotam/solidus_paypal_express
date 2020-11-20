# frozen_string_literal: true

require 'solidus_core'
require 'solidus_support'

require 'solidus_paypal_express/configuration'
require 'solidus_paypal_express/version'
require 'solidus_paypal_express/engine'

module SolidusPaypalExpress
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end
end
