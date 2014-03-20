module Missing
  class Action
    def self.all
      Rails.application.eager_load!

      actions = Hash.new([])

      ApplicationController.descendants.each do |c|
        filters = c._process_action_callbacks.map(&:filter) rescue []
        c.ancestors.each do |ac|
          break if ac == ApplicationController
          next if c == ac

          ac_filters = ac._process_action_callbacks.map(&:filter) rescue []

          filters -= ac_filters
        end

        action_methods = c.public_instance_methods(false).reject { |e|
          e =~ /one_time_conditions/ || filters.include?(e)
        }

        actions[c.name] = action_methods.to_a.map(&:to_s)
      end

      actions
    end
  end
end
