int bedCorrect(dynamic bedtime) {
  switch (bedtime) {
    case (10):
      return 15;
    case (15):
      return 20;
    case (20):
      return 30;
    case (30):
      return 0;
    case (0):
      return 5;
    case (5):
      return 10;
  }
  return 10;
}

int sleepCorrect(dynamic sleeptime) {
  switch (sleeptime) {
    case (8):
      return 9;
    case (9):
      return 7;
    case (7):
      return 8; // 9
  }
  return 8;
}
