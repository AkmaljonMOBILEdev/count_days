List<int> dateConverter(String date){
  return date.split(".").map(int.parse).toList();

}