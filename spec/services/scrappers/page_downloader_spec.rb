require 'rails_helper'

describe Scrappers::PageDownloader do
  context 'when it is a valid url' do
    let(:url) { 'https://relishapp.com/rspec/rspec-core/v/3-7/docs/subject/explicit-subject' }

    it 'download the page' do
      VCR.use_cassette('relish') do
        html_text = described_class.download(url)
        expect(html_text).to include('RSpec Core 3.7')
      end
    end
  end
end
