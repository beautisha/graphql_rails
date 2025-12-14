# frozen_string_literal: true

module Types
  # Тип описывает структуру данных, возвращаемых при запросе курорта.
  class ResortType < Types::BaseObject
    description "A Resort Type"

    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :description, String, null: true
    # Добавляем вложенный список апартаментов с ограничением количества.
    field :apartments, [Types::ApartmentType], null: false do
      argument :size, Integer, required: false, default_value: 15
    end

    # Сортируем и ограничиваем загрузку апартаментов у конкретного курорта.
    def apartments(size: 15)
      object.apartments.limit(size).order(id: :asc)
    end
  end
end

