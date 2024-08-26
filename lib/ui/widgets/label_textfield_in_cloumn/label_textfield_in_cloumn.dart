import 'package:flutter/material.dart';
import 'package:zeitnah_admin/ui/constants/app_colors/app_colors.dart';

Widget labeltextFieldColumn(
    {required String label,
    required TextEditingController controller,
    IconData? trailigIcon,
    VoidCallback? onTap,
    String? hintText}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: AppColors.kcPrimaryTextColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.kcgreyFieldColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.kcSecondaryTextColor,
                            fontWeight: FontWeight.normal,),
                            
                            ),
                      
                            
                  ),
                ),
                SizedBox(child: trailigIcon == null ? null : Icon(trailigIcon, color: AppColors.kcPrimaryTextColor,),) ,
              ],
            ),
          ),
        )
      ],
    ),
  );
}
