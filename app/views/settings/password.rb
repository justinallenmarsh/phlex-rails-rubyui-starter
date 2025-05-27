# frozen_string_literal: true

module Views
  module Settings
    class Password < Views::Base
      def initialize(user:)
        @user = user
      end

      def view_template
        render Layouts::Settings do
          div(class: "flex-1 md:max-w-2xl") do
            section(class: "max-w-xl space-y-12") do
            div(class: "space-y-6") do
              header do
                h1(class: "text-2xl font-bold") { "Update password" }
                p(class: "text-muted-foreground text-sm") { "Ensure your account is using a long, random password to stay secure" }
              end

              form_with(url: settings_password_path, method: :patch, class: "space-y-6") do |form|
                div(class: "grid gap-2") do
                  FormFieldLabel(for: "password_challenge") { "Current password" }
                  Input(
                    class: "w-full",
                    id: "password_challenge",
                    name: "password_challenge",
                    type: "password",
                    required: true,
                    autofocus: true,
                    autocomplete: "current-password"
                  )
                  FormFieldError { @user.errors.full_messages_for(:password_challenge).first }
                end

                div(class: "grid gap-2") do
                  FormFieldLabel(for: "password") { "New password" }
                  Input(
                    class: "w-full",
                    id: "password",
                    name: "password",
                    type: "password",
                    required: true,
                    autocomplete: "new-password"
                  )
                  FormFieldError { @user.errors.full_messages_for(:password).first }
                end

                div(class: "grid gap-2") do
                  FormFieldLabel(for: "password_confirmation") { "Confirm new password" }
                  Input(
                    class: "w-full",
                    id: "password_confirmation",
                    name: "password_confirmation",
                    type: "password",
                    required: true,
                    autocomplete: "new-password"
                  )
                  FormFieldError { @user.errors.full_messages_for(:password_confirmation).first }
                end

                Button(type: "submit", class: "w-full") do
                  "Save changes"
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
