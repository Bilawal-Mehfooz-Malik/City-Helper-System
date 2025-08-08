PS D:\Flutter Apps\City Helper System> cd app; flutter analyze
Analyzing app...

   info - Unnecessary use of multiple underscores - lib\src\core\common_widgets\custom_image.dart:177:24 - unnecessary_underscores
  error - The getter 'openingHours' isn't defined for the type 'EntityDetail' - lib\src\core\common_widgets\opening_hours_widget.dart:25:33 -      
         undefined_getter
  error - The method 'isEntityOpen' isn't defined for the type 'EntityDetail' - lib\src\core\common_widgets\opening_hours_widget.dart:26:34 -      
         undefined_method
warning - The type of h can't be inferred; a type must be explicitly provided - lib\src\core\common_widgets\opening_hours_widget.dart:29:8 -       
       inference_failure_on_untyped_parameter
warning - The type of hour can't be inferred; a type must be explicitly provided - lib\src\core\common_widgets\opening_hours_widget.dart:54:34 -   
       inference_failure_on_untyped_parameter
  error - The argument type 'dynamic' can't be assigned to the parameter type 'OpeningHours'.  -
         lib\src\core\common_widgets\opening_hours_widget.dart:58:41 - argument_type_not_assignable
  error - The argument type 'dynamic' can't be assigned to the parameter type 'bool'.  -
         lib\src\core\common_widgets\opening_hours_widget.dart:58:56 - argument_type_not_assignable
  error - Target of URI doesn't exist: 'package:app/src/features/home/domain/categories/food.dart' - lib\src\core\constants\test_food_list.dart:3:8         - uri_does_not_exist
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\core\constants\test_food_list.dart:6:12 -
         non_type_as_type_argument
  error - The function 'Food' isn't defined - lib\src\core\constants\test_food_list.dart:7:3 - undefined_function
  error - The function 'Food' isn't defined - lib\src\core\constants\test_food_list.dart:26:3 - undefined_function
  error - The function 'Food' isn't defined - lib\src\core\constants\test_food_list.dart:45:3 - undefined_function
  error - The function 'Food' isn't defined - lib\src\core\constants\test_food_list.dart:64:3 - undefined_function
  error - The function 'Food' isn't defined - lib\src\core\constants\test_food_list.dart:83:3 - undefined_function
  error - The function 'Food' isn't defined - lib\src\core\constants\test_food_list.dart:102:3 - undefined_function
  error - The function 'Food' isn't defined - lib\src\core\constants\test_food_list.dart:121:3 - undefined_function
  error - The function 'Food' isn't defined - lib\src\core\constants\test_food_list.dart:140:3 - undefined_function
  error - Target of URI doesn't exist: 'package:app/src/features/home/domain/categories/residence.dart' -
         lib\src\core\constants\test_residences.dart:2:8 - uri_does_not_exist
  error - The name 'Residence' isn't a type, so it can't be used as a type argument - lib\src\core\constants\test_residences.dart:6:12 -
         non_type_as_type_argument
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:7:3 - undefined_function
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:28:3 - undefined_function
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:49:3 - undefined_function
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:70:3 - undefined_function
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:91:3 - undefined_function
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:112:3 - undefined_function
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:133:3 - undefined_function
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:154:3 - undefined_function
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:175:3 - undefined_function
  error - The function 'Residence' isn't defined - lib\src\core\constants\test_residences.dart:196:3 - undefined_function
  error - Target of URI doesn't exist: 'package:app/src/features/home/domain/categories/food.dart' -
         lib\src\features\home\data\fake\fake_food_repository.dart:6:8 - uri_does_not_exist
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:13:37 - 
         non_type_as_type_argument
  error - Undefined class 'Food' - lib\src\features\home\data\fake\fake_food_repository.dart:16:24 - undefined_class
  error - The property 'id' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:18:44 - unchecked_use_of_nullable_value
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:28:15 - 
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:34:15 - 
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:40:15 - 
         non_type_as_type_argument
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:43:39 - unchecked_use_of_nullable_value
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:48:15 - 
         non_type_as_type_argument
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:50:40 - unchecked_use_of_nullable_value
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:54:15 -
         non_type_as_type_argument
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:59:39 - unchecked_use_of_nullable_value
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:64:15 - 
         non_type_as_type_argument
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:68:40 - unchecked_use_of_nullable_value
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:72:15 - 
         non_type_as_type_argument
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:78:27 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:78:63 - unchecked_use_of_nullable_value
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:84:15 - 
         non_type_as_type_argument
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:89:25 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:89:61 - unchecked_use_of_nullable_value
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:94:10 - 
         non_type_as_type_argument
  error - The property 'id' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:98:42 - unchecked_use_of_nullable_value
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\fake\fake_food_repository.dart:106:10 -         non_type_as_type_argument
  error - The property 'id' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_food_repository.dart:109:47 - unchecked_use_of_nullable_value
  error - Target of URI doesn't exist: 'package:app/src/features/home/domain/categories/residence.dart' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:8:8 - uri_does_not_exist
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:16:42 - non_type_as_type_argument
  error - Undefined class 'Residence' - lib\src\features\home\data\fake\fake_residence_repository.dart:19:29 - undefined_class
  error - The property 'id' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:21:44 - unchecked_use_of_nullable_value
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:31:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:37:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:43:15 - non_type_as_type_argument
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:46:49 - unchecked_use_of_nullable_value
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:51:15 - non_type_as_type_argument
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:53:45 - unchecked_use_of_nullable_value
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:57:15 - non_type_as_type_argument
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:63:37 - unchecked_use_of_nullable_value
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:68:15 - non_type_as_type_argument
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:73:25 - unchecked_use_of_nullable_value
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:78:15 - non_type_as_type_argument
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:84:27 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:84:63 - unchecked_use_of_nullable_value
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:90:15 - non_type_as_type_argument
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:95:25 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:95:61 - unchecked_use_of_nullable_value
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:100:10 - non_type_as_type_argument
  error - The property 'id' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:103:52 - unchecked_use_of_nullable_value
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\fake\fake_residence_repository.dart:110:10 - non_type_as_type_argument
  error - The property 'id' can't be unconditionally accessed because the receiver can be 'null' -
         lib\src\features\home\data\fake\fake_residence_repository.dart:114:47 - unchecked_use_of_nullable_value
  error - Target of URI doesn't exist: 'package:app/src/features/home/domain/categories/food.dart' -
         lib\src\features\home\data\real\food_repository.dart:2:8 - uri_does_not_exist
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:17:23 -      
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:19:22 -      
         non_type_as_type_argument
  error - Undefined name 'Food' - lib\src\features\home\data\real\food_repository.dart:21:13 - undefined_identifier
  error - The method 'toJson' can't be unconditionally invoked because the receiver can be 'null' -
         lib\src\features\home\data\real\food_repository.dart:22:40 - unchecked_use_of_nullable_value
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:27:9 -
         non_type_as_type_argument
  error - Undefined class 'Food' - lib\src\features\home\data\real\food_repository.dart:31:24 - undefined_class
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:36:15 -      
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:44:15 -      
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:51:15 -      
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:59:15 -      
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:67:15 -      
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:75:15 -      
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:82:15 -      
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:90:15 -      
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:101:10 -     
         non_type_as_type_argument
  error - The name 'Food' isn't a type, so it can't be used as a type argument - lib\src\features\home\data\real\food_repository.dart:108:10 -     
         non_type_as_type_argument
  error - Target of URI doesn't exist: 'package:app/src/features/home/domain/categories/residence.dart' -
         lib\src\features\home\data\real\residence_repository.dart:2:8 - uri_does_not_exist
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:18:23 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:20:22 - non_type_as_type_argument
  error - Undefined name 'Residence' - lib\src\features\home\data\real\residence_repository.dart:22:13 - undefined_identifier
  error - The method 'toJson' can't be unconditionally invoked because the receiver can be 'null' -
         lib\src\features\home\data\real\residence_repository.dart:23:50 - unchecked_use_of_nullable_value
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:29:9 - non_type_as_type_argument
  error - Undefined class 'Residence' - lib\src\features\home\data\real\residence_repository.dart:36:29 - undefined_class
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:41:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:49:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:56:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:65:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:74:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:84:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:94:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:104:15 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:115:10 - non_type_as_type_argument
  error - The name 'Residence' isn't a type, so it can't be used as a type argument -
         lib\src\features\home\data\real\residence_repository.dart:124:10 - non_type_as_type_argument
   info - Unnecessary use of multiple underscores - lib\src\features\home\presentation\carousel_ads_list.dart:25:18 - unnecessary_underscores      
   info - Unnecessary use of multiple underscores - lib\src\features\home\presentation\carousel_ads_list.dart:45:39 - unnecessary_underscores      
   info - Unnecessary use of multiple underscores - lib\src\features\home\presentation\entities_list_section.dart:85:22 - unnecessary_underscores  
   info - Unnecessary use of multiple underscores - lib\src\features\home\presentation\home_skeletons.dart:105:24 - unnecessary_underscores        
  error - Target of URI doesn't exist: 'package:app/src/features/home/domain/categories/residence.dart' -
         lib\src\features\home\presentation\widgets\entity_card.dart:6:8 - uri_does_not_exist
  error - The element type 'Object?' can't be assigned to the list type 'Widget' -
         lib\src\features\home\presentation\widgets\entity_card.dart:75:17 - list_element_type_not_assignable
  error - The argument type 'Consumer Function(EntityId)' can't be assigned to the parameter type 'Object? Function(EntityId, CategoryId,
         SubCategoryId, String, String, String, String, LatLng, double, int, bool, List<OpeningHours>, EntityStatus, Status, DateTime, EntityType, 
         double, bool, GenderPreference)?'.  - lib\src\features\home\presentation\widgets\entity_card.dart:76:30 - argument_type_not_assignable    
  error - The getter 'price' isn't defined for the type 'EntityId' - lib\src\features\home\presentation\widgets\entity_card.dart:80:45 -
         undefined_getter
  error - The getter 'id' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\data\fake\fake_food_details_repository.dart:20:47 
         - undefined_getter
  error - The getter 'id' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\data\fake\fake_food_details_repository.dart:20:61 
         - undefined_getter
  error - The getter 'id' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\data\fake\fake_food_details_repository.dart:33:50
         - undefined_getter
  error - The getter 'id' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\data\fake\fake_food_details_repository.dart:40:56 
         - undefined_getter
  error - The getter 'id' isn't defined for the type 'ResidenceDetail' -
         lib\src\features\home_detail\data\fake\fake_residence_details_repository.dart:22:47 - undefined_getter
  error - The getter 'id' isn't defined for the type 'ResidenceDetail' -
         lib\src\features\home_detail\data\fake\fake_residence_details_repository.dart:22:61 - undefined_getter
  error - The getter 'id' isn't defined for the type 'ResidenceDetail' -
         lib\src\features\home_detail\data\fake\fake_residence_details_repository.dart:35:65 - undefined_getter
  error - The getter 'id' isn't defined for the type 'ResidenceDetail' -
         lib\src\features\home_detail\data\fake\fake_residence_details_repository.dart:43:64 - undefined_getter
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\home_detail\data\fake\test_food_details.dart:27:23 -
       inference_failure_on_collection_literal
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\home_detail\data\fake\test_food_details.dart:54:23 -
       inference_failure_on_collection_literal
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\home_detail\data\fake\test_food_details.dart:81:23 -
       inference_failure_on_collection_literal
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\home_detail\data\fake\test_food_details.dart:108:23 -
       inference_failure_on_collection_literal
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\home_detail\data\fake\test_food_details.dart:135:23 -
       inference_failure_on_collection_literal
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\home_detail\data\fake\test_food_details.dart:162:23 -
       inference_failure_on_collection_literal
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\home_detail\data\fake\test_food_details.dart:189:23 -
       inference_failure_on_collection_literal
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\home_detail\data\fake\test_food_details.dart:216:23 -
       inference_failure_on_collection_literal
  error - The getter 'id' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\data\food_details_repository.dart:21:27 -
         undefined_getter
  error - The getter 'id' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\data\residence_details_repository.dart:26:27 
         - undefined_getter
  error - Missing concrete implementations of 'getter mixin _$EntityDetail on Object.description', 'getter mixin _$EntityDetail on Object.email',  
         'getter mixin _$EntityDetail on Object.facebookUrl', 'getter mixin _$EntityDetail on Object.galleryImageUrls', and 8 more -
         lib\src\features\home_detail\domain\food_detail.dart:8:7 - non_abstract_class_inherits_abstract_member
  error - The class 'EntityDetail' can't be extended, implemented, or mixed in outside of its library because it's a sealed class -
         lib\src\features\home_detail\domain\food_detail.dart:8:26 - invalid_use_of_type_outside_library
  error - The class 'EntityDetail' doesn't have an unnamed constructor - lib\src\features\home_detail\domain\food_detail.dart:11:3 -
         undefined_constructor_in_initializer
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:12:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:13:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:14:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:15:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:16:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:17:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:18:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:19:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:20:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:21:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:22:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:23:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:24:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:25:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:26:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:27:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:28:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:29:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:30:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:31:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:32:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:33:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:34:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:35:11 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:36:11 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:37:11 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:38:11 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\food_detail.dart:39:20 -
         super_formal_parameter_without_associated_named
  error - Class 'FoodDetail' can't define method 'copyWith' and have field '_$EntityDetail.copyWith' with the same name -
         lib\src\features\home_detail\domain\food_detail.dart:44:14 - conflicting_method_and_field
  error - The getter 'id' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:76:22 - undefined_getter  
  error - The getter 'categoryId' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:77:38 -
         undefined_getter
  error - The getter 'subCategoryId' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:78:44 -        
         undefined_getter
  error - The getter 'coverImageUrl' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:79:44 -        
         undefined_getter
  error - The getter 'name' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:80:26 - undefined_getter  error - The getter 'cityName' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:81:34 -
         undefined_getter
  error - The getter 'sectorName' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:82:38 -
         undefined_getter
  error - The getter 'latLng' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:83:30 -
         undefined_getter
  error - The getter 'avgRating' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:84:36 -
         undefined_getter
  error - The getter 'totalReviews' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:85:42 -
         undefined_getter
  error - The getter 'isPopular' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:87:36 -
         undefined_getter
  error - The getter 'openingHours' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:88:42 -
         undefined_getter
  error - The getter 'entityStatus' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:89:42 -
         undefined_getter
  error - The getter 'status' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:90:30 -
         undefined_getter
  error - The getter 'createdAt' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:91:36 -
         undefined_getter
  error - The getter 'type' isn't defined for the type 'FoodDetail' - lib\src\features\home_detail\domain\food_detail.dart:104:26 -
         undefined_getter
  error - The method 'toJson' is always abstract in the supertype - lib\src\features\home_detail\domain\food_detail.dart:110:14 -
         abstract_super_member_reference
  error - Missing concrete implementations of 'getter mixin _$EntityDetail on Object.description', 'getter mixin _$EntityDetail on Object.email',  
         'getter mixin _$EntityDetail on Object.facebookUrl', 'getter mixin _$EntityDetail on Object.galleryImageUrls', and 8 more -
         lib\src\features\home_detail\domain\residence_detail.dart:8:7 - non_abstract_class_inherits_abstract_member
  error - The class 'EntityDetail' can't be extended, implemented, or mixed in outside of its library because it's a sealed class -
         lib\src\features\home_detail\domain\residence_detail.dart:8:31 - invalid_use_of_type_outside_library
  error - The class 'EntityDetail' doesn't have an unnamed constructor - lib\src\features\home_detail\domain\residence_detail.dart:13:3 -
         undefined_constructor_in_initializer
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:14:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:15:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:16:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:17:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:18:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:19:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:20:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:21:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:22:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:23:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:24:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:25:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:26:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:27:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:28:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:29:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:30:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:31:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:32:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:33:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:34:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:35:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:36:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:37:20 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:38:11 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:39:11 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:40:11 -
         super_formal_parameter_without_associated_named
  error - No associated named super constructor parameter - lib\src\features\home_detail\domain\residence_detail.dart:41:11 -
         super_formal_parameter_without_associated_named
  error - Class 'ResidenceDetail' can't define method 'copyWith' and have field '_$EntityDetail.copyWith' with the same name -
         lib\src\features\home_detail\domain\residence_detail.dart:48:19 - conflicting_method_and_field
  error - The getter 'id' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:82:22 -
         undefined_getter
  error - The getter 'categoryId' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:83:38 - 
         undefined_getter
  error - The getter 'subCategoryId' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:84:44         - undefined_getter
  error - The getter 'coverImageUrl' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:85:44         - undefined_getter
  error - The getter 'name' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:86:26 -       
         undefined_getter
  error - The getter 'cityName' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:87:34 -   
         undefined_getter
  error - The getter 'sectorName' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:88:38 - 
         undefined_getter
  error - The getter 'latLng' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:89:30 -     
         undefined_getter
  error - The getter 'avgRating' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:90:36 -
         undefined_getter
  error - The getter 'totalReviews' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:91:42 
         - undefined_getter
  error - The getter 'isPopular' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:93:36 -  
         undefined_getter
  error - The getter 'openingHours' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:94:42 
         - undefined_getter
  error - The getter 'entityStatus' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:95:42 
         - undefined_getter
  error - The getter 'status' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:96:30 -     
         undefined_getter
  error - The getter 'createdAt' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:97:36 -
         undefined_getter
  error - The getter 'type' isn't defined for the type 'ResidenceDetail' - lib\src\features\home_detail\domain\residence_detail.dart:112:26 -      
         undefined_getter
  error - The method 'toJson' is always abstract in the supertype - lib\src\features\home_detail\domain\residence_detail.dart:118:14 -
         abstract_super_member_reference
  error - The getter 'name' isn't defined for the type 'EntityDetail' - lib\src\features\home_detail\presentation\home_detail_app_bar.dart:56:55 -
         undefined_getter
  error - The name 'ResidenceDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/residence_detail.dart' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:60:35 - ambiguous_import
  error - The name 'ResidenceDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/residence_detail.dart' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:61:47 - ambiguous_import
  error - The getter 'isPopular' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:70:25 - undefined_getter
  error - The getter 'isPopular' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:115:20 - undefined_getter
  error - The getter 'categoryId' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:152:32 - undefined_getter
  error - The getter 'id' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:153:30 - undefined_getter
   info - Unnecessary use of multiple underscores - lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:161:26 -
          unnecessary_underscores
   info - Unnecessary use of multiple underscores - lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:161:30 -
          unnecessary_underscores
  error - The getter 'id' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:168:34 - undefined_getter
  error - The getter 'categoryId' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:169:36 - undefined_getter
  error - The getter 'id' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:197:71 - undefined_getter
  error - The getter 'avgRating' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:215:27 - undefined_getter
  error - The getter 'totalReviews' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:216:31 - undefined_getter
  error - The getter 'sectorName' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:245:70 - undefined_getter
  error - The getter 'cityName' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:245:92 - undefined_getter
  error - The getter 'latLng' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:250:52 - undefined_getter
  error - The name 'ResidenceDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/residence_detail.dart' -
         lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:259:9 - ambiguous_import
  error - Conditions must have a static type of 'bool' - lib\src\features\home_detail\presentation\home_detail_top_right_section.dart:272:14 -     
         non_bool_condition
  error - The getter 'avgRating' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\widgets\rating_graph.dart:56:18 - undefined_getter
  error - The getter 'avgRating' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\widgets\rating_graph.dart:63:26 - undefined_getter
  error - The getter 'totalReviews' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\widgets\rating_graph.dart:70:24 - undefined_getter
  error - The getter 'totalReviews' isn't defined for the type 'EntityDetail' -
         lib\src\features\home_detail\presentation\widgets\rating_graph.dart:83:33 - undefined_getter
   info - Unnecessary use of multiple underscores - lib\src\features\home_detail\presentation\widgets\review_section.dart:42:26 -
          unnecessary_underscores
   info - Unnecessary use of multiple underscores - lib\src\features\home_detail\presentation\widgets\review_section.dart:42:30 -
          unnecessary_underscores
  error - The name 'ResidenceDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/residence_detail.dart' - lib\src\features\my_shop\application\shop_service.dart:67:41 -      
         ambiguous_import
  error - The name 'FoodDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/food_detail.dart' - lib\src\features\my_shop\application\shop_service.dart:73:36 -
         ambiguous_import
  error - The name 'ResidenceDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/residence_detail.dart' - lib\src\features\my_shop\domain\shop_form.dart:54:17 -
         ambiguous_import
  error - The getter 'name' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\domain\shop_form.dart:60:18 - undefined_getter    
  error - The getter 'cityName' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\domain\shop_form.dart:64:22 - undefined_getter  error - The getter 'sectorName' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\domain\shop_form.dart:65:24 -
         undefined_getter
  error - The getter 'latLng' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\domain\shop_form.dart:71:20 - undefined_getter  
  error - The getter 'openingHours' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\domain\shop_form.dart:72:26 -
         undefined_getter
  error - The name 'ResidenceDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/residence_detail.dart' - lib\src\features\my_shop\domain\shop_form.dart:73:27 -
         ambiguous_import
  error - The name 'FoodDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/food_detail.dart' - lib\src\features\my_shop\domain\shop_form.dart:75:21 - ambiguous_import  
  error - The getter 'id' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\presentation\controllers\shop_controller.dart:55:30 
         - undefined_getter
  error - The getter 'id' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\presentation\controllers\shop_controller.dart:57:18 
         - undefined_getter
  error - The getter 'coverImageUrl' isn't defined for the type 'EntityDetail' -
         lib\src\features\my_shop\presentation\controllers\shop_controller.dart:93:54 - undefined_getter
  error - The name 'ResidenceDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/residence_detail.dart' -
         lib\src\features\my_shop\presentation\controllers\shop_controller.dart:96:19 - ambiguous_import
  error - The name 'FoodDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/food_detail.dart' -
         lib\src\features\my_shop\presentation\controllers\shop_controller.dart:103:26 - ambiguous_import
  error - The method 'isEntityOpen' isn't defined for the type 'EntityDetail' -
         lib\src\features\my_shop\presentation\my_shop_dashboard_screen.dart:117:34 - undefined_method
  error - The getter 'coverImageUrl' isn't defined for the type 'EntityDetail' -
         lib\src\features\my_shop\presentation\my_shop_dashboard_screen.dart:132:34 - undefined_getter
  error - The getter 'entityStatus' isn't defined for the type 'EntityDetail' -
         lib\src\features\my_shop\presentation\my_shop_dashboard_screen.dart:146:31 - undefined_getter
  error - The getter 'id' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\presentation\my_shop_dashboard_screen.dart:150:30 - 
         undefined_getter
  error - The getter 'categoryId' isn't defined for the type 'EntityDetail' -
         lib\src\features\my_shop\presentation\my_shop_dashboard_screen.dart:151:34 - undefined_getter
  error - The getter 'name' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\presentation\my_shop_dashboard_screen.dart:205:16 
         - undefined_getter
  error - The getter 'sectorName' isn't defined for the type 'EntityDetail' -
         lib\src\features\my_shop\presentation\my_shop_dashboard_screen.dart:212:41 - undefined_getter
  error - The getter 'cityName' isn't defined for the type 'EntityDetail' -
         lib\src\features\my_shop\presentation\my_shop_dashboard_screen.dart:212:61 - undefined_getter
  error - The argument type 'EntityDetail' can't be assigned to the parameter type 'Entity'.  -
         lib\src\features\my_shop\presentation\my_shop_dashboard_screen.dart:216:37 - argument_type_not_assignable
  error - The name 'ResidenceDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/residence_detail.dart' - lib\src\features\my_shop\presentation\shop_form_extension.dart:12:27         - ambiguous_import
  error - The name 'FoodDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/food_detail.dart' - lib\src\features\my_shop\presentation\shop_form_extension.dart:32:34 -   
         ambiguous_import
  error - 'ResidenceDetail' isn't a function - lib\src\features\my_shop\presentation\shop_form_extension.dart:54:16 - invocation_of_non_function   
  error - The name 'ResidenceDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/residence_detail.dart' - lib\src\features\my_shop\presentation\shop_form_extension.dart:54:16         - ambiguous_import
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\my_shop\presentation\shop_form_extension.dart:61:29 -
       inference_failure_on_collection_literal
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\my_shop\presentation\shop_form_extension.dart:70:28 -
       inference_failure_on_collection_literal
  error - 'FoodDetail' isn't a function - lib\src\features\my_shop\presentation\shop_form_extension.dart:88:16 - invocation_of_non_function        
  error - The name 'FoodDetail' is defined in the libraries 'package:app/src/features/home_detail/domain/entity_detail.dart' and
         'package:app/src/features/home_detail/domain/food_detail.dart' - lib\src\features\my_shop\presentation\shop_form_extension.dart:88:16 -   
         ambiguous_import
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\my_shop\presentation\shop_form_extension.dart:95:29 -
       inference_failure_on_collection_literal
