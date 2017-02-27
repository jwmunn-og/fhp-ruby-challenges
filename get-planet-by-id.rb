def get_planet_name(id)
  name = ''
  case id
    when 1; name = "Mercury"
    when 2; name = "Venus"
    when 3; name = "Earth"
    when 4; name = "Mars"
    when 5; name = "Jupiter"
    when 6; name = "Saturn"
    when 7; name = "Uranus"  
    when 8; name = "Neptune"
  end
  return name
end