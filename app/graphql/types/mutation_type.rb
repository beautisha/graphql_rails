# frozen_string_literal: true

module Types
  # Мутации отвечают за изменение данных через GraphQL.
  class MutationType < Types::BaseObject
    # Создание нового курорта с обязательными атрибутами.
    field :create_resort, Types::ResortType, null: false do
      description "Creates new Resort"
      argument :name, String, required: true
      argument :email, String, required: true
      argument :description, String, required: false
    end

    def create_resort(name:, email:, description: nil)
      Resort.create!(name: name, email: email, description: description)
    end

    # Добавление апартаментов к существующему курорту.
    field :create_apartment, Types::ApartmentType, null: false do
      description "Creates new Apartment"
      argument :resort_id, ID, required: true, camelize: false
      argument :room_type, String, required: true, camelize: false
      argument :description, String, required: false
    end

    def create_apartment(resort_id:, room_type:, description: nil)
      Apartment.create!(
        resort_id: resort_id,
        room_type: room_type,
        description: description
      )
    end
  end
end

