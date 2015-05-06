require_relative('converter')
require_relative('turtler')

if __FILE__ == $0
  fail('Expects exactly one argument') unless ARGV.count == 1
  pbcore_xml_path = ARGV.shift
  
  RE = /\.pbcore\.xml$/
  fail('Expects .pbcore.xml') unless pbcore_xml_path =~ RE
  
  rdf_xml_path = pbcore_xml_path.gsub(RE, '.rdf.xml')
  fail("#{rdf_xml_path} already exists") if File.exists?(rdf_xml_path)
  File.write(rdf_xml_path, Converter.instance.convert(pbcore_xml_path))
  
  ttl_path = pbcore_xml_path.gsub(RE, '.ttl')
  fail("#{ttl_path} already exists") if File.exists?(ttl_path)
  File.write(ttl_path, Turtler.instance.turtle(rdf_xml_path))
  
end