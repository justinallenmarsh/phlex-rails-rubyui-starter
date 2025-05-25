module Components
  module Layouts
    class Flash < Base
      COLORS = {
        "notice" => :success,
        "alert" => :destructive,
        "warning" => :warning
      }.freeze

      private

      def render? = flash.any?

      def view_template
        div(class: "fixed bottom-6 right-6") do
          flash.each do |type, message|
            Alert(variant: COLORS[type]) do
              AlertTitle { message }
            end
          end
        end
      end
    end
  end
end
