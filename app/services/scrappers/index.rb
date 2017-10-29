module Scrappers
  class Index
    def initialize(element)
      @element = element
    end

    def tag
      @tag ||= element.name
    end

    def content
      @content ||= element.content.strip
    end

    def link
      @link ||= element.attributes['href']&.value
    end

    private

    attr_reader :element
  end
end
