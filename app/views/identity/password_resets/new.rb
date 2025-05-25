# frozen_string_literal: true

module Views
  module Identity
    module PasswordResets
      class New < Views::Base
        def view_template
          Layouts.Auth do
            div(class: "w-full flex flex-col gap-4 items-center") do
              h1 { "Forgot your password?" }
              p(class: "text-muted-foreground text-center text-sm") { "Enter your email below to receive a password reset link" }
              form_with(url: identity_password_reset_path, class: "flex flex-col gap-4 w-full") do
                FormFieldLabel(for: :email) { "Email address" }
                Input(id: :email, name: :email, required: true, autofocus: true, type: :email, class: "w-full", placeholder: "email@example.com")
                Button(type: :submit, class: "w-full") do
                  "Send password reset email"
                end
              end
              div(class: "flex justify-center items-center text-muted-foreground text-center text-sm") do
                p { "Or, return to " }
                Link(href: sign_in_path, tabindex: 5) do
                  "Log in"
                end
              end
            end
          end
        end
      end
    end
  end
end
