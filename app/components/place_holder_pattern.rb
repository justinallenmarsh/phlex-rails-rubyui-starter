# frozen_string_literal: true

module Components
  class PlaceHolderPattern < Base
    def view_template
      svg(class: "absolute inset-0 size-full stroke-neutral-900/20 dark:stroke-neutral-100/20", fill: "none") do |s|
        s.defs do
          s.pattern(id: unique_id, x: "0", y: "0", width: "8", height: "8", patternUnits: "userSpaceOnUse") do
            s.path d: "M-1 5L5 -1M3 9L8.5 3.5", stroke_width: "0.5"
          end
        end
        s.rect stroke: "none", fill: "url(##{unique_id})", width: "100%", height: "100%"
      end
    end

    private

    def unique_id
      @unique_id ||= SecureRandom.hex(4)
    end
  end
end
