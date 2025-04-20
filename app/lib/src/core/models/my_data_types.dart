// * These identifier are important concept and can have its own type.
typedef UserId = String;
typedef EntityId = String;
typedef CategoryId = int;
typedef SubCategoryId = int;
typedef CarouselAdId = String;

enum SortOrder { none, lowToHigh, highToLow }

enum GenderPreference { any, maleOnly, femaleOnly, familyFriendly }

extension IterableExtension<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
