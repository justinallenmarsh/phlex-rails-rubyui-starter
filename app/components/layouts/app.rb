module Components
  module Layouts
    class App < Base
      def view_template(&)
        Layouts.Root do
          div(class: "flex bg-sidebar") do
            div(class: "hidden md:block") do
              Layouts.Sidenav
            end
            div(class: "bg-sidebar h-dvh bg-background relative flex w-full flex-1 flex-col lg:pt-2 lg:pb-2 lg:pr-2 md:pl-2") do
              main(class: "bg-background flex w-full flex-1 flex-col rounded-lg") do
                  yield
              end
            end
          end
        end
      end
    end
  end
end
