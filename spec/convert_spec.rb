require 'nokogiri'
require_relative '../lib/converter'

describe 'converter' do
  PENDING_RE = /\/pending/
  inputs = Dir[File.dirname(__FILE__) + '/fixtures/*.pbcore.xml'].reject{|path| path=~PENDING_RE}
  
  inputs.each do |pbcore_path|
    rdf_path = pbcore_path.sub('.pbcore.xml', '.rdf.xml')
    it "converts #{File.basename(pbcore_path)} to #{File.basename(rdf_path)}" do
      rdf_xml_actual = Converter.instance.convert(pbcore_path).to_xml
      rdf_xml_expected = Nokogiri::XML(File.read(rdf_path), &:noblanks).to_xml
      expect(rdf_xml_actual).to eq rdf_xml_expected
    end
  end
  
  it 'has no stray fixtures' do
    all = Dir[File.dirname(__FILE__) + '/fixtures/*'].reject{|path| path=~PENDING_RE}
    expect(all.count).to eq inputs.count * 2
  end
end
