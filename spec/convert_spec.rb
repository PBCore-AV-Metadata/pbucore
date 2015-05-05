require 'nokogiri'
require_relative '../lib/converter'
require_relative '../lib/turtler'

describe 'converter' do
  PENDING_RE = /\/pending/
  
  describe 'pbcore -> rdf-xml' do
    inputs = Dir[File.dirname(__FILE__) + '/fixtures/*.pbcore.xml'].reject{|path| path=~PENDING_RE}
    inputs.each do |pbcore_path|
      rdf_path = pbcore_path.sub('.pbcore.xml', '.rdf.xml')
      it "converts #{File.basename(pbcore_path)} to #{File.basename(rdf_path)}" do
        rdf_xml_actual = Converter.instance.convert(pbcore_path)
        rdf_xml_expected = Nokogiri::XML(File.read(rdf_path), &:noblanks).to_xml
        # Remove indentation for the sake of the diff.
        expect(rdf_xml_actual.gsub('><', ">\n<").gsub(/^\s+/, '')).to eq rdf_xml_expected.gsub('><', ">\n<").gsub(/^\s+/, '')
      end
    end
  end
  
  describe 'rdf-xml -> turtle' do
    inputs = Dir[File.dirname(__FILE__) + '/fixtures/*.rdf.xml'].reject{|path| path=~PENDING_RE}
    inputs.each do |rdf_xml_path|
      turtle_path = rdf_xml_path.sub('.rdf.xml', '.ttl')
      it "converts #{File.basename(rdf_xml_path)} to #{File.basename(turtle_path)}" do
        turtle_actual = Turtler.instance.turtle(rdf_xml_path)
        turtle_expected = File.read(turtle_path)
        expect(turtle_actual.gsub(/^\s+/, '')).to eq turtle_expected.gsub(/^\s+/, '')
      end
    end
  end
  
#  it 'has no stray fixtures' do
#    all = Dir[File.dirname(__FILE__) + '/fixtures/*'].reject{|path| path=~PENDING_RE}
#    expect(all.count).to eq inputs.count * 3
#  end
end
