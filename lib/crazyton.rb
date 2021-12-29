# frozen_string_literal: true

require_relative "crazyton/version"

module Crazyton
  def self.included(base)
    base.include(Singleton)
    base.extend(ClassMethods)
  end

  module ClassMethods
    ruby2_keywords def method_missing(method, *args, &block)
      instance.public_send(method, *args, &block)
    end

    def respond_to_missing?(method, include_private)
      instance.respond_to?(method, include_private)
    end
  end
end
