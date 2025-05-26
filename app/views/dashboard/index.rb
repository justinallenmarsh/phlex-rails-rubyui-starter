# frozen_string_literal: true

module Views
  module Dashboard
    class Index < Views::Base
      def view_template
        Layouts.App do
          div { "Dashboard" }
        end
      end
    end
  end
end