warning - The type argument(s) of 'List' can't be inferred - lib\src\features\my_shop\presentation\shop_form_extension.dart:104:28 -
       inference_failure_on_collection_literal
  error - The getter 'categoryId' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\presentation\shop_form_screen.dart:36:34 -  
         undefined_getter
  error - The getter 'subCategoryId' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\presentation\shop_form_screen.dart:37:37 
         - undefined_getter
  error - The getter 'id' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\presentation\shop_form_screen.dart:48:38 -
         undefined_getter
  error - The getter 'coverImageUrl' isn't defined for the type 'EntityDetail' - lib\src\features\my_shop\presentation\shop_form_screen.dart:212:52         - undefined_getter
   info - Unnecessary use of multiple underscores - lib\src\features\my_shop\presentation\widgets\cover_and_gallery_image_tile.dart:219:35 -
          unnecessary_underscores
  error - The getter 'id' isn't defined for the type 'EntityDetail' - lib\src\features\review\presentation\review_list_screen.dart:71:68 -
         undefined_getter
  error - The property 'categoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:17:27 - unchecked_use_of_nullable_value
  error - The property 'categoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:27:27 - unchecked_use_of_nullable_value
  error - The property 'categoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:38:27 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:38:62 - unchecked_use_of_nullable_value
  error - The property 'categoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:48:27 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:48:62 - unchecked_use_of_nullable_value
  error - The property 'categoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:61:19 - unchecked_use_of_nullable_value
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:62:19 - unchecked_use_of_nullable_value
  error - The property 'categoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:77:19 - unchecked_use_of_nullable_value
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:78:19 - unchecked_use_of_nullable_value
  error - The property 'categoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:97:21 - unchecked_use_of_nullable_value
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:98:21 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:99:21 - unchecked_use_of_nullable_value
  error - The property 'categoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:115:19 - unchecked_use_of_nullable_value
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:116:19 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_food_repository_test.dart:117:19 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_residence_repository_test.dart:33:29 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_residence_repository_test.dart:45:29 - unchecked_use_of_nullable_value
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_residence_repository_test.dart:61:21 - unchecked_use_of_nullable_value
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_residence_repository_test.dart:77:19 - unchecked_use_of_nullable_value
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_residence_repository_test.dart:96:21 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_residence_repository_test.dart:97:21 - unchecked_use_of_nullable_value
  error - The property 'subCategoryId' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_residence_repository_test.dart:114:21 - unchecked_use_of_nullable_value
  error - The property 'isPopular' can't be unconditionally accessed because the receiver can be 'null' -
         test\src\features\home\data\fake\fake_residence_repository_test.dart:115:21 - unchecked_use_of_nullable_value
  error - The getter 'id' isn't defined for the type 'FoodDetail' -
         test\src\features\home_detail\data\fake\fake_food_details_repository_test.dart:17:63 - undefined_getter
  error - The getter 'id' isn't defined for the type 'FoodDetail' -
         test\src\features\home_detail\data\fake\fake_food_details_repository_test.dart:29:47 - undefined_getter
  error - The getter 'id' isn't defined for the type 'ResidenceDetail' -
         test\src\features\home_detail\data\fake\fake_residence_details_repository_test.dart:17:73 - undefined_getter
  error - The getter 'id' isn't defined for the type 'ResidenceDetail' -
         test\src\features\home_detail\data\fake\fake_residence_details_repository_test.dart:32:54 - undefined_getter

328 issues found. (ran in 6.7s)
PS D:\Flutter Apps\City Helper System\app> 