require "missing/version"
require "missing/action"
require "missing/route"

module Missing
  def self.find_undefined_routes
    routes = Missing::Route.all
    actions = Missing::Action.all

    actions.inject(Hash.new([])) do |undefined_routes, (k, v)|
      delta = v - routes[k]

      undefined_routes[k] = delta if delta.any?

      undefined_routes
    end
  end
end
