import 'package:flutter/material.dart';
import 'package:pokemon_app/widget/PowerBadge.dart';
import 'package:pokemon_app/widget/my_title.dart';

import '../widget/feature_title_text.dart';
import '../widget/feature_value_text.dart';

class DetailsPage extends StatelessWidget {
  final Map? data;
  const DetailsPage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff49d0b1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Mytitle(
                              text: "${data!["name"]}", color: Colors.white),
                        ),
                        Row(
                          children: [
                            // First way
                            // powerBadge(text: "${data!["type"]}"),

                            // Second way
                            for (String item in data!["type"])
                              powerBadge(text: item)

                            // Third way    => thle children er third bracket thkbe na. Se nije e ekta list.
                            // data!["type"]
                            //     .map<Widget>(
                            //         (item) => powerBadge(text: item))
                            //     .toList()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.only(top: 40.0),
                            height: double.infinity,
                            child: Column(
                              children: const [
                                FeatureTitleText(text: "Height"),
                                FeatureTitleText(text: "Candy"),
                                FeatureTitleText(text: "Egg"),
                                FeatureTitleText(text: "Spawn Chance"),
                                FeatureTitleText(text: "Avg Spawns"),
                                FeatureTitleText(text: "Spawn Time"),
                                FeatureTitleText(text: "Multipliers"),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            padding: const EdgeInsets.only(top: 40.0),
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FeatureValueText(text: "${data!["height"]}"),
                                FeatureValueText(text: "${data!["candy"]}"),
                                FeatureValueText(
                                    text: "${data!["candy_count"]}"),
                                FeatureValueText(text: "${data!["egg"]}"),
                                FeatureValueText(
                                    text: "${data!["avg_spawns"]}"),
                                FeatureValueText(
                                    text: "${data!["spawn_time"]}"),
                                FeatureValueText(
                                    text: "${data!["multipliers"]}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 100.0,
              child: SizedBox(
                width: 220.0,
                height: 220.0,
                child: Hero(
                  tag: data!["num"],
                  child: Image.network(
                    "${data!["img"]}",
                    // height: 250.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
