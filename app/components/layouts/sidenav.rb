module Components
  module Layouts
    class Sidenav < Components::Base
      def view_template
        render Menu::Menu.new size: :lg, class: "h-dvh flex flex-col justify-between bg-base-200 min-h-full w-(--sidebar-width)" do
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
            render Menu::MenuItem.new href: "https://github.com/jmarsh24/phlex-rails-rubyui-starter", target: "_blank", class: "flex justify-start w-full text-muted-foreground gap-2" do
              Lucide.Folder(class: "size-4")

              span { "Repository" }
            end

            render Menu::MenuItem.new href: "https://phlex.fun", target: "_blank", class: "flex justify-start w-full text-muted-foreground gap-2" do
              Lucide.BookOpen(class: "size-4")

              span { "Documentation" }
            end

            ul(class: "flex flex-col gap-2 w-full") do
              render DropdownMenu.new(options: { trigger: "click" }) do
                DropdownMenuTrigger(class: "w-full") do
                  render RubyUI::Button.new(variant: :ghost, size: :md, class: "w-full flex justify-between items-center px-2") do
                    div(class: "flex items-center gap-2") do
                      render Avatar.new(class: "size-7") do
                        AvatarFallback(class: "bg-neutral-200 text-black dark:bg-neutral-700 dark:text-white text-sm text-muted-foreground") { "EU" }
                      end
                      span(class: "text-sm") { "user@example.com" }
                    end
                    Lucide.ChevronsUpDown(class: "size-4")
                  end
                end

                DropdownMenuContent(class: "bg-background") do
                  div(class: "flex items-center gap-4 p-2") do
                    render Avatar.new(class: "size-8") do
                      AvatarFallback { "EU" }
                    end
                    div(class: "flex flex-col") do
                      span(class: "text-sm font-medium text-primary") { "user@example.com" }
                    end
                  end

                  render DropdownMenuSeparator.new

                  DropdownMenuItem(href: settings_profile_path, class: "flex items-center gap-4 px-2 py-1.5 text-sm") do
                    Lucide.Settings(class: "size-4")
                    span { "Settings" }
                  end

                  render DropdownMenuSeparator.new

                  DropdownMenuItem(class: "w-full", href: session_path(Current.session), data_turbo_method: :delete) do
                    button(type: :submit, class: "flex gap-4") do
                      Lucide.LogOut(class: "size-4")
                      span { "Log out" }
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
