# frozen_string_literal: true

module Views
  module Settings
    class Sessions < Views::Base
      def initialize(sessions:)
        @sessions = sessions
      end

      def view_template
        Layouts.Settings do
          div(class: "flex-1 md:max-w-2xl") do
            section(class: "max-w-xl space-y-12") do
              h1(class: "mb-0.5 text-base font-medium") { "Sessions" }
              p(class: "text-muted-foreground text-sm") { "Manage your active sessions across devices" }
              div(class: "space-y-6") do
                div(class: "space-y-4") do
                  @sessions.each do |session|
                    div(id: dom_id(session), class: "flex flex-col space-y-2 rounded-lg border p-4") do
                      div(class: "flex items-center justify-between") do
                        div(class: "space-y-1") do
                          p(class: "font-medium") do
                            plain session.user_agent
                            if session == Current.session
                              span(class: "inline-flex items-center justify-center rounded-md border px-2 py-0.5 text-xs font-medium w-fit whitespace-nowrap shrink-0 [&>svg]:size-3 gap-1 [&>svg]:pointer-events-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px] aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive transition-[color,box-shadow] overflow-hidden border-transparent bg-secondary text-secondary-foreground [a&]:hover:bg-secondary/90 ml-2") do
                                "Current"
                              end
                            end
                          end
                          p(class: "text-muted-foreground text-sm") { "IP: #{session.ip_address}" }
                          p(class: "text-muted-foreground text-sm") { "Active since: #{session.created_at.strftime('%m/%d/%Y, %I:%M:%S %p')}" }
                        end
                      end
                      unless session == Current.session
                        form_with(url: session_path(session), method: :delete) do |form|
                          Button(type: :submit, variant: :destructive) { "Log out" }
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
