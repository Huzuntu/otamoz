import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerHomepageCuisines extends StatelessWidget {
  final List<String> category;

  CustomerHomepageCuisines({required this.category});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Divider()),
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              Center(child: Text("Discover Cuisines", style: TextStyle(color: Colors.grey[500]!),)),
              SizedBox(
                width: ScreenUtil().setWidth(10),
              ),
              Expanded(child: Divider()),
            ],
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Container(
          height: ScreenUtil().setHeight(180),
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            children: List.generate(8, (index) => Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(50),
                  child: Image.asset("assets/images/cuisines/cuisine${index + 1}.jpg", fit: BoxFit.fill),
                ),
                Text("${category[index]}")
              ],
            )),
          ),
        ),
      ],
    );
  }
}
