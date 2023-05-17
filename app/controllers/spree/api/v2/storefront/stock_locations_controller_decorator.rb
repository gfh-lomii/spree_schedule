module Spree
  module Api
    module V2
      module Storefront
        module StockLocationsControllerDecorator
          def schedules
            render json: { status: 'ok', schedules: resource.schedules.enables.order(:day_code) }
          end

          private

          def scope
            Spree::StockLocation.where(active: true)
          end

          def resource
            scope.find_by!(id: params[:id])
          end

          def collection_serializer
            Spree::Api::Dependencies.storefront_stocklocation_serializer.constantize
          end

          def resource_serializer
            Spree::Api::Dependencies.storefront_stocklocation_serializer.constantize
          end
        end
      end
    end
  end
end

::Spree::Api::V2::Storefront::StockLocationsController.prepend ::Spree::Api::V2::Storefront::StockLocationsControllerDecorator
