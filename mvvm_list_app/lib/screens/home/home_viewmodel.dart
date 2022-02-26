import '../../models/number.dart';
import '../viewmodel.dart';

class HomeViewmodel extends Viewmodel {
  final _list = <Number>[Number(10), Number(20)];

  int get dataCount => _list.length;
  void addItem(Number item) => update(() async => _list.add(item));
  void deleteItem(int index) => update(() async => _list.removeAt(index));
  void editItem(int index, Number item) =>
      update(() async => _list[index] = item);
  Number getItem(int index) => _list[index];
}
