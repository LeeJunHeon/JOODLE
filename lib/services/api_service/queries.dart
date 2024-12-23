class Queries {
  static const String getCheckboxButton = '''query MyQuery {
  listCheckboxModels(filter: {id: {eq: ""}}) {
    items {
      name
      options
      prices
      isSelected
    }
  }
}


  ''';


}
