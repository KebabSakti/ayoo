// To parse this JSON data, do
//
//     final viewModel = viewModelFromJson(jsonString);

import 'dart:convert';

ViewModel viewModelFromJson(String str) => ViewModel.fromJson(json.decode(str));

String viewModelToJson(ViewModel data) => json.encode(data.toJson());

class ViewModel {
  ViewModel({
    this.totalView,
    this.relationId,
  });

  String totalView;
  String relationId;

  factory ViewModel.fromJson(Map<String, dynamic> json) => ViewModel(
        totalView: json["total_view"],
        relationId: json["relation_id"],
      );

  Map<String, dynamic> toJson() => {
        "total_view": totalView,
        "relation_id": relationId,
      };
}
