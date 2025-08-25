Expected: 'foodC'
  Actual: '6'
   Which: is different.
          Expected: foodC
            Actual: 6
                    ^
           Differ at offset 0

package:matcher                                                        expect
package:flutter_test/src/widget_tester.dart 474:18                     expect
test\src\features\home\data\fake\fake_food_repository_test.dart 137:7  main.<fn>.<fn>


from this test: fetchFoodsList sorts by updatedAt descending by default