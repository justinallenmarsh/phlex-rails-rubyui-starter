# frozen_string_literal: true

module Components
  class ExternalLinkIcon < Components::Base
    def initialize(**attrs)
      super(**attrs)
    end

    def view_template
      svg(
        width: "10",
        height: "11",
        viewBox: "0 0 10 11",
        xmlns: "http://www.w3.org/2000/svg",
        **attrs
      ) do |s|
        s.path(
          d: "M7.70833 6.95834V2.79167H3.54167M2.5 8L7.5 3.00001",
          stroke: "currentColor",
          stroke_linecap: "square"
        )
      end
    end

    private

    def default_attrs
      {
        class: "h-2.5 w-2.5"
      }
    end
  end
end
