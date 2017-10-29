class IndexPageJob < ApplicationJob
  queue_as :default

  def perform(page_id)
    page    = Page.find(page_id)
    content = page.download
    indexer = Scrappers::Indexer.new(content)
    indexer.all.each do |index|
      page.indexes.create(
        tag:     index.tag,
        content: index.content,
        link:    index.link
      )
    end

    if page.save
      Rails.logger.info "Page id=#{page.id} has been indexed successfully"
    end
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.error "Unable to Index a missing page. Details: #{e.message}"
  end
end
