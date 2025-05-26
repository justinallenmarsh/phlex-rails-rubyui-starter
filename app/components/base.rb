module Components
  class Base < Phlex::HTML
    TAILWIND_MERGER = ::TailwindMerge::Merger.new.freeze unless defined?(TAILWIND_MERGER)

    attr_reader :attrs

    include Components
    include RubyUI
    include PhlexIcons

    include Phlex::Rails::Helpers::Flash
    include Phlex::Rails::Helpers::FormWith
    include Phlex::Rails::Helpers::Routes
    include Phlex::Rails::Helpers::DOMID
    include Phlex::Rails::Helpers::ClassNames
    include Phlex::Rails::Helpers::TurboFrameTag

    def initialize(**user_attrs)
      @attrs = mix(default_attrs, user_attrs)
      @attrs[:class] = TAILWIND_MERGER.merge(@attrs[:class]) if @attrs[:class]
    end

    if Rails.env.development?
      def before_template
        comment { "Before #{self.class.name}" }
        super
      end
    end

    private

    def default_attrs
      {}
    end
  end
end
