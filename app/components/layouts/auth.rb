# frozen_string_literal: true

module Components
  module Layouts
    class Auth < Base
      private

      def view_template(&block)
        Layouts.Root do
          div(class: "bg-background flex min-h-svh flex-col items-center justify-center gap-6 p-6 md:p-10") do
            div(class: "w-full max-w-sm") do
              div(class: "flex flex-col items-center gap-6") do
                Link(href: root_path) do
                  render AppLogoIcon.new
                  span(class: "sr-only") { "Log in to your account" }
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
