# frozen_string_literal: true

module Views
  module Settings
    class Email < Views::Base
      def initialize(user:)
        @user = user
      end

      def view_template
        Layouts.Settings do
          div(class: "flex-1 md:max-w-2xl") do
            section(class: "max-w-xl space-y-12") do
              div(class: "space-y-6") do
                header do
                  h1(class: "text-2xl font-bold") { "Email" }
                  p(class: "text-muted-foreground text-sm") { "Update your email address" }
                end

                form_with(url: settings_email_path, method: :put, class: "space-y-6") do |form|
                  FormField do
                    FormFieldLabel(for: "email") { "Email" }
                    Input(
                      name: "email",
                      type: "email",
                      required: true,
                      autofocus: true,
                      autocomplete: "email",
                      value: @user.email
                    )
                    FormFieldError { @user.errors.full_messages_for(:email).first }
                    unless @user.verified?
                      div(class: "flex gap-2 items-center") do
                        p(class: "text-muted-foreground text-sm") do
                          "Your email address is unverified."
                        end
                        Link(
                          href: identity_email_verification_path,
                          as: "button",
                          class: "underline p-0 h-auto"
                        ) do
                          "Click here to resend the verification email."
                        end
                      end
                    end
                  end

                  FormField do
                    FormFieldLabel(for: "password_challenge") { "Current password" }
                    Input(
                      name: "password_challenge",
                      type: "password",
                      autocomplete: "current-password"
                    )
                    div(class: "text-destructive") do
                      @user.errors.full_messages_for(:password_challenge).first
                    end
                  end

                  div(class: "flex items-center gap-4") do
                    Button(type: "submit") do
                      "Save"
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
