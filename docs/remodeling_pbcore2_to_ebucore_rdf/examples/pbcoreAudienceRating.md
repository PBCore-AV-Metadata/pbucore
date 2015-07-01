# Handling 'pbcoreAudienceLevel'

hasRating [Rating]

Example:

```xml
<pbcoreDescriptionDocument>
  <pbcoreAudienceRating source="TV Parental Guidelines" ref="http://www.tvguidelines.org/ratings.htm">TV-Y7-FV</pbcoreAudienceRating>
</pbcoreDescriptionDocument>
```


```xml
<rdf:Description about="http://example.com#12345">
  <rdf:type rdf:resource="ebucore:EditorialObject" />
  <ebucore:hasRating ebucore:AudienceRating="TV-Y7-FV" />
</rdf:Description>

```

**Note: this example begs the question of what to do with source and ref where the ref is not an individual URI, which afaik is yet unanswered.**
