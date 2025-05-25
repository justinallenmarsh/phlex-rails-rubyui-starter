module Components
  module Layouts
    class Auth < Base
      private

      def view_template(&)
        Layouts.Root do
          div class: "bg-background flex min-h-svh flex-col items-center justify-center gap-6 p-6 md:p-10", &
        end
      end
    end
  end
end
