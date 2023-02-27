import 'package:dufuna/core/util/extension.dart';
import 'package:dufuna/provider/property_provider.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../property/property_form.dart';
import 'filter.dart';

class OliveHome extends StatelessWidget {
  const OliveHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olive Home'),
        actions: [
          IconButton(
            onPressed: () => context.push(const FilterPage()),
            icon: Icon(
              PhosphorIcons.funnel,
              color: AppColors.kDark,
            ),
          ),
          IconButton(
            onPressed: () => context.push(DetailForm()),
            icon: Icon(
              PhosphorIcons.funnel,
              color: AppColors.kDark,
            ),
          )
        ],
      ),
      body: Consumer<OliveProvider>(
        builder: (context, oliveProvider, child) {
          oliveProvider.getProperties();
          if (oliveProvider.properties.length == 0) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: oliveProvider.properties.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        width: 200,
                        child: Text(
                          oliveProvider.properties[index].areaUnit!,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
