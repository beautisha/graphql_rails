
class Apartment < ApplicationRecord
  # Каждые апартаменты жёстко привязаны к определённому курорту.
  belongs_to :resort

  # Проверяем тип номера, чтобы в запросах не появлялись пустые описания.
  validates :room_type, presence: true
end
