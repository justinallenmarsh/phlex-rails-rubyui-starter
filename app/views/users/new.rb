# frozen_string_literal: true

module Views
  module Users
    class New < Base
      def view_template(&)
        def initialize(user: nil)
          @user = user
        end

        def view_template
          Layouts.Auth do
            h1(class: "text-xl font-medium") { "Create an account" }
            p(class: "text-muted-foreground text-center text-sm") { "Enter your details below to create your account" }
            form_with(url: sign_up_path, class: "flex flex-col gap-6 w-full") do |form|
              div(class: "grid gap-6") do
                FormField do
                  FormFieldLabel(for: "name") { "Full name" }
                  Input(
                    class: "w-full",
                    id: "name",
                    name: "name",
                    type: "text",
                    value: @user&.name,
                    required: true,
                    autofocus: true,
                    tabindex: 1,
                    autocomplete: "name",
                    placeholder: "John Doe"
                  )
                  if @user&.errors&.any?
                    FormFieldError { @user.errors.full_messages_for(:name).first }
                  end
                end

                FormField do
                  FormFieldLabel(for: "email") { "Email address" }
                  Input(
                    class: "w-full",
                    id: "email",
                    name: "email",
                    type: "email",
                    value: @user&.email,
                    required: true,
                    tabindex: 2,
                    autocomplete: "email",
                    placeholder: "email@example.com"
                  )
                  if @user&.errors&.any?
                    FormFieldError { @user.errors.full_messages_for(:email).first }
                  end
                end

                FormField do
                  FormFieldLabel(for: "password") { "Password" }
                  Input(
                    class: "w-full",
                    id: "password",
                    name: "password",
                    type: "password",
                    required: true,
                    tabindex: 3,
                    autocomplete: "new-password",
                    placeholder: "Password"
                  )
                  if @user&.errors&.any?
                    FormFieldError { @user.errors.full_messages_for(:password).first }
                  end
                end

                FormField do
                  FormFieldLabel(for: "password_confirmation") { "Confirm password" }
                  Input(
                    class: "w-full",
                    id: "password_confirmation",
                    name: "password_confirmation",
                    type: "password",
                    required: true,
                    tabindex: 4,
                    autocomplete: "new-password",
                    placeholder: "Confirm password"
                  )
                  if @user&.errors&.any?
                    FormFieldError { @user.errors.full_messages_for(:password_confirmation).first }
                  end
                end

                Button(type: "submit", class: "w-full", tabindex: 5) do
                  "Sign up"
                end
              end

              div(class: "flex justify-center items-center text-muted-foreground text-center text-sm") do
                p { "Already have an account? " }
                Link(href: sign_in_path, tabindex: 6) do
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
