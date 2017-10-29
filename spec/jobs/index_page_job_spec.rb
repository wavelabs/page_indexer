require 'rails_helper'

RSpec.describe IndexPageJob, type: :job do
  let(:url)   { 'https://relishapp.com/rspec/rspec-core/v/3-7/docs/subject/explicit-subject' }
  let(:page)  { Page.create(url: url) }

  def perform(id)
    VCR.use_cassette('relish') do
      described_class.perform_now(id)
    end
  end

  context 'when page does not exist' do
    it 'does nothing' do
      described_class.perform_now(0)
      expect(Index.count).to eql 0
    end
  end

  context 'when page exists' do
    it 'downloads the content' do
      expect {
        perform(page.id)
      }.to change {
        Page.find(page.id).content
      }
    end

    it 'indexes the page' do
      expect {
        perform(page.id)
      }.to change {
        Index.where(page_id: page.id).count
      }
    end
  end
end
