module Views
  module Sessions
    class New < Views::Base
      def view_template
        Layouts.Auth do
          h1(class: "text-xl font-medium") { "Log in to your account" }
          p(class: "text-muted-foreground text-center text-sm") { "Enter your email and password below to log in" }
          form_with(url: sign_in_path, class: "flex flex-col gap-6 w-full") do |form|
            div(class: "grid gap-6") do
              div(class: "grid gap-2") do
                FormFieldLabel(for: "email") { "Email address" }
                Input(
                  class: "w-full",
                  id: "email",
                  name: "email",
                  type: "email",
                  required: true,
                  autofocus: true,
                  tabindex: 1,
                  autocomplete: "email",
                  placeholder: "email@example.com"
                )
              end

              div(class: "grid gap-2") do
                div(class: "flex items-center") do
                  FormFieldLabel(for: "password") { "Password" }
                  Link(href: new_identity_password_reset_path, class: "ml-auto text-sm", tabindex: 5
                  ) do
                    "Forgot password?"
                  end
                end
                Input(
                  class: "w-full",
                  id: "password",
                  name: "password",
                  type: "password",
                  required: true,
                  tabindex: 2,
                  autocomplete: "current-password",
                  placeholder: "Password"
                )
              end

              Button(type: "submit", class: "w-full", tabindex: 4) do
                "Log in"
              end
            end

            div(class: "flex justify-center items-center text-muted-foreground text-center text-sm") do
              p { "Don't have an account? " }
              Link(href: sign_up_path, tabindex: 5) do
                "Sign up"
              end
            end
          end
        end
      end
    end
  end
end
