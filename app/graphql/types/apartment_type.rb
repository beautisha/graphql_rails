# frozen_string_literal: true

module Types
  # Тип описывает набор полей, которые доступны при запросе апартаментов.
  class ApartmentType < Types::BaseObject
    description "An Apartment Type"

    field :id, ID, null: false
    field :room_type, String, null: true, camelize: false
    field :description, String, null: true
    field :resort_id, ID, null: false, camelize: false
  end
end

