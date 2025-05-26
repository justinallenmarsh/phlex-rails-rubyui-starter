# frozen_string_literal: true

module Components
  module Menu
    class MenuGroup < Components::Base
      def initialize(label: nil, **attrs)
        @label = label
        super(**attrs)
      end

      private

      def view_template(&)
        div(**attrs) do
          if @label
            div(class: "px-2 py-1 text-xs font-semibold text-muted-foreground") do
              @label
            end
          end
          ul(class: "flex flex-col gap-1") do
            yield
          end
        end
      end

      def default_attrs
        { class: "px-2 py-1" }
      end
    end
  end
end
