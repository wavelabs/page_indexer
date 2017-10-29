module Scrappers
  class Indexer
    H1_TAG = 'h1'
    H2_TAG = 'h2'
    H3_TAG = 'h3'
    A_TAG  = 'a'

    def initialize(page)
      @page = Nokogiri::HTML(page)
    end

    def all
      @all ||= h1s + h2s + h3s + links
    end

    def h1s
      @h1s ||= page.css(H1_TAG).map { |element| Scrappers::Index.new(element) }
    end

    def h2s
      @h2s ||= page.css(H2_TAG).map { |element| Scrappers::Index.new(element) }
    end

    def h3s
      @h3s ||= page.css(H3_TAG).map { |element| Scrappers::Index.new(element) }
    end

    def links
      @links ||= page.css(A_TAG).map { |element| Scrappers::Index.new(element) }
    end

    private

    attr_reader :page
  end
end
