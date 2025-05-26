module Components
  module Layouts
    class App < Base
      private

      def view_template(&)
        Layouts.Root do
          main_container do
            yield
          end
        end
      end

      def main_container(&)
        main(
          class: "flex min-h-screen flex-col items-center bg-[#FDFDFC] p-6 text-[#1b1b18] lg:justify-center lg:p-8 dark:bg-[#0a0a0a]",
          &
        )
      end
    end
  end
end
