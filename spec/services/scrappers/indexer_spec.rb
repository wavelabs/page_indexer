require 'rails_helper'

describe Scrappers::Indexer do
  let(:url) { 'https://relishapp.com/rspec/rspec-core/v/3-7/docs/subject/explicit-subject' }

  let(:page) do
    VCR.use_cassette('relish') { Scrappers::PageDownloader.download(url) }
  end

  subject { described_class.new(page) }

  it 'returns h1s' do
    expect(subject.h1s).to be_a(Array)
  end

  it 'returns h2s' do
    expect(subject.h2s).to be_a(Array)
  end

  it 'returns h3s' do
    expect(subject.h3s).to be_a(Array)
  end

  it 'returns links' do
    expect(subject.links).to be_a(Array)
  end

  it 'returns all indexes' do
    expect(subject.all.size).to eql(subject.h1s.size + subject.h2s.size + subject.h3s.size + subject.links.size)
  end
end
