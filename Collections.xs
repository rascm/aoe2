int xsCollectionCreate() {
    int databases = xsArrayCreateInt(0);
    return (databases);
}

int xsCollectionGetSize(int collection = 0) {
    return(xsArrayGetSize(collection) / 2);
}

void xsCollectionClear(int collection = 0) {
    xsArrayResizeInt(collection, 0);
}

string xsCollectionGet(int collection = 0, string key = "") {
    string returnValue = "";
    int size = xsArrayGetSize(collection);
    key = strTrim(key);
    if(key == "" || size < 2)
        return (returnValue);

    for(i = 0; < size) {
        if((i % 2) == 1) {
            int getKey = xsArrayGetInt(collection, (i - 1));
            string getKeyName = xsArrayGetString(getKey, 0);
            if(getKeyName == key) {
                int getValue = xsArrayGetInt(collection, i);
                returnValue = xsArrayGetString(getValue, 0);
                break;
            }
        }
    }
    return (returnValue);
}

bool xsCollectionHas(int collection = 0, string key = "") {
    return (xsCollectionGet(collection, key) != "");
}

int xsCollectionDelete(int collection = 0, string key = "") {
    int size = xsArrayGetSize(collection);
    key = strTrim(key);
    if(key == "" || xsCollectionHas(collection, key) == false || size < 2)
        return (collection);

    int newCollection = xsArrayCreateInt(0);
    int total = 2;
    for(i = 0; < size) {
        if((i % 2) == 1) {
            int getKey = xsArrayGetInt(collection, (i - 1));
            string getKeyName = xsArrayGetString(getKey, 0);
            if(getKeyName != key) {
                int minusSize = total - 1;
                xsArrayResizeInt(newCollection, total);
                int getValue = xsArrayGetInt(collection, i);
                string getValueString = xsArrayGetString(getValue, 0);

                int setKey = xsArrayCreateString(1); xsArraySetString(setKey, 0, getKeyName);
                int setVal = xsArrayCreateString(1); xsArraySetString(setVal, 0, getValueString);
                xsArraySetInt(newCollection, minusSize - 1, setKey);
                xsArraySetInt(newCollection, minusSize, setVal);
                total = total + 2;
            }
        }  
    }

    // Refill old Database
    xsArrayResizeInt(collection, 0);
    for(r = 0; < xsArrayGetSize(newCollection)) {
        if((r % 2) == 1) {
            // Get data
            int getNewKey = xsArrayGetInt(newCollection, (r - 1));
            int getNewValue = xsArrayGetInt(newCollection, r);
            xsArrayResizeInt(collection, xsArrayGetSize(collection) + 2);
            xsArraySetInt(collection, r - 1, getNewKey);
            xsArraySetInt(collection, r, getNewValue);
        }
    }
    return(collection);
}

int xsCollectionSet(int collection = 0, string key = "", string value = "") {
    key = strTrim(key);
    if(key == "")
        return (collection);

    if(xsCollectionHas(collection, key)) {
        xsCollectionDelete(collection, key);
    }

    int size = xsArrayGetSize(collection);
    int plusSize = size + 2;
    xsArrayResizeInt(collection, plusSize);

    int setKey = xsArrayCreateString(1); xsArraySetString(setKey, 0, key);
    int setVal = xsArrayCreateString(1); xsArraySetString(setVal, 0, value);

    xsArraySetInt(collection, plusSize - 2, setKey);
    xsArraySetInt(collection, plusSize - 1, setVal);
    return (collection);
}

int xsCollectionGetAllKeys(int collection = 0) {
    int strArr = xsArrayCreateString(0);
    int size = xsArrayGetSize(collection);
    int current = 1;
    for(i = 0; < size) {
        if((i % 2) == 0) {
            int getItem = xsArrayGetInt(collection, i);
            string getText = xsArrayGetString(getItem, 0);
            xsArrayResizeString(strArr, current);
            xsArraySetString(strArr, current - 1, getText);
            current++;
        }

    }
    return(strArr);
}

int xsCollectionGetAllValues(int collection = 0) {
    int strArr = xsArrayCreateString(0);
    int size = xsArrayGetSize(collection);
    int current = 1;
    for(i = 0; < size) {
        if((i % 2) == 1) {
            int getItem = xsArrayGetInt(collection, i);
            string getText = xsArrayGetString(getItem, 0);
            xsArrayResizeString(strArr, current);
            xsArraySetString(strArr, current - 1, getText);
            current++;
        }

    }
    return(strArr);
}

string xsCollectionGetKey(int collection = -1, int index = 0) {
    int keys = xsCollectionGetAllKeys(collection);
    return(xsArrayGetString(keys, index));
}

string xsCollectionGetValue(int collection = -1, int index = 0) {
    int keys = xsCollectionGetAllValues(collection);
    return(xsArrayGetString(keys, index));
}
