# frozen_string_literal: true

module Validation
  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def valid?
      validate!

      true
    rescue StandardError
      false
    end
  end
end
