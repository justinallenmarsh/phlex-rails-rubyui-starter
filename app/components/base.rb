module Components
  class Base < Phlex::HTML
    include Components
    include RubyUI

    # Include any helpers you want to be available across all components
    include Phlex::Rails::Helpers::Flash
    include Phlex::Rails::Helpers::FormWith
    include Phlex::Rails::Helpers::Routes

    if Rails.env.development?
      def before_template
        comment { "Before #{self.class.name}" }
        super
      end
    end
  end
end
