require 'net/http'

module Scrappers
  class PageDownloader
    def self.download(url)
      uri = URI(url)
      Net::HTTP.get(uri)
    end
  end
end
