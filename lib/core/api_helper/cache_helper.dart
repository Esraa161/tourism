import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static setBool(key, bool? value) {
    if (value != null) {
      sharedPreferences.setBool(key, value);
    }
  }

  static setCustomer({required customer}) {
    sharedPreferences.setString("F", customer);
  }

  static deleteCustomer() {
    sharedPreferences.remove("F");
  }

  static getCustomer() {
    return sharedPreferences.getString("F");
  }

  static getBool(key) {
    return sharedPreferences.getBool(key) ?? false;
  }

  static getBoolNULL(key) {
    return sharedPreferences.getBool(key);
  }

  static setString(key, String? value) {
    sharedPreferences.setString(key, value ?? "-");
  }

  static getString(key) {
    return sharedPreferences.getString(key) ?? "";
  }

  static getStringNull(key) {
    return sharedPreferences.getString(key) == "-"
        ? null
        : sharedPreferences.getString(key);
  }

  static getLanguage() {
    return sharedPreferences.getString(CustomerHelper.LANGUAGE) ?? "en";
  }

  static setLanguage(String language) {
    return sharedPreferences.setString(CustomerHelper.LANGUAGE, language);
  }

  static setInt(key, int? value) {
    sharedPreferences.setInt(key, value ?? -1);
  }

  static getInt(key) {
    return sharedPreferences.getInt(key) ?? -1;
  }

  static getIntNull1(key) {
    return sharedPreferences.getInt(key);
  }

  static getIntNull(key) {
    return sharedPreferences.getInt(key) == -1
        ? null
        : sharedPreferences.getInt(key);
  }

  static setDouble(key, double value) {
    sharedPreferences.setDouble(key, value);
  }

  static getDouble(key) {
    return sharedPreferences.getDouble(key) ?? 0;
  }

  static getCompanyPath() {
    return sharedPreferences.getString(CustomerHelper.COMPENYPATH) ?? "";
  }

  static setCompanyPath(String text) {
    return sharedPreferences.setString(CustomerHelper.COMPENYPATH, text);
  }

  static clear() async {
    await sharedPreferences.clear();
    return true;
  }
}

class CustomerHelper {
  static const String SHOW_ITEMS = "SHOW_ITEMS";
  static const String JOB_ID = "EMPLOYEE_ID";
  static const String EMPLOYEE_ID = "EMPLOYEE_ID";
  static const String EMPLOYEE_NAME = "EMPLOYEE_NAME";
  static const String AUTO_ITEM = "AUTO_ITEM";
  static const String TAX_AMMOUNT_TEST = "TAX_AMMOUNT_TEST";

  static const String PIN_CODER = "PIN_CODER";
  static const String CASHIER_NAME = "CASHIER_NAME";
  static const String IS_POS = "IS_POS";
  static const String CASHIER_LOGIN = "CASHIER_LOGIN";

  static const String AUTOMATIC_POIST_STOCK = "AUTOMATIC_POIST_STOCK";
  static const String AUTOMATIC_POIST_ACC = "AUTOMATIC_POIST_ACC";
  static const String SHOW_PAY_INMOB_CASH = "SHOW_PAY_INMOB_CASH";

  static const String SHOW_CUSTOMERS = "SHOW_CUSTOMERS";
  static const String SHOW_INVOICE = "SHOW_INVOICE";
  static const String SHOW_RETURN = "SHOW_RETURN";
  static const String SHOW_PAYABLE = "SHOW_PAYABLE";
  static const String SHOW_RECEIVABLE = "SHOW_RECEIVABLE";
  static const String SHOW_ACCOUNT = "SHOW_ACCOUNT";
  static const String SHOW_CASHIER = "SHOW_CASHIER";

  static const String AUTOBRANCH = "AUTOBRANCH";
  static const String LANGUAGE = "LANGUAGE";
  static const String LOGIN = "LOGIN";
  static const String ON_BOARDING_SCREEN = "ON_BOARDING_SCREEN";
  static const String CONFIRM_VACATION = "CONFIRM_VACATION";
  static const String BRANCH_NAME = "BRANCH_NAME";
  static const String SHOW_PAY_IN_MOB_CASH = "SHOW_PAY_IN_MOB_CASH";
  static const String BRANCH_ID = "BRANCH_ID";
  static const String BRANCH_ADRESS_NAME = "BRANCH_ADRESS_NAME";
  static const String BRANCH_ADRESS_ID = "BRANCH_ADRESS_ID";

  static const String BRANCH_NAME2 = "BRANCH_NAME2";
  static const String BRANCH_ADRESS_NAME2 = "BRANCH_ADRESS_NAME2";

  static const String SMANID = "SMANID";
  static const String SMANNAME = "SMANNAME";

  static const String DEFAULT_BRANCH = "DEFAULT_BRANCH";
  static const String DEFAULT_BRANCH_ID = "DEFAULT_BRANCH_ID";
  static const String DEFAULT_TAX_NUMBER = "DEFAULT_TAX_NUMBER";

  static const String TAX_AMMOUNT = "TAX_AMMOUNT";
  static const String UPDATED_VERSION = "UPDATED_VERSION";
  static const String YEAR = "YEAR";
  static const String USER_ID = "USER_ID";
  static const String USER_NAME = "USER_NAME";
  static const String TOKEN = "TOKEN";

  static const String CCID = "CCID";
  static const String CCNAME = "CCNAME";
  static const String COMPENYPATH = "COMPENYPATH";
  static const String PRINTTYPE = "PRINTTYPE";
  static const String LOCATIONTRACETYPE = "LOCATIONTRACETYPE";
  static const String TAX_NUMBER = "TAX_NUMBER";
  static const String SETTINGNOTES = "SETTINGNOTES";
  static const String VATTYPE = "VATTYPE";
  static const String Addloan = "Addloan";
  static const String AddVacation = "addVacation";
  static const String Addallowexpenses = "addallowexpenses";
  static const String Addallowleave = "addallowleave";
  static const String RequestCustody = "requestCustody";
  static const String Request_Expenses = "Request_Expenses";
  static const String Request_Allowleave = "Request_Allowleave";
  static const String Request_loan = "Request_loan";
  static const String Request_vacation = "Request_vacation";

  static const String Addcustody = "addcustody";
  static const String id = "id";
  static const String Loanid = "loanid";

  static const String Emp_Image = "emppic";
  static const String Emp_ProfileName = "empname";
  static const String Emp_ProfileEmail = "embemail";
}
