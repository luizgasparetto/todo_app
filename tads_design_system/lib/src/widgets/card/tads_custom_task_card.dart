import 'package:flutter/material.dart';
import 'package:tads_design_system/src/common/common.dart';

class TADSCustomTaskCard extends StatefulWidget {
  final String taskTitle;
  final DateTime taskDeadline;
  final bool taskStatus;
  final void Function()? onTap;

  const TADSCustomTaskCard({
    Key? key,
    required this.taskTitle,
    required this.taskDeadline,
    required this.taskStatus,
    this.onTap,
  }) : super(key: key);

  @override
  State<TADSCustomTaskCard> createState() => _TADSCustomTaskCardState();
}

class _TADSCustomTaskCardState extends State<TADSCustomTaskCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    isSelected = widget.taskStatus;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: ExpansionTile(
          collapsedBackgroundColor: CustomColors.backgroundSelected,
          leading: Transform.scale(
            scale: 1.3,
            child: Checkbox(
              value: widget.taskStatus,
              onChanged: (value) {
                setState(() {
                  isSelected = value!;
                });
                widget.onTap?.call();
              },
              checkColor: Theme.of(context).backgroundColor,
              activeColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          title: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            style: TextStyle(
              color: widget.taskStatus ? Colors.grey.shade400 : Colors.white,
              fontSize: 18,
              decoration: widget.taskStatus ? TextDecoration.lineThrough : null,
            ),
            child: Text(
              widget.taskTitle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 10, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 20,
                        color: Colors.green.withOpacity(0.5),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        CustomTime.ajustDateTime(widget.taskDeadline),
                        style: TextStyle(
                          color: CustomColors.secondaryTextColor,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    CustomTime.ajustTime(TimeOfDay.fromDateTime(widget.taskDeadline)),
                    style: TextStyle(
                      color: CustomColors.secondaryTextColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
