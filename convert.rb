require 'nokogiri'
require 'byebug'
require 'logger'

@logger = Logger.new(STDOUT)
@logger.level = Logger::WARN

def validate doc, name
  xsd = Nokogiri::XML::Schema(open("pbcore-2.0.xsd"))
  result = xsd.validate(doc)
  @logger.warn "#{name} is invalid:\n\n#{result.join("\n\n")}" unless result.empty?
end

docs = Dir.glob("source_xml/*.xml")
xslt = Nokogiri::XSLT(File.read('pbcore-2-ebucore.xsl'))

docs.each do |xml_doc|
  doc = Nokogiri::XML(File.read(xml_doc))
  rdf_name = File.basename(xml_doc).split(/\./).first+("_rdf.xml")
  rdf_path = File.join("rdf_xml", rdf_name)
  validate(doc, xml_doc)
  f = File.open(rdf_path, "w")
  f.write(xslt.transform(doc))
  f.close
end
