class ItemInCategoryModel {
  List<CategoryItem>? data;

  ItemInCategoryModel({this.data});

  ItemInCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoryItem>[];
      json['data'].forEach((v) {
        data!.add(new CategoryItem.fromJson(v));
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

class CategoryItem {
  int? itemid;
  String? itemcode;
  Null? itemcode2;
  Null? itemcode3;
  String? itembarcode;
  Null? itembarcode2;
  String? itemname;
  String? itemename;
  Null? itemdesc;
  int? unitid;
  String? unitname;
  int? groupid;
  String? groupname;
  int? itemtypeid;
  String? itemtypename;
  int? suppid;
  String? suppname;
  int? itemstop;
  String? itemstopname;
  double? minqty;
  double? maxqty;
  double? pprice;
  double? cprice;
  double? sprice;
  double? minslsprice;
  double? wholeslsprice;
  double? vat;
  double? vprice;
  double? fprice;
  Null? commp;
  Null? oferbdate;
  double? descp;
  Null? oferedate;
  Null? oferstop;
  String? itempic;
  Null? itemfield1;
  Null? itemfield2;
  Null? itemcat1;
  Null? itemcatname1;
  Null? itemcat2;
  Null? itemcatname2;
  Null? balance;
  Null? prodonsale;
  int? expirationdate;
  int? saleswithoutquantity;
  int? fractionalsale;
  double? calories;

  CategoryItem(
      {this.itemid,
      this.itemcode,
      this.itemcode2,
      this.itemcode3,
      this.itembarcode,
      this.itembarcode2,
      this.itemname,
      this.itemename,
      this.itemdesc,
      this.unitid,
      this.unitname,
      this.groupid,
      this.groupname,
      this.itemtypeid,
      this.itemtypename,
      this.suppid,
      this.suppname,
      this.itemstop,
      this.itemstopname,
      this.minqty,
      this.maxqty,
      this.pprice,
      this.cprice,
      this.sprice,
      this.minslsprice,
      this.wholeslsprice,
      this.vat,
      this.vprice,
      this.fprice,
      this.commp,
      this.oferbdate,
      this.descp,
      this.oferedate,
      this.oferstop,
      this.itempic,
      this.itemfield1,
      this.itemfield2,
      this.itemcat1,
      this.itemcatname1,
      this.itemcat2,
      this.itemcatname2,
      this.balance,
      this.prodonsale,
      this.expirationdate,
      this.saleswithoutquantity,
      this.fractionalsale,
      this.calories});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    itemid = json['itemid'];
    itemcode = json['itemcode'];
    itemcode2 = json['itemcode2'];
    itemcode3 = json['itemcode3'];
    itembarcode = json['itembarcode'];
    itembarcode2 = json['itembarcode2'];
    itemname = json['itemname'];
    itemename = json['itemename'];
    itemdesc = json['itemdesc'];
    unitid = json['unitid'];
    unitname = json['unitname'];
    groupid = json['groupid'];
    groupname = json['groupname'];
    itemtypeid = json['itemtypeid'];
    itemtypename = json['itemtypename'];
    suppid = json['suppid'];
    suppname = json['suppname'];
    itemstop = json['itemstop'];
    itemstopname = json['itemstopname'];
    minqty = json['minqty'];
    maxqty = json['maxqty'];
    pprice = json['pprice'];
    cprice = json['cprice'];
    sprice = json['sprice'];
    minslsprice = json['minslsprice'];
    wholeslsprice = json['wholeslsprice'];
    vat = json['vat'];
    vprice = json['vprice'];
    fprice = json['fprice'];
    commp = json['commp'];
    oferbdate = json['oferbdate'];
    descp = json['descp'];
    oferedate = json['oferedate'];
    oferstop = json['oferstop'];
    itempic = json['itempic'];
    itemfield1 = json['itemfield1'];
    itemfield2 = json['itemfield2'];
    itemcat1 = json['itemcat1'];
    itemcatname1 = json['itemcatname1'];
    itemcat2 = json['itemcat2'];
    itemcatname2 = json['itemcatname2'];
    balance = json['balance'];
    prodonsale = json['prodonsale'];
    expirationdate = json['expirationdate'];
    saleswithoutquantity = json['saleswithoutquantity'];
    fractionalsale = json['fractionalsale'];
    calories = json['calories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemid'] = this.itemid;
    data['itemcode'] = this.itemcode;
    data['itemcode2'] = this.itemcode2;
    data['itemcode3'] = this.itemcode3;
    data['itembarcode'] = this.itembarcode;
    data['itembarcode2'] = this.itembarcode2;
    data['itemname'] = this.itemname;
    data['itemename'] = this.itemename;
    data['itemdesc'] = this.itemdesc;
    data['unitid'] = this.unitid;
    data['unitname'] = this.unitname;
    data['groupid'] = this.groupid;
    data['groupname'] = this.groupname;
    data['itemtypeid'] = this.itemtypeid;
    data['itemtypename'] = this.itemtypename;
    data['suppid'] = this.suppid;
    data['suppname'] = this.suppname;
    data['itemstop'] = this.itemstop;
    data['itemstopname'] = this.itemstopname;
    data['minqty'] = this.minqty;
    data['maxqty'] = this.maxqty;
    data['pprice'] = this.pprice;
    data['cprice'] = this.cprice;
    data['sprice'] = this.sprice;
    data['minslsprice'] = this.minslsprice;
    data['wholeslsprice'] = this.wholeslsprice;
    data['vat'] = this.vat;
    data['vprice'] = this.vprice;
    data['fprice'] = this.fprice;
    data['commp'] = this.commp;
    data['oferbdate'] = this.oferbdate;
    data['descp'] = this.descp;
    data['oferedate'] = this.oferedate;
    data['oferstop'] = this.oferstop;
    data['itempic'] = this.itempic;
    data['itemfield1'] = this.itemfield1;
    data['itemfield2'] = this.itemfield2;
    data['itemcat1'] = this.itemcat1;
    data['itemcatname1'] = this.itemcatname1;
    data['itemcat2'] = this.itemcat2;
    data['itemcatname2'] = this.itemcatname2;
    data['balance'] = this.balance;
    data['prodonsale'] = this.prodonsale;
    data['expirationdate'] = this.expirationdate;
    data['saleswithoutquantity'] = this.saleswithoutquantity;
    data['fractionalsale'] = this.fractionalsale;
    data['calories'] = this.calories;
    return data;
  }
}
