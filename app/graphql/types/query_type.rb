# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :all_resorts, [Types::ResortType], null: false, camelize: false do
      description "All Resorts everywhere"
      argument :size, Integer, required: false, default_value: 15
    end

    def all_resorts(size: 15)
      Resort.limit(size).order(id: :asc)
    end

    field :resort, Types::ResortType, null: false do
      description "One Resort by its ID"
      argument :id, ID, required: true
    end

    def resort(id:)
      Resort.find(id)
    end

    # Получаем список апартаментов по всему каталогу.
    field :all_apartments, [Types::ApartmentType], null: false, camelize: false do
      description "All Apartment everywhere"
      argument :size, Integer, required: false, default_value: 15
    end

    def all_apartments(size: 15)
      Apartment.limit(size).order(id: :asc)
    end

    field :apartment, Types::ApartmentType, null: false do
      description "One Apartment by its ID"
      argument :id, ID, required: true
    end

    def apartment(id:)
      Apartment.find(id)
    end
  end
end
