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
class DataStore{
   static final List<String> _selectedThings=[];
   static void setMapValue(String keyName){
      _selectedThings.add(keyName);
   }
   static List<String> getArray(){
     return _selectedThings;
   }
   static int getPrice(String objectName){
    try{
      final correspondingPrice=Constants.fruitsMap.containsKey(objectName)?Constants.fruitsMap[objectName]:
      Constants.vegetablesMap.containsKey(objectName)?Constants.vegetablesMap[objectName]:'Error';
      return int.parse(correspondingPrice.toString());
    }
    catch(e){
      throw Error();
    }
   }
}