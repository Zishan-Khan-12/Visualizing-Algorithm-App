import 'package:algo_app/provider/sort/sort_provider.dart';
import 'package:algo_app/models/sort_model.dart';
import 'package:algo_app/utils/wait.dart';

class QuickSortProvider extends SortProvider {
  @override
  void sort() {
    super.sort();
    _startSort(numbers);
  }

  Future _startSort(List<SortModel> list) async {
    await _helper(list, 0, list.length - 1);
    markNodesAsSorted(0, list.length - 1);
    setStateToSorted();
    render();
  }

  Future<List<SortModel>> _helper(
      List<SortModel> list, int start, int end) async {
    if (start >= end) {
      if (start == end) {
        markNodeAsSorted(start);
        render();
        await wait();
      }
      return list;
    }

    final pivot = start; // pivot pointer
    var leftP = start + 1; // left pointer
    var rightP = end; // right pointer

    while (rightP >= leftP) {
      markNodeAsPivot(pivot);
      markNodeForSorting(leftP);
      markNodeForSorting(rightP);
      render();
      await wait();
      if (list[leftP].value > list[pivot].value &&
          list[rightP].value < list[pivot].value) {
        final tmp = list[leftP];
        list[leftP] = list[rightP];
        list[rightP] = tmp;
        render();
        await wait();
      }
      if (list[leftP].value <= list[pivot].value) {
        markNodeAsNotSorted(leftP);
        leftP++;
      }
      if (list[rightP].value >= list[pivot].value) {
        markNodeAsNotSorted(rightP);
        rightP--;
      }
    }
    markNodeForSorting(rightP);
    render();
    await wait();
    final tmp = list[pivot];
    list[pivot] = list[rightP];
    list[rightP] = tmp;
    markNodeAsSorted(rightP);
    render();
    await wait();

    if (rightP - 1 - start < end - (rightP + 1)) {
      await _helper(list, start, rightP - 1);
      await _helper(list, rightP + 1, end);
    } else {
      await _helper(list, rightP + 1, end);
      await _helper(list, start, rightP - 1);
    }

    return list;
  }
}
