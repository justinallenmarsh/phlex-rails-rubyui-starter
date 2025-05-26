module Components
  module Layouts
    class Sidenav < Components::Base
      private

      def view_template
        render Menu::Menu.new size: :lg, class: "flex flex-col justify-between bg-base-200 min-h-full w-(--sidebar-width)" do
          div(class: "flex flex-col gap-2") do
            div(class: "flex gap-3 items-center p-2") do
              div(class: "p-1 round-md bg-ruby-red rounded-md") do
                render AppLogoIcon.new(class: "size-6")
              end
              span class: "flex gap-2 font-semibold text-primary text-center text-sm" do
                "Phlex Rails Starter Kit"
              end
            end
            Layouts.MenuItems
          end


          div(class: "flex flex-col gap-2 items-start items-center p-2") do
            render Menu::MenuItem.new href: "https://github.com/jmarsh24/phlex-rails-rubyui-starter", target: "_blank", class: "text-muted-foreground gap-2" do
              Lucide.Folder(class: "size-4")

              span { "Repository" }
            end

            render Menu::MenuItem.new href: "https://phlex.fun", target: "_blank", class: "text-muted-foreground gap-2" do
              Lucide.BookOpen(class: "size-4")

              span { "Documentation" }
            end
          end
        end
      end
    end
  end
end
