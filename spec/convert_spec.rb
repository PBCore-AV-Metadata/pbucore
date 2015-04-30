require 'nokogiri'
require_relative '../lib/converter'

describe 'converter' do
  inputs = Dir[File.dirname(__FILE__) + '/fixtures/*.pbcore.xml']
  inputs.each do |pbcore_path|
    rdf_path = pbcore_path.sub('.pbcore.xml', '.rdf.xml')
    it "converts #{File.basename(pbcore_path)} to #{File.basename(rdf_path)}" do
      rdf_xml_actual = Converter.instance.convert(pbcore_path).to_s
      rdf_xml_expected = File.read(rdf_path)
      expect(rdf_xml_actual).to eq rdf_xml_expected
    end
  end
  
  it 'has no stray fixtures' do
    all = Dir[File.dirname(__FILE__) + '/fixtures/*']
    expect(all.count).to eq inputs.count * 2
  end
end
