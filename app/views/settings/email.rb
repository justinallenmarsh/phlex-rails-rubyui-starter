# frozen_string_literal: true

module Views
  module Settings
    class Email < Views::Base
      def view_template
        Layouts.Settings do
          div(class: "flex-1 md:max-w-2xl") do
            section(class: "max-w-xl space-y-12") do
              div(class: "space-y-6") do
                header do
                  h1(class: "text-2xl font-bold") { "Email" }
                  p(class: "text-muted-foreground text-sm") { "Update your email address" }
                end

                form_with(url: settings_email_path, method: :put, class: "flex flex-col gap-6 w-full") do |form|
                  div(class: "grid gap-6") do
                    div(class: "grid gap-2") do
                      FormFieldLabel(for: "email") { "Email" }
                      Input(
                        class: "w-full",
                        id: "email",
                        name: "email",
                        type: "email",
                        required: true,
                        autofocus: true,
                        autocomplete: "email",
                        placeholder: "email@example.com"
                      )
                    end

                    div(class: "grid gap-2") do
                      FormFieldLabel(for: "password_challenge") { "Current password" }
                      Input(
                        class: "w-full",
                        id: "password_challenge",
                        name: "password_challenge",
                        type: "password",
                        required: true,
                        autocomplete: "current-password"
                      )
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
end
