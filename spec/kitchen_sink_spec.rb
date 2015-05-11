require 'nokogiri'
require_relative '../lib/converter'

KITCHEN_SINK_PATH = 'spec/fixtures/kitchen-sink.pbcore.xml'

def uniquify(node)
  "#{node.respond_to?(:value) ? node.value : node.content}_#{node.path.gsub(/\/text\(\)|\*|\[|\]/,'')}"
end

def kitchen_sink
  xslt = Nokogiri::XSLT(File.read('lib/kitchen-sink.xsl'))
  doc = Nokogiri::XML(File.read('lib/pbcore-2.0.xsd'), &:noblanks)
  transformed = xslt.transform(doc)
  transformed.traverse do |node|
    if node.text? && node.text != 'tri;ple;let;ter' && node.text != 'Spatial'
      node.content = uniquify(node)
    end
    node.attribute_nodes.each do |attribute|
      attribute.value = uniquify(attribute)
    end
  end
  transformed.to_xml
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