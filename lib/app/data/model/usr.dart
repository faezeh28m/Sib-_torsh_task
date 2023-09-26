// class User {
//   User({
//     String? firstName,
//     String? lastName,
//   }) {
//     _firstName = firstName;
//     _lastName = lastName;
//   }
//
//   User.fromJson(dynamic json) {
//     _firstName = json['firstName'];
//     _lastName = json['lastName'];
//   }
//
//   static List<User> getListFromJson(values){
//     return values.map<User>((data) => User.fromJson(data)).toList();
//   }
//
//   String? _firstName;
//   String? _lastName;
//
//
//   String? get firstName => _firstName;
//
//   String? get lastName => _lastName;
//
//   Map<String, String> toJson() {
//     final map = <String, String>{};
//     map['firstName'] = _firstName ?? "";
//     map['lastName'] = _lastName ?? "";
//
//     return map;
//   }
// }
