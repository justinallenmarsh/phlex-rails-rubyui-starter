# frozen_string_literal: true

module Views
  module Settings
    class Appearance < Views::Base
      def view_template
        Layouts.Settings do
          div(class: "flex-1 md:max-w-2xl") do
            section(class: "max-w-xl space-y-12") do
              h1(class: "mb-0.5 text-base font-medium") { "Appearance" }
              p(class: "text-muted-foreground text-sm") { "Manage your appearance settings" }
              ThemeToggle do |toggle|
                SetLightMode do
                  Button(variant: :primary, class: "flex gap-2") do
                    Lucide.Sun(class: "size-4")
                    span { "Light" }
                  end
                end

                SetDarkMode do
                  Button(variant: :primary, class: "flex gap-2") do
                    Lucide.Moon(class: "size-4")
                    span { "Dark" }
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
