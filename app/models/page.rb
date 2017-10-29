class Page < ApplicationRecord
  has_many :indexes, dependent: :destroy

  validates :url, uniqueness: true

  def download(downloader: Scrappers::PageDownloader)
    self.content = downloader.download(url)
  end
end
