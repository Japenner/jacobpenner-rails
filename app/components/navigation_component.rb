class NavigationComponent < BaseComponent
  renders_many :links, 'LinkComponent'

  class LinkComponent < ViewComponent::Base
    attr_reader :name, :href, :additional_classes

    def initialize(name:, href:, **kwargs)
      @name = name
      @href = href
      @additional_classes = kwargs[:class]

      super
    end

    def call
      link_to(name, href, **options)
    end

    def classes
      %w[UnderlineNav-item jp-Nav-item].tap do |list|
        list << additional_classes if additional_classes
      end
    end

    def options
      { type: 'button' }.tap do |hash|
        hash.merge!(class: classes)
        hash.merge!(aria: { selected: selected? })
      end
    end

    def selected?
      request.path == href
    end
  end
end
