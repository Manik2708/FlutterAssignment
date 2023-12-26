class Constants{
  static const Map<String, int> fruitsMap={
    'Mango':73,
    'Orange':40,
    'Banana':43,
    'Papaya':95,
    'Apple':89,
    'PineApple':53,
    'Grapes':97,
    'Avocado': 83
  };
  static const Map<String, int> vegetablesMap={
    'Tomato':25,
    'Potato':40,
    'Capsicum':41,
    'Carrot':50,
    'Onion':62,
    'Brinjal':53,
    'Green Peas':71,
    'Cabbage':37
  };
}
// DataStore is a utility class responsible for managing selected things, retrieving an array of selected things,
// and getting the price of a specific object.
class DataStore {
  // List to store selected things
  static final List<String> _selectedThings = [];

  // Method to add a keyName to the list of selected things
  static void setMapValue(String keyName) {
    _selectedThings.add(keyName);
  }

  // Method to retrieve the array of selected things
  static List<String> getArray() {
    return _selectedThings;
  }

  // Method to get the price of a specific object
  static int getPrice(String objectName) {
    try {
      // Retrieve the corresponding price based on the objectName from the Constants maps
      final correspondingPrice = Constants.fruitsMap.containsKey(objectName)
          ? Constants.fruitsMap[objectName]
          : Constants.vegetablesMap.containsKey(objectName)
          ? Constants.vegetablesMap[objectName]
          : 'Error';

      // Parse the price to an integer and return it
      return int.parse(correspondingPrice.toString());
    } catch (e) {
      // Throw an error if there is an issue with parsing or if the objectName is not found
      throw Error();
    }
  }
}