require 'singleton'

require 'rubygems'
require 'sparql'
require 'linkeddata'

class Pbcorer
  include Singleton
  
  def pbcore(path)
    repo = RDF::Repository.load(path)
    repo.query(SPARQL.parse(<<-EOF
      PREFIX ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#>

      SELECT * WHERE { 
        ?doc a ebucore:EditorialObject ;
             ebucore:identifier ?id .
      }
    EOF
      )) do |result|
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.pbcoreDescriptionDocument(xmlns: 'http://www.pbcore.org/PBCore/PBCoreNamespace.html') {
          xml.pbcoreIdentifier(result.id.to_s)
        }
      end
      puts builder.to_xml
    end
  end
end

if __FILE__ == $0
  fail('Expects exactly one argument') unless ARGV.count == 1
  puts Pbcorer.instance.pbcore(ARGV.shift)
end