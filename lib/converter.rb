require 'nokogiri'
require 'singleton'
require 'rdf/rdfxml'

class Converter
  include Singleton
  
  def initialize
    @xsd = Nokogiri::XML::Schema(Converter.read('pbcore-2.0.xsd'))
    @xslt = Nokogiri::XSLT(Converter.read('pbcore-2-ebucore.xsl'))
  end
  
  def self.read(path)
    File.read(File.expand_path(path, File.dirname(__FILE__)))
  end
  
  def validate(path)
    doc = Nokogiri::XML(File.read(path), &:noblanks)
    validation_errors = @xsd.validate(doc)
    fail(validation_errors.join("\n")) unless validation_errors.empty?
    doc
  end
  
  def convert(path, should_validate = true)
    validate(path) if should_validate
    doc = Nokogiri::XML(File.read(path), &:noblanks)
    rdf_xml_doc = @xslt.transform(doc)

    RDF::RDFXML::Reader.new(rdf_xml_doc, validate: true)
    # Create the object just for the sake of validation.
    # We could output it, but as xml it is very different from the xslt output:
    # nesting / order / prefixes / etc.
    # graph = RDF::RDFXML::Reader.new(rdf_xml_doc, validate: true)
    # RDF::RDFXML::Writer.buffer { |writer| writer << graph }

    rdf_xml_doc.to_xml
  end
end

if __FILE__ == $0
  fail('Expects exactly one argument') unless ARGV.count == 1
  puts Converter.instance.convert(ARGV.shift)
end