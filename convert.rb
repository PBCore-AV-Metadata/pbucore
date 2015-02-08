require 'nokogiri'
require 'byebug'

docs = Dir.glob("source_xml/*.xml")
xslt = Nokogiri::XSLT(File.read('pbcore-2-ebucore.xsl'))

docs.each do |xml_doc|
  doc = Nokogiri::XML(File.read(xml_doc))
  rdf_name = File.basename(xml_doc).split(/\./).first+("_rdf.xml")
  rdf_path = File.join("rdf_xml", rdf_name)
  f = File.open(rdf_path, "w")
  f.write(xslt.transform(doc))
  f.close
end
