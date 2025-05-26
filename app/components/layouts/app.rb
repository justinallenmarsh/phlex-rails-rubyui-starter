module Components
  module Layouts
    class App < Base
      def view_template(&)
        Layouts.Root do
          div(class: "flex bg-background") do
            div(class: "hidden lg:flex") do
              Layouts.Sidenav
            end
            main(class: "flex rounded-md min-h-screen flex-col w-full items-center lg:justify-center lg:pt-2 lg:pb-2 lg:pr-2 md:pl-2") do
              yield
            end
          end
        end
      end
    end
  end
end
