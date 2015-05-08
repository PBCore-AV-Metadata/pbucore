require 'nokogiri'

xslt = Nokogiri::XSLT(File.read('lib/kitchen-sink.xsl'))
doc = Nokogiri::XML(File.read('lib/pbcore-2.0.xsd'), &:noblanks)
puts xslt.transform(doc).to_xml