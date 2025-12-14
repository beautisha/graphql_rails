
class Resort < ApplicationRecord
  # Связываем курорт с апартаментами и очищаем зависимые записи при удалении.
  has_many :apartments, dependent: :destroy

  # Проверяем обязательность ключевых полей, чтобы запросы не возвращали пустые значения.
  validates :name, presence: true
  validates :email, presence: true
end
