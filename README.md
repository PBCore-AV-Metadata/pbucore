# PBCore -> RDF

The goal is to create XSLT that can transform PBCore into RDF which uses existing
EBUCore predicates as appropriate, and coins new PBCore terms as necessary.

## Basic use

```
git clone https://github.com/WGBH/pbucore
cd pbucore
gem install bundler
bundle install
ruby lib/converter.rb ~/my-pbcore.xml > ~/my-rdf.xml
```

## Developer workflow

(This is for members of WGBH/MLA Github team. If you are not a member of that 
group, then you can still submit issues and make comments, but you won't be 
able to push branches. You do not have to be an employee of WGBH to be a member 
of the WGBH/MLA Github team. If you would like to become a member, contact an 
existing member.)

(If you are not comfortable with command-line git, we have 
[advice](https://github.com/WGBH/pbucore/wiki/Contributing-to-the-project-through-Github-web-interface)
for using github's web interface.)

1. Identify the PBCore element of interest, e.g. `<pbcoreAudienceLevel>`.
1. Create a GitHub issue, name it appropriately, e.g. "Mapping pbcoreAudienceLevel".
1. Create a branch for the issue, with a brief descriptive name, e.g. `mapping-pbcoreAudienceLevel`.
1. Use the comments on the issue to work out a solution. 
Notify specific users by "mentioning" them with `@` symbol.
1. Make the necessary changes in your local branch:
  - Create a PBCore fragment under `spec/fixtures` for just the element of interest.
  (Including `fragment` in the name bypasses schema validation during tests;
  Prefixing with `pending` will skip tests entirely for that file.)
  - Tweak the XSLT under `lib/includes`.
  - Generate an RDF-XML fixture: 
  `ruby lib/converter.rb spec/fixtures/pbcoreAudienceLevel.pbcore.xml > spec/fixtures/pbcoreAudienceLevel.rdf.xml`
  - And to make sure the XML is actually valid RDF, generate a Turtle fixture:
  `ruby lib/turtler.rb spec/fixtures/pbcoreAudienceLevel.rdf.xml > spec/fixtures/pbcoreAudienceLevel.ttl`
  - If everything looks good, update the `kitchen-sink` fixtures in the same way.
  - Run tests, and update `kitchen_sink_spec.rb` to reflect improved coverage.
1. Push your branch to Github.
1. Submit a pull request for your branch. Good job!
