module Views
  module Home
    class Index < Views::Base
      def initialize(user: nil)
        @user = user
      end

      def view_template
        Layouts.App do
          div(class: "flex flex-col w-full items-center justify-center opacity-100 transition-opacity duration-750 lg:grow starting:opacity-0") do
            header(class: "mb-6 w-full max-w-[335px] text-sm not-has-[nav]:hidden lg:max-w-4xl") do
              nav(class: "flex items-center justify-end gap-4") do
                if @user
                  Link(
                    href: dashboard_path,
                    variant: :link,
                  ) { "Dashboard" }
                else
                  Link(
                    href: sign_in_path,
                    variant: :link,
                  ) { "Log in" }
                end
              end
            end
            main(class: "flex w-full max-w-[335px] flex-col-reverse lg:max-w-4xl lg:flex-row") do
              div(class: "flex-1 rounded-br-lg rounded-bl-lg bg-white p-6 pb-12 text-[13px] leading-[20px] shadow-[inset_0px_0px_0px_1px_rgba(26,26,0,0.16)] lg:rounded-tl-lg lg:rounded-br-none lg:p-20 dark:bg-[#161615] dark:text-[#EDEDEC] dark:shadow-[inset_0px_0px_0px_1px_#fffaed2d]") do
                h1(class: "mb-1 font-medium") { "Phlex RubyUI Rails Starter Kit" }
                p(class: "mb-2 text-[#706f6c] dark:text-[#A1A09A]") do
                  span { "Rails + Phlex + RubyUI" }
                  br
                  span { "Here are some resources to begin:" }
                end

                ul(class: "mb-4 flex flex-col items-start lg:mb-6") do
                  [
                    { text: "Phlex Docs", href: "https://www.phlex.fun/introduction/" },
                    { text: "RubyUI Components", href: "https://rubyui.com/docs/introduction" },
                    { text: "Rails Guides", href: "https://guides.rubyonrails.org" }
                  ].each do |resource|
                    li(class: "relative flex items-center") do
                      span(class: "flex h-3.5 w-3.5 items-center justify-center rounded-full border border-[#e3e3e0] bg-[#FDFDFC] shadow-[0px_0px_1px_0px_rgba(0,0,0,0.03),0px_1px_2px_0px_rgba(0,0,0,0.06)] dark:border-[#3E3E3A] dark:bg-[#161615]") do
                        span(class: "h-1.5 w-1.5 rounded-full bg-[#dbdbd7] dark:bg-[#3E3E3A]")
                      end
                      render Link.new(href: resource[:href], variant: :link, class: "text-red-500 flex items-center gap-1") do
                        span { resource[:text] }
                        render ExternalLinkIcon.new(class: "h-2.5 w-2.5")
                      end
                    end
                  end
                end

                ul(class: "flex gap-3 text-sm leading-normal") do
                  li do
                    a(
                      href: "https://www.phlex.fun/",
                      target: "_blank",
                      rel: "noreferrer",
                      class: "inline-block rounded-sm border border-black bg-[#1b1b18] px-5 py-1.5 text-sm leading-normal text-white hover:border-black hover:bg-black dark:border-[#eeeeec] dark:bg-[#eeeeec] dark:text-[#1C1C1A] dark:hover:border-white dark:hover:bg-white"
                    ) { "Learn More" }
                  end
                end
              end

              div(class: "relative -mb-px aspect-[335/376] w-full shrink-0 overflow-hidden rounded-t-lg bg-[#D30001] p-10 text-white lg:mb-0 lg:-ml-px lg:aspect-auto lg:w-[438px] lg:rounded-t-none lg:rounded-r-lg") do
                render AppLogoIcon.new(class: "h-full w-full")
              end
            end
          end
        end
      end
    end
  end
end
