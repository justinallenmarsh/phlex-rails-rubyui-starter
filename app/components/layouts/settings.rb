# frozen_string_literal: true

module Components
  module Layouts
    class Settings < Components::Base
      register_value_helper :controller

      def view_template(&)
        Layouts.App do
          div(class: "px-4 py-6") do
            div(class: "mb-8 space-y-0.5") do
              h1(class: "text-2xl font-bold") { "Settings" }
              p(class: "text-sm text-gray-500") { "Manage your account settings and preferences." }
            end

            div(class: "flex flex-col space-y-8 lg:flex-row lg:space-y-0 lg:space-x-12") do
              aside(class: "w-full max-w-xl lg:w-48") do
                nav(class: "flex flex-col space-y-1 space-x-0") do
                  Link(href: settings_profile_path, class: class_names("justify-start", "bg-muted": profile_active?), variant: :ghost) { "Profile" }
                  Link(href: settings_email_path, class: class_names("justify-start", "bg-muted": email_active?), variant: :ghost) { "Email" }
                  Link(href: settings_password_path, class: class_names("justify-start", "bg-muted": password_active?), variant: :ghost) { "Password" }
                  Link(href: settings_sessions_path, class: class_names("justify-start", "bg-muted": sessions_active?), variant: :ghost) { "Sessions" }
                end
              end
              yield
            end
          end
        end
      end

      def profile_active?
        ::Settings::ProfilesController === controller
      end

      def email_active?
        ::Settings::EmailsController === controller
      end

      def password_active?
        ::Settings::PasswordsController === controller
      end

      def sessions_active?
        ::Settings::SessionsController === controller
      end
    end
  end
end
