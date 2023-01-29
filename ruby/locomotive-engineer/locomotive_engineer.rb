class LocomotiveEngineer
  def self.generate_list_of_wagons(*args)
    args
  end

  def self.fix_list_of_wagons((first, second, third, *rest), missing_wagons)
    [third, *missing_wagons, *rest, first, second]
  end

  def self.add_missing_stops(from_to, **stops)
    from_to.merge(stops: stops.sort.to_h.values)
  end

  def self.extend_route_information(route, more_route_information)
    route.merge(more_route_information)
  end
end
