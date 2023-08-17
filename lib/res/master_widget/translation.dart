import 'package:get/get.dart';

class TranslationManager extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //
        // English
        //
        'en': {
          //defualt for auth don't edit the key...
          'font': 'DancingScript',
          'witting': 'Witting...',
          'registerScreen': 'Register screen',
          'registerForFree': 'Register for free!',
          'emailAdrees': 'Email adrees',
          'oldPassword': 'Old password',
          'newPassword': 'New password',
          'confirmNewPassword': 'Confirm new password',
          'canselTheProcess': 'Cansel the process',
          'changePassword': 'Change password',
          'allRieghtReserved': 'All rieght reserved',
          'forgetPassword': 'Forget password',
          'loginScreen': 'Login screen',
          'restPassword': 'Rest Password',
          'password': 'Password',
          'youDoNotHaveAnAccont': 'you don\'t have an accont?',
          'login': 'Login',
          'confirmPassword': 'Confirm password',
          'youHaveAccont': 'you have accont?',
          'goToLoginScreen': 'Go to login screen!',
          'register': 'Register',
          'loginToContunie': 'Login to contunie',
          'plaseInsertEmailAdress': 'Plase insert email adress.',
          'plaseInsertPassword': 'Plase insert password.',
          'palseInsert6LaterAtLess': 'Plase insert 6 later at less.',
          'passwordIsNotMatch': 'Password is not match.',
          'hiddPassword': 'Hidd password',
          'changeLang': 'Change Language',
          'logout': 'Logout',
          'homeScreen': 'Home Screen',
          'search': 'Search',
          'region': 'Chaese region',
          'type': 'chease type',
          "editePasswordSccuss": "Password has been modified successfully",
          "currectEmail": "Palse insert a currect email",
          "wrongEmailAngPassword": "Email or password is wrong",
          //defualt for auth don't edit the key...
          "ok": "Ok",
          "notes": "Notes",
          "successfullyConfirmTheOrder": "Successfully confirm the order.",
          "warning": "Warning",
          "somethingWentWrongPleaseContactUs":
              "Something went wrong, please contact us.",
          "areYouSureToInstallTheOrder":
              "Are you sure to confirming the order? \nNote: The order cannot be deleted or modified after installation",
          "cancel": "Cancel",
          "deleteOrder": "The order has been successfully deleted.",
          "delete": "Delete",
          "deleteOrder?": "Are you sure to delete this order?",
          "placeToReceive": "Determine the place to receive the request.",
          "confirmation": "Confirmation",
          "confirming?":
              "Are you sure that the order has been confirming?\nNote: After confirming the order, it cannot be cance.",
          "selectLocation": "Please select a location",
          "addLocation": "Add location to favourites",
          "addNewLocation": "Add New Location",
          "orderConfirm": "Order Confirm",
          "locationServicesAreDisabled": "Location services are disabled.",
          "locationPermissionsAreDenied": "Location permissions are denied",
          "locationPermissionsDenied":
              "Location permissions are permanently denied, we cannot request permissions.",
          "addLocationName": "Add Location Name",
          "locationName": "Location Name",
          "add": "Add",
          "information": "Information",
          "dataHasUpdated": "Data Has Updated",
          "deleteLocation": "Are you sure to delete the Location?",
          "deliveryTo": "Delivery to...",
          "points": "My Points",
          "Home": "Home",
          "Search": "Search",
          "Restorant": "Restorant",
          "Store": "Store",
          "Order": "Order",
          "fullName": "Full name",
          "notEmpty": "This value is not empty",
          "mobail": "Mobile number",
          "shortMobail": "Mobail number is short",
          "sex": "Sex",
          "man": "Man",
          "wman": "Wman",
          "emailIsUsed": "Email is used",
          "restorantName": "Restorant name",
          "shopRestorant": "Restorant,Shop,Item...",
          "editProfile": "Edit my profile",
          "myLocation": "My location",
          "settings": "Settings",
          "conectUs": "Conect us",
          "addOrderInMap": "Add order in map",
          "deliveryCost": "Delivery cost to the specified location",
          "shopName": "Shop name",
          "itemName": "Item name",
          "number": "Number",
          "price": "Price",
          "total": "Total price",
          "deliveryPrice": "Delivery Price",
          "date": "Date:",
          "createTime": "Create Time:",
          "confirmTime": "Confirm Time:",
          "acceptanceTime": "Acceptance time:",
          "delivryTime": "Delivry Time:",
          "notSet": "Not set:",
          "pinCode": "Pin code:",
          "addBasket": "Add order to basket",
          "addOrderSuccessfully":
              "The order was added successfully\nNote: The order must be installed after completing the My Orders page. Click on the order to confirm",
          "addToBasket": "Add to basket",
          "bay": "Bay",
          "evaluation": "Evaluation",
          "save": "Save",
          "lang": "عربي",
          "notesOrder":
              "Please enter an accurate description of the order, address, weight and mobile number",
        },
        //
        // Arabic
        //
        'ar': {
          //defualt for auth don't edit the key...
          'font': 'ArefRuqaa',
          'witting': '...الرجاء الإنتظار',
          'registerScreen': 'إنشاء حساب جديد',
          'registerForFree': '!إنشاء حساب جديد مجاناً',
          'emailAdrees': 'البريد الإلكتروني',
          'oldPassword': 'كلمة السر القديمة',
          'newPassword': 'كلمة السر الجديدة',
          'confirmNewPassword': 'تأكيد كلمة السر',
          'canselTheProcess': 'إلغاء العملية',
          'changePassword': 'تغيير كلمة السر',
          'allRieghtReserved': 'جميع الحقوق محفوظة',
          'forgetPassword': 'نسيت كلمة المرور',
          'loginScreen': 'تسجيل الدخول',
          'restPassword': 'إعادة تعيين كلمة المرور',
          'password': 'كلمة السر',
          'youDoNotHaveAnAccont': 'لا تملك حساب؟',
          'login': 'تسجيل الدخول',
          'confirmPassword': 'تأكيد كلمة المرور',
          'youHaveAccont': 'هل تملك حساب؟',
          'goToLoginScreen': 'العودة إلى صفحة تسجيل الدخول',
          'register': 'إنشاء حساب',
          'loginToContunie': 'سجل دخول للمتابعة',
          'plaseInsertEmailAdress': 'الرجاء إدخال بريد الكتروني صالح',
          'plaseInsertPassword': 'الرجاء ادخال كلمة السر',
          'palseInsert6LaterAtLess':
              'الرجاء ادخال كلمة مرور تحوي 6 محارف على الأقل',
          'passwordIsNotMatch': 'كلمة المررو غير مطابقة',
          'hiddPassword': 'إظهار كلمة السر',
          'changeLang': 'تغيير اللغة',
          'logout': 'تسجيل الخروج',
          'homeScreen': 'الصفحة الرئيسية',
          'search': 'بحث',
          'region': 'إختر المحافظة',
          'type': 'إختر الصنف',
          "editePasswordSccuss": "تم تعديل كلمة المرور بنجاح",
          "currectEmail": "الرجاء ادخال ايميل صحيح",
          "wrongEmailAngPassword": "البريد الالكتروني او كلمة السر خاطئة",
          //defualt for auth don't edit the key...
          "ok": "موافق",
          "notes": "ملاحظات",
          "successfullyConfirmTheOrder": "تم تأكيد الطلبية بنجاح",
          "warning": "تحذير",
          "somethingWentWrongPleaseContactUs":
              "حدث شيئ ما خاطئ الرجاء الاتصال بنا",
          "areYouSureToInstallTheOrder":
              "هل أنت متأكد من تثبيت الطلبية؟\nملاحظة: بعد تثبيت الطلبية لا يمكن تعديل الطلبية او حذفها.",
          "cancel": "إلغاء",
          "deleteOrder": "تم حذف الطلبية بنجاح",
          "delete": "حذف",
          "deleteOrder?": "هل أنت متأكد من حذف هذه الطلبية؟",
          "placeToReceive": "الرجاء تحديد مكان التوصيل لإضافة الطلبية.",
          "confirmation": "تأكيد",
          "selectLocation": "الرجاء تحديد الموقع",
          "addLocation": "إضافة موقع إلى المفضلة",
          "addNewLocation": "إضافة موقع جديد",
          "orderConfirm": "تأكيد الطلبية",
          "locationServicesAreDisabled": "خدمة الموقع متوقفة",
          "locationPermissionsAreDenied": "أذونات المواقع مرفوضة",
          "locationPermissionsDenied":
              "أذونات الموقع مرفوضة نهائيا. لا يمكن طلب إذن",
          "addLocationName": "إضافة اسم الموقع",
          "locationName": "اسم الموقع",
          "add": "إضافة",
          "information": "معلومات",
          "dataHasUpdated": "تم تعديل البيانات بنجاح",
          "deleteLocation": "هل أنت متأكد من حذف الموقع؟",
          "deliveryTo": "التوصيل إلى...",
          "points": "نقاطي",
          "Home": "الرئيسية",
          "Search": "البحث",
          "Restorant": "مطاعم",
          "Store": "متاجر",
          "Order": "طلباتي",
          "fullName": "الاسم الكامل",
          "notEmpty": "لا يمكن ترك هذه القيمة فارغة",
          "mobail": "رقم الجوال",
          "shortMobail": "Mobail number is short",
          "sex": "الجنس",
          "man": "رجل",
          "wman": "امرأة",
          "emailIsUsed": "البريد الالكتروني مستخدم مسبقاً",
          "restorantName": "اسم المطعم",
          "shopRestorant": 'مطعم, متجر, صنف...',
          "editProfile": "تعديل المعلومات الشخصية",
          "myLocation": "عناويني",
          "settings": "الإعدادات",
          "conectUs": "تواصل معنا",
          "addOrderInMap": ' إضافة طلب توصيل عن طريق الخريطة',
          "deliveryCost": "تكلفة التوصيل الى الموقع المحدد",
          "shopName": "اسم المحل",
          "itemName": "اسم المادة",
          "number": "العدد",
          "price": "السعر",
          "total": "اجمالي الفاتورة",
          "deliveryPrice": "إجور التوصيل",
          "date": ":التاريخ",
          "createTime": ":وقت الانشاء",
          "confirmTime": ":وقت التثبيت",
          "acceptanceTime": ":وقت القبول",
          "delivryTime": ":وقت التسليم",
          "notSet": "غير محدد",
          "pinCode": ":الكود",
          "addBasket": "إضافة طلب شراء",
          "addOrderSuccessfully":
              "تمت اضافة الطلبية بنجاح\nملاحظة: يجب تثبيت الطلبية بعد الانتهاء من صفحة طلباتي انقر على الطلبية للتاكيد",
          "addToBasket": "إضافة طلب الى السلة",
          "bay": "شراء",
          "evaluation": "التقييم",
          "save": "حفظ",
          "lang": "English",
          "notesOrder":
              "الرجاء ادخال وصف دقيق للطلبية,العنوان,الوزن ورقم الجوال"
        },
      };
}