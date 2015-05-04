require 'nokogiri'
require 'singleton'

class Converter
  include Singleton
  
  def initialize
    @xsd = Nokogiri::XML::Schema(Converter.read('pbcore-2.0.xsd'))
    @xslt = Nokogiri::XSLT(Converter.read('pbcore-2-ebucore.xsl'))
  end
  
  def self.read(path)
    File.read(File.expand_path(path, File.dirname(__FILE__)))
  end
  
  def convert(path)
    doc = Nokogiri::XML(File.read(path))
    validation_errors = @xsd.validate(doc)
    fail(validation_errors.join("\n")) unless validation_errors.empty?
    @xslt.transform(doc)
  end
end

if __FILE__ == $0
  fail('Expects exactly one argument') unless ARGV.count == 1
  puts Converter.instance.convert(ARGV.shift)
end