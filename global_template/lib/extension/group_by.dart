/// Penggunaan testList.groupBy((group)=>group['yang_mau_digrup']);
/// Hasil {zeffry: [{id: 1, name: zeffry}, {id: 3, name: zeffry}], jonan: [{id: 2, name: jonan}]}
extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}

// class Testingdoang {
//   void groupby() {
//     var listMap = [
//       {
//         'id': '1',
//         'name': 'zeffry',
//       },
//       {
//         'id': '2',
//         'name': 'buyadu',
//       },
//       {
//         'id': '3',
//         'name': 'zeffry',
//       },
//       {
//         'id': '4',
//         'name': 'zulfikar',
//       },
//       {
//         'id': '5',
//         'name': 'quinatuione',
//       },
//     ];
//     // print(listMap.groupBy((group) => group['name']));
//   }
// }
