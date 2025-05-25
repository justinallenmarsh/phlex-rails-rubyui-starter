# frozen_string_literal: true

module Views
  module Registrations
    class New < Views::Base
      def initialize(user:)
        @user = user
      end

      def view_template
        Layouts.Auth do
          h1(class: "text-xl font-medium") { "Create an account" }
          p(class: "text-muted-foreground text-center text-sm") { "Enter your details below to create your account" }
          form_with(url: sign_up_path, class: "flex flex-col gap-6 w-full") do |form|
            div(class: "grid gap-6") do
              if @user&.errors&.any?
                div(class: "bg-destructive/10 text-destructive p-4 rounded-md text-sm") do
                  h2(class: "font-medium") { "#{pluralize(@user.errors.count, 'error')} prohibited this user from being saved:" }
                  ul(class: "list-disc pl-5 mt-2") do
                    @user.errors.each do |error|
                      li { error.full_message }
                    end
                  end
                end
              end

              div(class: "grid gap-2") do
                FormFieldLabel(for: "email") { "Email address" }
                Input(
                  class: "w-full",
                  id: "email",
                  name: "email",
                  type: "email",
                  value: @user&.email,
                  required: true,
                  autofocus: true,
                  tabindex: 1,
                  autocomplete: "email",
                  placeholder: "email@example.com"
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
                  tabindex: 2,
                  autocomplete: "new-password",
                  placeholder: "Password"
                )
                div(class: "text-muted-foreground text-xs") { "12 characters minimum" }
              end

              div(class: "grid gap-2") do
                FormFieldLabel(for: "password_confirmation") { "Confirm password" }
                Input(
                  class: "w-full",
                  id: "password_confirmation",
                  name: "password_confirmation",
                  type: "password",
                  required: true,
                  tabindex: 3,
                  autocomplete: "new-password",
                  placeholder: "Confirm password"
                )
              end


              Button(type: "submit", class: "w-full", tabindex: 4) do
                "Sign up"
              end
            end

            div(class: "flex justify-center items-center text-muted-foreground text-center text-sm") do
              p { "Already have an account? " }
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
