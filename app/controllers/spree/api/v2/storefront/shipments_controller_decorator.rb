module Spree
  module Api
    module V2
      module Storefront
        module ShipmentsControllerDecorator
          def update
            if resource.update(shipment_params)
              render json: { status: 'ok', journey: resource }
            else
              render json: { status: :unprocessable_entity, error: resource.errors }
            end
          end

          private

          def shipment_params
            params.require(:shipment).permit(permitted_shipment_attributes)
          end
        end
      end
    end
  end
end

::Spree::Api::V2::Storefront::ShipmentsController.prepend ::Spree::Api::V2::Storefront::ShipmentsControllerDecorator
