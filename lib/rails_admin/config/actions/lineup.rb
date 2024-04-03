module RailsAdmin
  module Config
    module Actions
      class Lineup < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option(:root?) { true }
        # register_instance_option(:collection?) { true }
        # register_instance_option(:breadcrumb_parent) { nil }
        register_instance_option(:route_fragment) { "lineup" }
        register_instance_option(:link_icon) { "icon-list" }

        register_instance_option :controller do
          proc do
            @talks = Talk.lineup
            render @action.template_name
          end
        end
      end
    end
  end
end
