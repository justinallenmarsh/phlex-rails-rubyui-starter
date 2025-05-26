# frozen_string_literal: true

module Components
  module Menu
    class MenuItem < Components::Base
      def initialize(active: false, **attrs)
        @active = active
        super(**attrs)
      end

      private

      def view_template(&)
        li(class: "w-full flex") do
          render Link.new(
            href: attrs[:href],
            variant: :ghost,
            size: :md,
            class: class_names(
              "w-full flex gap-2 justify-start px-2",
              "bg-muted": @active
            ),
            **attrs.except(:href)
          ) do
            yield
          end
        end
      end
    end
  end
end
