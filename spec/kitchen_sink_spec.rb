require 'nokogiri'
require_relative '../lib/converter'

KITCHEN_SINK_PATH = 'spec/fixtures/kitchen-sink.pbcore.xml'

def kitchen_sink
  xslt = Nokogiri::XSLT(File.read('lib/kitchen-sink.xsl'))
  doc = Nokogiri::XML(File.read('lib/pbcore-2.0.xsd'), &:noblanks)
  xslt.transform(doc).to_xml
end

if __FILE__ == $0
  File.write(KITCHEN_SINK_PATH, kitchen_sink())
  puts "Updated #{KITCHEN_SINK_PATH}"
  exit(0)
end

describe KITCHEN_SINK_PATH do
  it 'matches current output' do
    output = kitchen_sink()
    expect(output).to eq File.read(KITCHEN_SINK_PATH)
  end
end