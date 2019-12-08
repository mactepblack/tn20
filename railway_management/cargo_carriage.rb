class CargoCarriage < Carriage
  def initialize(number)
    super

    @type = "cargo"
  end
end
