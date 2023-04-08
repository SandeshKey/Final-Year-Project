import 'package:olivehomes/config/constants.dart';
import 'package:olivehomes/config/theme.dart';
import 'package:olivehomes/core/model/property_filter.dart';
import 'package:olivehomes/core/util/extension.dart';
import 'package:olivehomes/core/widget/back_button.dart';
import 'package:olivehomes/core/widget/button.dart';
import 'package:olivehomes/core/widget/custom_selection_fields.dart';
import 'package:olivehomes/core/widget/gap.dart';
import 'package:olivehomes/presentation/provider/property_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late PropertyFilter _propertyFilter;

  @override
  void initState() {
    _propertyFilter = context.read<PropertyProvider>().propertyFilter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final propProvider = context.watch<PropertyProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
          style: context.textTheme.subtitle1!.copyWith(
            color: AppColors.kDark,
          ),
        ),
        leading: const Padding(
          padding: EdgeInsets.fromLTRB(Insets.md, 10, 2, 10),
          child: Backbtn(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap.lg,
            InputSelectionField<int>('Number Of Sittingroom',
                items: numOfSittingrooms,
                groupValue: _propertyFilter.sittingRoom, onChanged: (value) {
              setState(() {
                _propertyFilter = _propertyFilter.copyWith(sittingRoom: value);
              });
            }),
            Gap.md,
            InputSelectionField<int>('Number Of Bedroom',
                items: numOfBedrooms,
                groupValue: _propertyFilter.bedroom, onChanged: (value) {
              setState(() {
                _propertyFilter = _propertyFilter.copyWith(bedroom: value);
              });
            }),
            Gap.md,
            InputSelectionField<int>('Number Of Bathroom',
                items: numOfBathrooms,
                groupValue: _propertyFilter.bathroom, onChanged: (value) {
              setState(() {
                _propertyFilter = _propertyFilter.copyWith(bathroom: value);
              });
            }),
            Gap.md,
            InputSelectionField<int>('Number Of Toilet',
                items: numOfToilets,
                groupValue: _propertyFilter.toilet, onChanged: (value) {
              setState(() {
                _propertyFilter = _propertyFilter.copyWith(toilet: value);
              });
            }),
            Gap.md,
            InputSelectionField<int>('Number Of Kitchen',
                items: numOfKitchens,
                groupValue: _propertyFilter.kitchen, onChanged: (value) {
              setState(() {
                _propertyFilter = _propertyFilter.copyWith(kitchen: value);
              });
            }),
            Gap.lg,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Insets.md),
              child: Button(
                'APPLY FILTER',
                onTap: () {
                  propProvider.applyFilter(_propertyFilter);
                  context.pop();
                },
              ),
            ),
            Gap.md,
            Center(
              child: const Text('RESET').onTap(() {
                setState(() {
                  _propertyFilter = PropertyFilter();
                  propProvider.applyFilter(_propertyFilter);
                });
              }),
            ),
            const Gap(70)
          ],
        ),
      ),
    );
  }
}
