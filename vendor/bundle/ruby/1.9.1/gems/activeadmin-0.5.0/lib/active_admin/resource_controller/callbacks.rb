module ActiveAdmin
  class ResourceController < BaseController

    module Callbacks
      extend ActiveSupport::Concern
      include ::ActiveAdmin::Callbacks

      included do
        define_active_admin_callbacks :build, :create, :update, :save, :destroy
      end

      protected

      def build_resource
        object = super
        run_build_callbacks object
        object
      end

      def create_resource(object)
        run_create_callbacks object do
          save_resource(object)
        end
      end

      def save_resource(object)
        run_save_callbacks object do
          object.save
        end
      end

      def update_resource(object, attributes)
        # Inherited resources 1.3.0 calls the method passing an array instead of a parameters hash.
        # The array contains in the first position the parameters which update the object and in the second position
        # possibly contains the role, it's optional, to use in mass assignment. This feature is provided by Rails 3.1
        if attributes.is_a?(Array)
          if object.respond_to?(:assign_attributes)
            object.assign_attributes(*attributes)
          else
            object.attributes = attributes[0]
          end
        else
          object.attributes = attributes
        end

        run_update_callbacks object do
          save_resource(object)
        end
      end

      def destroy_resource(object)
        run_destroy_callbacks object do
          object.destroy
        end
      end
    end

  end
end
