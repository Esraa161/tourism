class ShowCategoriesModel {
  List<Data>? data;

  ShowCategoriesModel({this.data});

  ShowCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? groupid;
  String? groupname;
  String? groupnotes;
  int? parentid;
  String? parentgroupname;

  Data(
      {this.groupid,
        this.groupname,
        this.groupnotes,
        this.parentid,
        this.parentgroupname});

  Data.fromJson(Map<String, dynamic> json) {
    groupid = json['groupid'];
    groupname = json['groupname'];
    groupnotes = json['groupnotes'];
    parentid = json['parentid'];
    parentgroupname = json['parentgroupname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupid'] = this.groupid;
    data['groupname'] = this.groupname;
    data['groupnotes'] = this.groupnotes;
    data['parentid'] = this.parentid;
    data['parentgroupname'] = this.parentgroupname;
    return data;
  }
}