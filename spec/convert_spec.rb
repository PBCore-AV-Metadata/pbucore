require 'nokogiri'
require_relative '../lib/converter'
require_relative '../lib/turtler'

describe 'converter' do
  PENDING_RE = /\/pending/
  FRAGMENT_RE = /fragment/
  
  describe 'pbcore validation' do
    inputs = Dir[File.dirname(__FILE__) + '/fixtures/*.pbcore.xml'].reject{|path| path=~PENDING_RE || path=~FRAGMENT_RE}
    inputs.each do |pbcore_path|
      it "validates #{File.basename(pbcore_path)}" do
        expect { Converter.instance.validate(pbcore_path) }.not_to raise_error
      end
    end
  end
  
  describe 'pbcore -> rdf-xml' do
    inputs = Dir[File.dirname(__FILE__) + '/fixtures/*.rdf.xml'].reject{|path| path=~PENDING_RE}
    inputs.each do |rdf_xml_path|
      pbcore_path = rdf_xml_path.sub('.rdf.xml', '.pbcore.xml')
      it "converts #{File.basename(pbcore_path)} to #{File.basename(rdf_xml_path)}" do
        rdf_xml_actual = Converter.instance.convert(pbcore_path, false)
        rdf_xml_expected = Nokogiri::XML(File.read(rdf_xml_path), &:noblanks).to_xml
        # Remove indentation for the sake of the diff.
        expect(rdf_xml_actual.gsub('><', ">\n<").gsub(/^\s+/, '')).to eq rdf_xml_expected.gsub('><', ">\n<").gsub(/^\s+/, '')
      end
    end
  end
  
  describe 'rdf-xml -> turtle' do
    inputs = Dir[File.dirname(__FILE__) + '/fixtures/*.ttl'].reject{|path| path=~PENDING_RE}
    inputs.each do |turtle_path|
      rdf_xml_path = turtle_path.sub('.ttl', '.rdf.xml')
      it "converts #{File.basename(rdf_xml_path)} to #{File.basename(turtle_path)}" do
        turtle_actual = Turtler.instance.turtle(rdf_xml_path)
        turtle_expected = File.read(turtle_path)
        # Remove indentation for the sake of the diff.
        expect(turtle_actual.gsub(/^\s+/, '')).to eq turtle_expected.gsub(/^\s+/, '')
      end
    end
  end
  
end
