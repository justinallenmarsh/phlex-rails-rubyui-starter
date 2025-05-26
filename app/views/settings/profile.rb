# frozen_string_literal: true

module Views
  module Settings
    class Profile < Views::Base
      def initialize(user:)
        @user = user
      end

      def view_template
        Layouts.Settings do
          div(class: "flex-1 md:max-w-2xl") do
            section(class: "max-w-xl space-y-12") do
              div(class: "space-y-6") do
                h1(class: "text-2xl font-bold") { "Profile information" }
                p(class: "text-sm text-muted-foreground") { "Update your name" }

                form_with(url: settings_profile_path, method: :put, class: "flex flex-col gap-6 w-full") do |form|
                  div(class: "grid gap-2") do
                    FormFieldLabel(for: "name") { "Name" }
                    Input(
                      class: "w-full",
                      id: "name",
                      name: "name",
                      type: "text",
                      required: true,
                      autofocus: true,
                      tabindex: 1,
                      autocomplete: "name",
                      placeholder: "Your name",
                      value: @user.name
                      )

                    if @user.errors.any?
                      @user.errors.full_messages_for(:name).each do |message|
                        render InputError.new(message:)
                      end
                    end
                  end

                  Button(type: "submit", class: "w-full", tabindex: 2) do
                    "Update profile"
                  end
                end
              end

              div(class: "space-y-6") do
                h1(class: "text-2xl font-bold") { "Delete account" }
                p(class: "text-sm text-muted-foreground") { "Delete your account and all of its resources" }

                Alert(variant: :destructive) do
                  AlertTitle { "Warning" }
                  AlertDescription { "This action cannot be undone" }
                  form_with(url: settings_profile_path, method: :delete, class: "mt-4") do |form|
                    Button(type: "submit", variant: :destructive, class: "w-full") do
                      "Delete account"
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
