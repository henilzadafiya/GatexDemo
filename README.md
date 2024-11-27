-> theme change
body: Column(
children: [
Card(
child: ListTile(
title: Text("getx dialog "),
subtitle: Text("alert dialog"),
onTap: () {
Get.defaultDialog(
title: 'delete chat',
titlePadding: EdgeInsets.only(top: 20),
contentPadding: EdgeInsets.all(20),
middleText: 'are you sore delete',
confirm: TextButton(
onPressed: () {
Navigator.pop(context);
},
child: Text("Yes")),
cancel: TextButton(
onPressed: () {
Get.back();
},
child: Text('NO')));
},
),
),
Card(
child: ListTile(
title: Text("getx bottom sheet "),
subtitle: Text("alert dialog"),
onTap: () {
Get.bottomSheet(Container(
decoration: BoxDecoration(color: Colors.red),
child: Column(
children: [
ListTile(
leading: Icon(Icons.light_mode),
title: Text('Light theme'),
onTap: () {
Get.changeTheme(ThemeData.light());
},
),
ListTile(
leading: Icon(Icons.dark_mode),
title: Text('dark theme'),
onTap: () {
Get.changeTheme(ThemeData.dark());

                        },
                      ),
                    ],
                  ),
                ));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar('henil', 'Zadafiya',
              backgroundColor: Colors.lightGreenAccent,
              snackPosition: SnackPosition.TOP);
        },
      ),
----------------------------------------------------------------------------------------------------
Getx Get Height & Width 


Column(
children: [
Container(
color: Colors.red,
height: Get.height * .2,
width: Get.width *.8,
child: Center(
child: Text("Center"),
),
),
Container(
color: Colors.blue,
height: Get.height * .1,
width: Get.width *.8,
child: Center(
child: Text("Center"),
),
),
],
)

-----------------------------------------------------------------------------------------------------
localization in app

Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
ListTile(
title: Text('message'.tr),
subtitle: Text('name'.tr),
),
SizedBox(
height: 50,
),
Row(
children: [
OutlinedButton(
onPressed: () {
Get.updateLocale(Locale('en', 'US'));
},
child: Text("English")),
SizedBox(width: 20,),
OutlinedButton(onPressed: () {
Get.updateLocale(Locale('ur','PK'));
}, child: Text("Urdu")),
],
)
],
),

-------------------------------------------------------------------------------------------------------
slider in gatex opacity

final ExampleTwoController controller = Get.put(ExampleTwoController());

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Get tutarioal')),
body: Column(
children: [
Obx(
() => Container(
width: 200,
height: 200,
color: Colors.red.withOpacity(controller.opacity.value),
),
),
Obx(
() => Slider(
value: controller.opacity.value,
onChanged: (value) {
controller.setOpacity(value);
},
),
),
],
),
);
}

-----------------------------------------------------------------------------------------------------------
switch button

ExampleThreeController controller = Get.put(ExampleThreeController());

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Get tutarioal')),
body: Column(
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween ,
children: [
Text("Notification"),
Obx(() => Switch(
value: controller.notification.value,
onChanged: (value) {
controller.SetNotification(value);
},
) ,)

            ],
          )
        ],
      ),
    );
}
------------------------------------------------------------------------------------------------------
favourite and unfavorite in getx

FavriteController controller = Get.put(FavriteController());

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Get tutarioal')),
body: ListView.builder(
itemCount: controller.fruitList.length,
itemBuilder: (context, index) {
return Card(
child: ListTile(
onTap: () {
if (controller.tempList.contains(controller.fruitList[index].toString())) {
// tempList.remove(fruitList[index]);
controller.removeToFavrite(controller.fruitList[index].toString());
} else {
// tempList.add(fruitList[index].toString());
controller.addToFavrite(controller.fruitList[index].toString());
}
},
title: Text(controller.fruitList[index]),
trailing: Obx(() => Icon(
Icons.favorite,
color: controller.tempList.contains(controller.fruitList[index].toString())
? Colors.red
: Colors.white,
),)
),
);
},
),
);
}

-------------------------------------------------------------------------------------------------------
image pick in gatex

ImagePickerController controller = Get.put(ImagePickerController());

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Get tutarioal')),
body: Obx(
() {
return Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
CircleAvatar(
radius: 40,
backgroundImage: controller.imagePath.isNotEmpty
? FileImage(File(controller.imagePath.toString()))
: null,
),
TextButton(onPressed: () {
controller.getImage();
}, child: Text("Image"))
],
);
},
),
);
}

--------------------------------------------------------------------------------------------------------
api post get put delete login getx


LoginController controller = Get.put(LoginController());

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('Get tutarioal')),
body: Padding(
padding: const EdgeInsets.all(8.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
TextFormField(
controller: controller.emailControlller.value,
decoration: InputDecoration(hintText: 'Email'),
),
TextFormField(
controller: controller.passwordControlller.value,
decoration: InputDecoration(hintText: 'Password'),
),
SizedBox(
height: 50,
),
Obx(() {
return InkWell(
onTap: () => controller.loginApi(),
child: controller.loading.value ? CircularProgressIndicator() :Container(
height: 45,
color: Colors.grey,
child: Center(
child: Text("Login"),
),
),
);
},)
],
),
),
);
}

-----------------------------------------------------------------------------------------------------
