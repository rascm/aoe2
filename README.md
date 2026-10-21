## Collections.xs
Extremely simple Javascript map-like function

Usage
```
// Create collection and add some items
int db = rsCollectionCreate();
    rsCollectionSet(db, "Romans", "Victim");
    rsCollectionSet(db, "Huns", "Barbar");
    rsCollectionSet(db, "Goths", "Barbar");
    rsCollectionSet(db, "Alans", "Barbar");
    rsCollectionSet(db, "Vandals", "Barbar");
    rsCollectionSet(db, "Suebians", "Barbar");
    rsCollectionSet(db, "Hungarians", "Nomad");
    rsCollectionSet(db, "Tatars", "Barbar");
// For loop: get key and value from current index
  for(k = 0; < rsCollectionGetSize(db)) {
      string key = rsCollectionGetKey(db, k);
      string val = rsCollectionGetValue(db, k);
      xsChatData(key + " are " + val + " yet!");
  }

// Conditional check
  string getGoth = rsCollectionGet(db, "Goths");
  if(getGoth == "Barbar") {
      // Goths are Barbar yet!
      rsCollectionSet(db, "Goths", "Defender");
  }
// Goths are not Barbar anymore
rsCollectionDelete(db, "Tatars");

if(rsCollectionHas(db, "Tatars")) {
  // Not executed because tatars are removed!
}

```
