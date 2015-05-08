require 'nokogiri'
require_relative '../lib/converter'
require_relative '../lib/turtler'

describe 'kitchen-sink' do
  it 'matches current output' do
    xslt = Nokogiri::XSLT(File.read('lib/kitchen-sink.xsl'))
    doc = Nokogiri::XML(File.read('lib/pbcore-2.0.xsd'), &:noblanks)
    output = xslt.transform(doc).to_xml
    expect(output).to eq File.read('spec/fixtures/pending.kitchen-sink.pbcore.xml')
  end
end