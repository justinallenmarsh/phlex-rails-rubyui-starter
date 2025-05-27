# frozen_string_literal: true

module Views
  module Dashboard
    class Index < Views::Base
      def page_title = "Dashboard"
      def layout = Layouts::App

      def view_template
        div(class: "flex h-full w-full flex-1 flex-col gap-4 rounded-xl p-4 bg-background") do
          div(class: "grid auto-rows-min gap-4 md:grid-cols-3") do
            div(class: "border-sidebar-border/70 dark:border-sidebar-border relative aspect-video overflow-hidden rounded-xl border") do
              render PlaceHolderPattern(class: "absolute inset-0 size-full stroke-neutral-900/20 dark:stroke-neutral-100/20")
            end
            div(class: "border-sidebar-border/70 dark:border-sidebar-border relative aspect-video overflow-hidden rounded-xl border") do
              render PlaceHolderPattern(class: "absolute inset-0 size-full stroke-neutral-900/20 dark:stroke-neutral-100/20")
            end
            div(class: "border-sidebar-border/70 dark:border-sidebar-border relative aspect-video overflow-hidden rounded-xl border") do
              render PlaceHolderPattern(class: "absolute inset-0 size-full stroke-neutral-900/20 dark:stroke-neutral-100/20")
            end
          end
          div(class: "border-sidebar-border/70 dark:border-sidebar-border relative min-h-[100vh] flex-1 overflow-hidden rounded-xl border md:min-h-min") do
            render PlaceHolderPattern(class: "absolute inset-0 size-full stroke-neutral-900/20 dark:stroke-neutral-100/20")
          end
        end
      end
    end
  end
end
