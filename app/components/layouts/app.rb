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
                div(class: "border-sidebar-border/50 flex h-16 shrink-0 items-center gap-2 border-b px-6 transition-[width,height] ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-12 md:px-4") do
                  Sheet(data_action: "click->ruby-ui--sheet-content#close", class: "md:hidden") do
                    SheetTrigger do
                      Button(variant: :ghost) do
                        Lucide.PanelLeft(class: "size-4")
                      end
                    end
                    SheetContent(side: :left, class: "sm:max-w-sm p-0") do
                      Layouts.Sidenav
                    end
                  end
                end
                yield
              end
            end
          end
        end
      end
    end
  end
end
