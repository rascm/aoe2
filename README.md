## Collections.xs
Extremely simple Javascript map-like function

Usage
```
// Create collection and add some items
int db = xsCollectionCreate();
    xsCollectionSet(db, "Romans", "Victim");
    xsCollectionSet(db, "Huns", "Barbar");
    xsCollectionSet(db, "Goths", "Barbar");
    xsCollectionSet(db, "Alans", "Barbar");
    xsCollectionSet(db, "Vandals", "Barbar");
    xsCollectionSet(db, "Suebians", "Barbar");
    xsCollectionSet(db, "Hungarians", "Nomad");
    xsCollectionSet(db, "Tatars", "Barbar");
// For loop: get key and value from current index
  for(k = 0; < xsCollectionGetSize(db)) {
      string key = xsCollectionGetKey(db, k);
      string val = xsCollectionGetValue(db, k);
      xsChatData(key + " are " + val + " yet!");
  }

// Conditional check
  string getGoth = xsCollectionGet(db, "Goths");
  if(getGoth == "Barbar") {
      // Goths are Barbar yet!
      xsCollectionSet(db, "Goths", "Defender");
  }
// Goths are not Barbar anymore
xsCollectionDelete(db, "Tatars");

if(xsCollectionHas(db, "Tatars")) {
  // Not executed because tatars are removed!
}

```
