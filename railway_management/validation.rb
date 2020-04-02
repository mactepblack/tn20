module Validation
  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def valide?
      self.validate!

      true
    rescue
      false
    end
  end
end
