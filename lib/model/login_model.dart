class LoginModel {
  String? token;
  String? refreshToken;
  List<Userproperty>? userproperty = [];
  List<Company>? company = [];
  List<Settings>? settings = [];
  List<Posprop>? posprop = [];
  List<Compoptions>? compoptions = [];
  List<Smandata>? smandata = [];
  List<Hrsetting>? hrsetting = [];

  LoginModel(
      {token,
      refreshToken,
      userproperty,
      company,
      settings,
      posprop,
      compoptions,
      smandata});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    if (json['userproperty'] != null) {
      userproperty = <Userproperty>[];
      json['userproperty'].forEach((v) {
        userproperty!.add(Userproperty.fromJson(v));
      });
    } else {
      userproperty = <Userproperty>[];
      userproperty!.add(Userproperty());
    }
    if (json['company'] != null) {
      company = <Company>[];
      json['company'].forEach((v) {
        company!.add(Company.fromJson(v));
      });
    } else {
      company = <Company>[];
      company!.add(Company());
    }
    if (json['settings'] != null) {
      settings = <Settings>[];
      json['settings'].forEach((v) {
        settings!.add(Settings.fromJson(v));
      });
      if (settings!.isEmpty) {
        settings!.add(Settings());
      }
    } else {
      settings = <Settings>[];
      settings!.add(Settings());
    }
    if (json['posprop'] != null) {
      posprop = <Posprop>[];
      json['posprop'].forEach((v) {
        posprop!.add(Posprop.fromJson(v));
      });
      if (posprop!.isEmpty) {
        posprop!.add(Posprop());
      }
    } else {
      posprop = <Posprop>[];
      posprop!.add(Posprop());
    }
    if (json['compoptions'] != null) {
      compoptions = <Compoptions>[];
      json['compoptions'].forEach((v) {
        compoptions!.add(Compoptions.fromJson(v));
      });
      if (compoptions!.isEmpty) {
        compoptions!.add(Compoptions());
      }
    } else {
      compoptions = <Compoptions>[];
      compoptions!.add(Compoptions());
    }
    if (json['smandata'] != null) {
      smandata = <Smandata>[];
      json['smandata'].forEach((v) {
        smandata!.add(Smandata.fromJson(v));
      });
      if (smandata!.isEmpty) {
        smandata!.add(Smandata());
      }
    } else {
      smandata = <Smandata>[];
      smandata!.add(Smandata());
    }
    if (json['hrsetting'] != null) {
      hrsetting = <Hrsetting>[];
      json['hrsetting'].forEach((v) {
        hrsetting!.add(Hrsetting.fromJson(v));
      });
      if (hrsetting!.isEmpty) {
        hrsetting!.add(Hrsetting());
      }
    } else {
      hrsetting = <Hrsetting>[];
      hrsetting!.add(Hrsetting());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    if (userproperty != null) {
      data['userproperty'] = userproperty!.map((v) => v.toJson()).toList();
    }
    if (company != null) {
      data['company'] = company!.map((v) => v.toJson()).toList();
    }
    if (settings != null) {
      data['settings'] = settings!.map((v) => v.toJson()).toList();
    }
    if (posprop != null) {
      data['posprop'] = posprop!.map((v) => v.toJson()).toList();
    }
    if (compoptions != null) {
      data['compoptions'] = compoptions!.map((v) => v.toJson()).toList();
    }
    if (smandata != null) {
      data['smandata'] = smandata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Userproperty {
  String? userid;
  String? userName;
  double? udiscperitem;
  int? uyearid;
  String? uyear;
  int? rlevel;
  String? rlevelname;
  int? empid;
  String? usammary;
  String? empname;
  int? branchid;
  String? branchname;
  int? ccid;
  String? ccname;
  String? username;
  int? id;
  String? password;
  int? compenyId;
  String? emailaddress;
  String? compenyUserid;
  String? pincode;
  String? compenypath;

  Userproperty(
      {userid,
      userName,
      udiscperitem,
      uyearid,
      uyear,
      rlevel,
      rlevelname,
      empid,
      usammary,
      empname,
      branchid,
      branchname,
      ccid,
      ccname,
      username,
      id,
      password,
      compenyId,
      emailaddress,
      compenyUserid,
      pincode,
      compenypath});

  Userproperty.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    userName = json['UserName'];
    udiscperitem = json['udiscperitem'];
    uyearid = json['uyearid'];
    uyear = json['uyear'];
    rlevel = json['rlevel'];
    rlevelname = json['rlevelname'];
    empid = json['empid'];
    usammary = json['usammary'];
    empname = json['empname'];
    branchid = json['branchid'];
    branchname = json['branchname'];
    ccid = json['ccid'];
    ccname = json['ccname'];
    username = json['username'];
    id = json['id'];
    password = json['password'];
    compenyId = json['compeny_id'];
    emailaddress = json['emailaddress'];
    compenyUserid = json['compeny_userid'];
    pincode = json['pincode'];
    compenypath = json['compenypath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    data['UserName'] = userName;
    data['udiscperitem'] = udiscperitem;
    data['uyearid'] = uyearid;
    data['uyear'] = uyear;
    data['rlevel'] = rlevel;
    data['rlevelname'] = rlevelname;
    data['empid'] = empid;
    data['usammary'] = usammary;
    data['empname'] = empname;
    data['branchid'] = branchid;
    data['branchname'] = branchname;
    data['ccid'] = ccid;
    data['ccname'] = ccname;
    data['username'] = username;
    data['id'] = id;
    data['password'] = password;
    data['compeny_id'] = compenyId;
    data['emailaddress'] = emailaddress;
    data['compeny_userid'] = compenyUserid;
    data['pincode'] = pincode;
    data['compenypath'] = compenypath;
    return data;
  }
}

class Company {
  int? compid;
  String? compname;
  String? compact;
  String? compyear;
  String? complegal;
  String? comptel;
  String? compmob;
  String? compweb;
  String? compemail;
  String? compadd;
  String? compmanager;
  String? compvatno;
  String? compnotes;
  String? complogo;

  Company(
      {compid,
      compname,
      compact,
      compyear,
      complegal,
      comptel,
      compmob,
      compweb,
      compemail,
      compadd,
      compmanager,
      compvatno,
      compnotes,
      complogo});

  Company.fromJson(Map<String, dynamic> json) {
    compid = json['compid'];
    compname = json['compname'];
    compact = json['compact'];
    compyear = json['compyear'];
    complegal = json['complegal'];
    comptel = json['comptel'];
    compmob = json['compmob'];
    compweb = json['compweb'];
    compemail = json['compemail'];
    compadd = json['compadd'];
    compmanager = json['compmanager'];
    compvatno = json['compvatno'];
    compnotes = json['compnotes'];
    complogo = json['complogo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['compid'] = compid;
    data['compname'] = compname;
    data['compact'] = compact;
    data['compyear'] = compyear;
    data['complegal'] = complegal;
    data['comptel'] = comptel;
    data['compmob'] = compmob;
    data['compweb'] = compweb;
    data['compemail'] = compemail;
    data['compadd'] = compadd;
    data['compmanager'] = compmanager;
    data['compvatno'] = compvatno;
    data['compnotes'] = compnotes;
    data['complogo'] = complogo;
    return data;
  }
}

class Settings {
  Null? chartlvl;
  double? vat;
  int? vattype;
  bool? allowing;
  int? costcalc;
  bool? autoemp;
  bool? autoitem;
  int? printno;
  bool? sprice;
  bool? wpitem;
  Null? wpitemdigit;
  bool? posAdditionalStatement;
  Null? segday;
  Null? segperiod;
  int? slackRateid;
  String? slackrateName;
  int? predecessorratio;
  int? userlimit;
  bool? automaticpoststock;
  bool? automaticpostacc;
  bool? showpayinmobcash;
  bool? brancheslimit;

  Settings(
      {chartlvl,
      vat,
      vattype,
      allowing,
      costcalc,
      autoemp,
      autoitem,
      printno,
      sprice,
      wpitem,
      wpitemdigit,
      posAdditionalStatement,
      segday,
      segperiod,
      slackRateid,
      slackrateName,
      predecessorratio,
      userlimit,
      automaticpoststock,
      automaticpostacc,
      showpayinmobcash,
      brancheslimit});

  Settings.fromJson(Map<String, dynamic> json) {
    chartlvl = json['chartlvl'];
    vat = json['vat'];
    vattype = json['vattype'];
    allowing = json['allowing'];
    costcalc = json['costcalc'];
    autoemp = json['autoemp'];
    autoitem = json['autoitem'];
    printno = json['printno'];
    sprice = json['sprice'];
    wpitem = json['wpitem'];
    wpitemdigit = json['wpitemdigit'];
    posAdditionalStatement = json['pos_additional_statement'];
    segday = json['segday'];
    segperiod = json['segperiod'];
    slackRateid = json['slack_rateid'];
    slackrateName = json['slackrate_name'];
    predecessorratio = json['predecessorratio'];
    userlimit = json['userlimit'];
    automaticpoststock = json['automaticpoststock'];
    automaticpostacc = json['automaticpostacc'];
    showpayinmobcash = json['showpayinmobcash'];
    brancheslimit = json['brancheslimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chartlvl'] = chartlvl;
    data['vat'] = vat;
    data['vattype'] = vattype;
    data['allowing'] = allowing;
    data['costcalc'] = costcalc;
    data['autoemp'] = autoemp;
    data['autoitem'] = autoitem;
    data['printno'] = printno;
    data['sprice'] = sprice;
    data['wpitem'] = wpitem;
    data['wpitemdigit'] = wpitemdigit;
    data['pos_additional_statement'] = posAdditionalStatement;
    data['segday'] = segday;
    data['segperiod'] = segperiod;
    data['slack_rateid'] = slackRateid;
    data['slackrate_name'] = slackrateName;
    data['predecessorratio'] = predecessorratio;
    data['userlimit'] = userlimit;
    data['automaticpoststock'] = automaticpoststock;
    data['automaticpostacc'] = automaticpostacc;
    data['showpayinmobcash'] = showpayinmobcash;
    data['brancheslimit'] = brancheslimit;
    return data;
  }
}

class Posprop {
  bool? items;
  bool? customers;
  bool? invoice;
  bool? rtninvoice;
  bool? payable;
  bool? recevable;
  bool? account;
  bool? cashier;
  bool? addUser;
  bool? vectors;
  bool? usersPermesion;
  bool? ispos;
  int? locationtracetype;

  Posprop(
      {items,
      customers,
      invoice,
      rtninvoice,
      payable,
      recevable,
      account,
      cashier,
      addUser,
      vectors,
      usersPermesion,
      ispos,
      locationtracetype});

  Posprop.fromJson(Map<String, dynamic> json) {
    items = json['items'];
    customers = json['customers'];
    invoice = json['invoice'];
    rtninvoice = json['rtninvoice'];
    payable = json['payable'];
    recevable = json['recevable'];
    account = json['account'];
    cashier = json['cashier'];
    addUser = json['AddUser'];
    vectors = json['vectors'];
    usersPermesion = json['UsersPermesion'];
    ispos = json['ispos'];
    locationtracetype = json['locationtracetype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items'] = items;
    data['customers'] = customers;
    data['invoice'] = invoice;
    data['rtninvoice'] = rtninvoice;
    data['payable'] = payable;
    data['recevable'] = recevable;
    data['account'] = account;
    data['cashier'] = cashier;
    data['AddUser'] = addUser;
    data['vectors'] = vectors;
    data['UsersPermesion'] = usersPermesion;
    data['ispos'] = ispos;
    data['locationtracetype'] = locationtracetype;
    return data;
  }
}

class Compoptions {
  bool? haspos;
  bool? hasmobileapp;

  Compoptions({haspos, hasmobileapp});

  Compoptions.fromJson(Map<String, dynamic> json) {
    haspos = json['haspos'];
    hasmobileapp = json['hasmobileapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['haspos'] = haspos;
    data['hasmobileapp'] = hasmobileapp;
    return data;
  }
}

class Smandata {
  int? smanid;
  String? smanname;

  Smandata({smanid, smanname});

  Smandata.fromJson(Map<String, dynamic> json) {
    smanid = json['smanid'];
    smanname = json['smanname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['smanid'] = smanid;
    data['smanname'] = smanname;
    return data;
  }
}

class Hrsetting {
  int? id;
  String? userid;
  bool? requestVacation;
  bool? requestLoan;
  bool? requestCustody;
  int? empid;
  bool? addvcation;
  bool? addloan;
  bool? addcustody;
  bool? requestAllowleave;
  bool? addallowleave;
  bool? requestExpenses;
  bool? addallowexpenses;
  int? docEndPeriod;

  Hrsetting(
      {this.id,
      this.userid,
      this.requestVacation,
      this.requestLoan,
      this.requestCustody,
      this.empid,
      this.addvcation,
      this.addloan,
      this.addcustody,
      this.requestAllowleave,
      this.addallowleave,
      this.requestExpenses,
      this.addallowexpenses,
      this.docEndPeriod});

  Hrsetting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userid = json['userid'];
    requestVacation = json['request_vacation'];
    requestLoan = json['request_loan'];
    requestCustody = json['request_custody'];
    empid = json['empid'];
    addvcation = json['addvcation'];
    addloan = json['addloan'];
    addcustody = json['addcustody'];
    requestAllowleave = json['request_allowleave'];
    addallowleave = json['addallowleave'];
    requestExpenses = json['request_expenses'];
    addallowexpenses = json['addallowexpenses'];
    docEndPeriod = json['doc_end_period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userid'] = userid;
    data['request_vacation'] = requestVacation;
    data['request_loan'] = requestLoan;
    data['request_custody'] = requestCustody;
    data['empid'] = empid;
    data['addvcation'] = addvcation;
    data['addloan'] = addloan;
    data['addcustody'] = addcustody;
    data['request_allowleave'] = requestAllowleave;
    data['addallowleave'] = addallowleave;
    data['request_expenses'] = requestExpenses;
    data['addallowexpenses'] = addallowexpenses;
    data['doc_end_period'] = docEndPeriod;
    return data;
  }
}
