extension IterableA<T> on Iterable<T> {
  T? at(int position) {
    if (length - 1 < position) {
      return null;
    } else {
      if (position < 0) {
        if (position.abs() > length) {
          return null;
        } else {
          return elementAt(length + position);
        }
      } else {
        return elementAt(position);
      }
    }
  }
}
