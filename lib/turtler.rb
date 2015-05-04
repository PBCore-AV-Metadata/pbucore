require 'nokogiri'
require 'rdf/rdfxml'
require 'rdf/turtle'
require 'singleton'

class Turtler
  include Singleton
  
  def turtle(path)
    rdf_xml_doc = Nokogiri::XML(File.read(path), &:noblanks)
    graph = RDF::RDFXML::Reader.new(rdf_xml_doc, validate: true)
    RDF::Turtle::Writer.buffer(prefixes: {
        rdf: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
        rdfs: 'http://www.w3.org/2000/01/rdf-schema#',
        ebucore: 'http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#',
        pbcore: 'http://www.pbcore.org/PBCore/PBCoreNamespace.html',
        pbcorerdf: 'http://www.pbcore.org/pbcore/pbcore#',
        skos: 'http://www.w3.org/2004/02/skos/core#',
        prov: 'http://www.w3.org/ns/prov#',
        foaf: 'xmlns.com/foaf/0.1/'
      }) { |writer| writer << graph }
  end
end

if __FILE__ == $0
  fail('Expects exactly one argument') unless ARGV.count == 1
  puts Turtler.instance.turtle(ARGV.shift)
end