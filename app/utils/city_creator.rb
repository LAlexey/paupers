class CityCreator
  def self.create_cities
    %w(Красноярск Ачинск Сосновоборск Емельяново Боготол).each do |name|
      City.find_or_create_by name: name
    end
  end
end
