# frozen_string_literal: true

module Components
  module Menu
    class Menu < Components::Base
      def initialize(**attrs)
        super(**attrs)
      end

      private

      def view_template(&)
        ul(**attrs) do
          yield
        end
      end

      def default_attrs
        {
          class: "p-2 flex flex-col gap-1"
        }
      end
    end
  end
end
