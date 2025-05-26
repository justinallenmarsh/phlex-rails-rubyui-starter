# frozen_string_literal: true

module Components
  class InputError < Base
    def initialize(message:, **attrs)
      @message = message
      super(**attrs)
    end

    def view_template
      p(**attrs) { @message }
    end

    private

    def default_attrs
      { class: "text-sm text-destructive-foreground dark:text-destructive-foreground" }
    end
  end
end
