import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    Key? key,
    required this.title,
    this.children = const <Widget>[],
    this.trailingGridView,
  }) : super(key: key);

  final Widget title;
  final List<Widget> children;
  final List<Widget>? trailingGridView;

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.w),
      child: Padding(
        padding: EdgeInsets.all(12.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.title,
                  Spacer(),
                  if (widget.trailingGridView != null)
                    Expanded(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0.w,
                          mainAxisSpacing: 2.0,
                        ),
                        itemCount: widget.trailingGridView!.length,
                        itemBuilder: (context, index) {
                          return widget.trailingGridView![index];
                        },
                      ),
                    ),
                ],
              ),
            ),
            if (_isExpanded)
              Divider(
                color: Colors.grey.shade400,
              ),
            if (_isExpanded)
              Column(
                children: [
                  ...widget.children,
                ],
              ),
          ],
        ),
      ),
    );
  }
}
