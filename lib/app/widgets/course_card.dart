import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Card(
        elevation: 10,
        child: SizedBox(
            height: 250.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  child: SizedBox(
                    width: 50,
                    child: Image.network(
                        "https://cdn-icons-png.flaticon.com/512/1384/1384879.png"),
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "4-Year Bachelor's Degree",
                            style: GoogleFonts.openSans(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "On-Campus",
                                style: Theme.of(context).textTheme.labelSmall
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 10.h),
                      child: Text(
                        "Bachelor of Science - Data Science and Analytics - Data Scince in Engineering",
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 6),
                      child: Text(
                        "Florida Atlantic University",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Text(
                            "Florida Atlantic University",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 6, right: 4, left: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Tution",style: Theme.of(context).textTheme.bodyMedium,),
                              Text("900000 USD",style: Theme.of(context).textTheme.labelMedium)
                            ],
                          ),
                          Column(
                            children: const [
                              Text("Applicatino Fees"),
                              Text("30000 USD")
                            ],
                          ),
                          const Icon(
                            Icons.bookmark_outline_outlined,
                            size: 36,
                          )
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            )),
      ),
    );
  }
}
