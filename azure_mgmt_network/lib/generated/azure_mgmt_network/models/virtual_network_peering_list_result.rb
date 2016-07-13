# encoding: utf-8
# Code generated by Microsoft (R) AutoRest Code Generator 0.17.0.0
# Changes may cause incorrect behavior and will be lost if the code is
# regenerated.

module Azure::ARM::Network
  module Models
    #
    # Response for ListSubnets Api service callRetrieves all subnet that
    # belongs to a virtual network
    #
    class VirtualNetworkPeeringListResult

      include MsRestAzure

      # @return [Array<VirtualNetworkPeering>] Gets the peerings in a virtual
      # network
      attr_accessor :value

      # @return [String] Gets the URL to get the next set of results.
      attr_accessor :next_link


      #
      # Mapper for VirtualNetworkPeeringListResult class as Ruby Hash.
      # This will be used for serialization/deserialization.
      #
      def self.mapper()
        {
          required: false,
          serialized_name: 'VirtualNetworkPeeringListResult',
          type: {
            name: 'Composite',
            class_name: 'VirtualNetworkPeeringListResult',
            model_properties: {
              value: {
                required: false,
                serialized_name: 'value',
                type: {
                  name: 'Sequence',
                  element: {
                      required: false,
                      serialized_name: 'VirtualNetworkPeeringElementType',
                      type: {
                        name: 'Composite',
                        class_name: 'VirtualNetworkPeering'
                      }
                  }
                }
              },
              next_link: {
                required: false,
                serialized_name: 'nextLink',
                type: {
                  name: 'String'
                }
              }
            }
          }
        }
      end
    end
  end
end
