import 'dart:io';

import '../xzero/constants.dart';

void main(List<String> args) {
  game();
}

// ââ­ï¸ð©

Constants constants = Constants();

Future game() async {
  constants.defaultView();
  bool navbat = true;
  List<String> history = [];
  final List<String> available = ["11","12","13","21","22","23","31","32","33"];
  for (int i = 0; i < 9; i++) {
    if (navbat) {
      print("â indexni kiriting : ");
      String son = stdin.readLineSync()!;
      if (!available.contains(son)) {
        print("Bunday o'rin yo'q");
        i--;
        continue;
      } else if (history.contains(son)) {
        print("Bu o'rin band");
        i--;
        continue;
      }
      history.add(son);
      List<int> orinList =
          son.split("").map((e) => int.parse(e) - 1).toList();
      constants.gameList[orinList[0]][orinList[1]] = "â";
      if (constants.checking()) {
        constants.gameView();
        print("â o'yinchi g'olib bo'ldið¥³ð¥³ð¥³");
        break;
      }
      navbat = false;
    } else {
      print("â­ï¸ indexni kiriting : ");
      String son = stdin.readLineSync()!;
      if (!available.contains(son)) {
        print("Bunday o'rin yo'q");
        i--;
        continue;
      } else if (history.contains(son)) {
        print("Bu o'rin band");
        i--;
        continue;
      }
      history.add(son);
      List<int> orinList =
          son.toString().split("").map((e) => int.parse(e) - 1).toList();
      constants.gameList[orinList[0]][orinList[1]] = "â­ï¸";
      if (constants.checking()) {
        constants.gameView();
        print("â­ï¸ o'yinchi g'olib bo'ldið¥³ð¥³ð¥³");
        break;
      }
      navbat = true;
    }
    constants.gameView();
    if (i == 8) {
      print("Durrang bo'ldiððð");
    }
  }
}
