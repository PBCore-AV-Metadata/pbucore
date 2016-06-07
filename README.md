[![Build Status](https://travis-ci.org/WGBH/pbucore.svg?branch=master)](https://travis-ci.org/WGBH/pbucore)

### Assignments
1. cpb-aacip-15-79v15vkq_pbcore.xml - Drew
1. cpb-aacip-500-6m335r61_pbcore.xml -- Adam
1. cpb-aacip-500-6h4csj1p_pbcore.xml -- Julie


### Helpful Hints
1. Jean-pierre's original stylesheet expects `<pbcoreCollection>` as the root 
element, so make sure your xml file has that going on.

### Converting
There is a provided ruby script to convert individual XML files. To do this, 
you'll need ruby as well as the bunder gem. With the `ruby`, `gem` and `git` 
executables installed:

```
git clone https://github.com/WGBH/pbucore
cd pbucore
gem install bundler
bundle install
ruby lib/converter.rb ~/my-pbcore.xml > ~/my-rdf.xml
```

### Workflow for mapping PBCore elements to EBUCore RDF-XML.
_This is for members of WGBH/MLA Github team. If you are not a member of that 
group, then you can still submit issues and make comments, but you won't be 
able to push branches. You do not have to be an employee of WGBH to be a member 
of the WGBH/MLA Github team. If you would like to become a member, contact an 
existing member._

UPDATE: There is now [a detailed document in the wiki for contributing to this 
project through the Github web interface](https://github.com/WGBH/pbucore/wiki/Contributing-to-the-project-through-Github-web-interface).
Please refer to that if you do not plan to use `git` from the command line. 
Otherwise, the steps below are still applicable.

1. Identify a pbcore node you intend to work on. E.g. `<pbcoreAudienceLevel>`.
1. Create a GitHub issue, name it appropriately. E.g. "Figure out mapping of 
pbcoreAudienceLevel".
1. Create a branch for the issue, preferably named in a way that briefly states 
intention. E.g. `handle-pbcoreAudienceLevel-nodes`.
1. Use the comments to work out a solution with other collaborators as needed. 
Notify specific users by "mentioning" them with `@` symbol.
1. Make your proposed changes. Changes should typically included:
  1. Changes to the stylesheet, `pbcore-2-ebucore.xsl`
  1. A sample PBCore xml file for testing the translation. The file should 
follow the convention:
    * "pbcoreAudienceLevel.pbcore.xml", if the node you are addressing is 
`<pbcoreAudienceLevel>`.
    * it should live in the `spec/fixtures` directory.
  1. The sample output in EBUCore RDF-XML that resulted from running the 
translation. The file should follow the convention:
    * "pbcoreAudienceLevel.rdf.xml"
    * it should also live in `spec/fixtures`.
1. Push your branch to Github.
1. Submit a pull request for your branch. Good job!
