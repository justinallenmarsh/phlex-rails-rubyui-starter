# frozen_string_literal: true

module Views
  module Identity
    module PasswordResets
      class Edit < Base
        def initialize(user:)
          @user = user
        end

        def view_template
          Layouts.Auth do
            h1(class: "text-xl font-medium") { "Reset password" }
            p(class: "text-muted-foreground text-center text-sm") { "Please enter your new password below" }

            form_with(url: identity_password_reset_path, method: :patch, class: "flex flex-col gap-6 w-full") do |form|
              div(class: "grid gap-6") do
                div(class: "grid gap-2") do
                  FormFieldLabel(for: "email") { "Email" }
                  Input(
                    class: "w-full",
                    id: "email",
                    name: "email",
                    type: "email",
                    value: @user.email,
                    readonly: true,
                    autocomplete: "email"
                  )
                end

                div(class: "grid gap-2") do
                  FormFieldLabel(for: "password") { "Password" }
                  Input(
                    class: "w-full",
                    id: "password",
                    name: "password",
                    type: "password",
                    required: true,
                    autofocus: true,
                    autocomplete: "new-password",
                    placeholder: "Password"
                  )
                end

                div(class: "grid gap-2") do
                  FormFieldLabel(for: "password_confirmation") { "Confirm password" }
                  Input(
                    class: "w-full",
                    id: "password_confirmation",
                    name: "password_confirmation",
                    type: "password",
                    required: true,
                    autocomplete: "new-password",
                    placeholder: "Confirm password"
                  )
                end

                Button(type: "submit", class: "w-full") do
                  "Reset password"
                end
              end
            end
          end
        end
      end
    end
  end
end
