### Assignments
1. cpb-aacip-15-79v15vkq_pbcore.xml - Drew
1. cpb-aacip-500-6m335r61_pbcore.xml -- Adam
1. cpb-aacip-500-6h4csj1p_pbcore.xml -- Julie


### Helpful Hints
1. Jean-pierre's original stylesheet expects `<pbcoreCollection>` as the root element, so make sure your xml file has that going on.

### Converting
There is a provided ruby script to batch-convert all the xml files under `source_xml` to RDF xml in the `rdf_xml`
directory. To do this, you'll need ruby as well as the bunder gem. With the `ruby`, `gem` and `git` executables installed:

    git clone https://github.com/WGBH/pbucore
    cd pbucore
    gem install bundler
    bundle install
    ruby convert.rb
