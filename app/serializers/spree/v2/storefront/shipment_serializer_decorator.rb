module Spree
  module V2
    module Storefront
      module ShipmentSerializerDecorator
        def self.prepended(base)
          base.attributes :scheduled_at
        end
      end
    end
  end
end

Spree::V2::Storefront::ShipmentSerializer.prepend Spree::V2::Storefront::ShipmentSerializerDecorator
