List<P> mapIndex<T, P>(List<T> list, P Function(T element, int index) callback) {
  List<P> response = new List(list.length);
  for (int i = 0; i < list.length; i++) {
    response[i] = callback(list[i], i);
  }
  return response;
}
