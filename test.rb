require 'equivalent-xml'
require 'byebug'
require 'nokogiri/diff'

fixture = File.open("fixtures/pbcorecollection.rdf").read
compare = File.open("rdf_xml/jp-collections_pbcore_rdf.xml").read
options = { :element_order => false, :normalize_whitespace => false }

ng_fixture = Nokogiri::XML(fixture)
ng_compare = Nokogiri::XML(compare)

#`diff #{fixture} #{compare}`

#puts EquivalentXml.equivalent?(ng_fixture, ng_compare, options)

ng_fixture.diff(ng_compare) do |change,node|
  puts "#{change} #{node.to_html}".ljust(30) + node.parent.path
end

