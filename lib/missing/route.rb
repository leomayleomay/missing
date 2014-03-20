module Missing
  class Route
    def self.all
      routes = Hash.new([])

      Rails.application.routes.routes.map(&:defaults).each do |d|
        next if d[:controller].blank? || d[:action].blank?

        controller = d[:controller].classify.to_s + "Controller"
        begin
          controller.split("::").inject(Module) do |r, e|
            r.const_get(e)
          end
        rescue
          controller = d[:controller].classify.to_s.pluralize + "Controller"
        end

        if routes[controller].present?
          routes[controller] << d[:action].to_s
        else
          routes[controller] = [d[:action].to_s]
        end
      end

      routes
    end
  end
end
