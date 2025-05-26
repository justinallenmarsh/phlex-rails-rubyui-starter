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

                form_with(url: settings_profile_path, method: :put, class: "flex flex-col gap-6 w-full", id: "profile_form") do |form|
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
                  div(class: "space-y-4") do
                    AlertTitle { "Warning" }
                    AlertDescription { "Please proceed with caution, this cannot be undone." }
                  end

                  div(class: "mt-4") do
                    Dialog do
                      DialogTrigger do
                        Button(variant: :destructive, class: "w-full") { "Delete account" }
                      end
                      DialogContent do
                        DialogHeader do
                          DialogTitle { "Are you sure you want to delete your account?" }
                          DialogDescription do
                            "This action is permanent and cannot be undone. All your data, including your profile, settings, and associated resources, will be deleted. To confirm, please type your email address below."
                          end
                        end
                        DialogMiddle do
                          form_with(url: users_path, method: :delete, id: "delete_form") do |form|
                            div(class: "space-y-4") do
                              div(class: "grid gap-2") do
                                FormFieldLabel(for: "password_challenge") { "Confirm Password" }
                                Input(
                                  class: "w-full",
                                  id: "password_challenge",
                                  name: "password_challenge",
                                  type: "password",
                                  required: true,
                                  autofocus: true,
                                  tabindex: 1,
                                  autocomplete: "current-password",
                                  placeholder: "Enter your password"
                                )
                                if @user.errors.any?
                                  @user.errors.full_messages_for(:password_challenge).each do |message|
                                    render InputError.new(message:)
                                  end
                                end
                              end
                            end
                          end
                        end
                        DialogFooter do
                          Button(
                            variant: :secondary,
                            data: { action: "click->ruby-ui--dialog#dismiss" },
                            tabindex: 2
                          ) { "Cancel" }
                          Button(
                            type: "submit",
                            form: "delete_form",
                            variant: :destructive,
                            tabindex: 3
                          ) { "Delete account" }
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
  end
end
