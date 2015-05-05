class Person < ActiveRecord::Base

  has_many :addresses, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_and_belongs_to_many :cars
  validates :nombre, :apellido, :ci, presence: {message: "No puede estar en blanco"}
  validates :ci, uniqueness: {message: "La cedula esta repetida"}
  validates :ci, numericality: {only_integer: true, less_than: 30000000}
  validates :ci, numericality: {greater_than: 0, message: "Debe ser mayor a cero"}

  validate :check_ci, unless: "ci.nil?"

  before_save :normalize

  def full_name
    [nombre, apellido].join(' ')
  end

  private

  def normalize
    self.nombre.upcase!
    self.apellido.upcase!
  end

  def check_ci
    if ci < 10000
        errors.add(:base, "Muy viejo")
    end  
  end
end
