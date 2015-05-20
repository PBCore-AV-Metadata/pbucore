require 'singleton'

require 'sparql'
require 'linkeddata'

class Pbcorer
  include Singleton
  
  def pbcore(path)
    output = '' # TODO: Need to find a better way to do this.
    repo = RDF::Repository.load(path)
    repo.query(SPARQL.parse(<<-EOF
      PREFIX ebucore: <http://www.ebu.ch/metadata/ontologies/ebucore/ebucore#>

      SELECT * WHERE {
        ?media_resource a ebucore:MediaResource;
           ebucore:bitRate ?bit_rate .
      }
    EOF
      )) do |result|
      builder = Nokogiri::XML::Builder.new do |xml|
        xml.pbcoreInstantiation(xmlns: 'http://www.pbcore.org/PBCore/PBCoreNamespace.html') {
          xml.instantiationDataRate(result.bit_rate.to_s)
          xml.comment(' TODO: @unitsOfMeasure ')
        }
      end
      output << builder.to_xml
      # Among other things, this breaks if more than one match.
    end
    output
  end
end

if __FILE__ == $0
  fail('Expects exactly one argument') unless ARGV.count == 1
  puts Pbcorer.instance.pbcore(ARGV.shift)
end