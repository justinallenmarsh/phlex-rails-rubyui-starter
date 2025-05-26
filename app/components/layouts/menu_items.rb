module Components
  module Layouts
    class MenuItems < Components::Base
      private

      register_value_helper :controller

      def view_template
        render Menu::MenuGroup.new(label: "Platform") do
          render Menu::MenuItem.new href: dashboard_path, active: dashboards_active? do
            Lucide.LayoutGrid(class: "size-5")

            span { "Dashboards" }
          end
        end
      end

      def dashboards_active?
        DashboardController === controller
      end
    end
  end
end
