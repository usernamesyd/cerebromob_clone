import 'package:cerebro_mobile/atoms/cerebro_textform_field.dart';
import 'package:cerebro_mobile/atoms/cerebro_dropdown_btn.dart';
import 'package:cerebro_mobile/atoms/navigation_drawer.dart';
import 'package:cerebro_mobile/organisms/cerebro_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditProfile extends StatefulWidget {
  @override
  EditProfileState createState() => EditProfileState();
}
class EditProfileState extends State<EditProfile> {
    String dropdownValue = 'Personal Information';
    var items = ['Personal Information', 'Family Background', 'Educational Background'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CerebroNavigationDrawer(),
      appBar: CerebroAppBar(title: 'ABC School of Cavite'),
      body:SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: DropdownButtonHideUnderline(
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                CerebroDropdown( 
                    items: items,
                    value: dropdownValue,
                    onChanged: (String? value) {
                    setState(() {
                        dropdownValue = value!;
                    });
                    },),
                    Padding(padding:const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0)),
    
            if (dropdownValue == 'Personal Information')
               PersonalInfoPages(),         
            if (dropdownValue == 'Family Background')
              Familybackground(),
            if (dropdownValue == 'Educational Background')
              EducationalBackground(),
            ],
        ),
      ),
      ),
    );
  }
}

// Combine PersonalInfo and PersonalInfo2 for Personal Information
class PersonalInfoPages extends StatefulWidget {
  @override
  PersonalInfoPagesState createState() => PersonalInfoPagesState();
}

class PersonalInfoPagesState extends State<PersonalInfoPages> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height, // Adjust height as needed
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              PersonalInfo(),
              PersonalInfo2(),
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 0,
            right: 0,
            child: _buildProgressBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 2; i++)
          _buildDot(
            isCurrentPage: i == _currentPage,
          ),
      ],
    );
  }

  Widget _buildDot({required bool isCurrentPage}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      width: isCurrentPage ? 100.0 : 100.0,
      height:  5.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? cerebroBlue200 : Colors.grey,
        borderRadius: BorderRadius.circular(6.0), 
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}


class PersonalInfo extends StatelessWidget{
Widget _buildFormField(String labelText, {bool required = false}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
      child: Row(
     children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        if (required)
          Text(
            '*',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
      ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
   
    return SingleChildScrollView(
        child: Container(
        child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             
             _buildFormField('Name ', required: true),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'First Name'),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'Middle Name'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Last Name'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Extension Name (Optional)'),
        
             _buildFormField('Residential Address ', required: true),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Street Address'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Barangay'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Zipcode'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'City'),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'State/Province'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Country'),
        
        
        ],
          ),
          ),
          
      );
  }

}
class PersonalInfo2 extends StatelessWidget{
     Widget _buildFormField(String labelText, {bool required = false}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
      child: Row(
     children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        if (required)
          Text(
            '*',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
      ],
      )
    );
  }
     
     Widget _buildColumn1() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormField("Gender ", required: true),
          GeneralDropdown(
            items: ['Female', 'Male','Prefer not to say'],
            initialValue: 'Female',
            onChanged: (value) {
              print('Selected value: $value');
            },
          ), 
          _buildFormField("Age " , required: true),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Age',
          ),
          _buildFormField("Religion ", required: true),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Religion',
          ),
        ],
    );
  }

  Widget _buildColumn2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormField("Date of Birth ", required: true),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Date of Birth',
          ),
          _buildFormField("Place of Birth ", required: true),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Place of Birth',
          ),
          _buildFormField("Nationality ", required: true),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Nationality',
          ),
        ],
      );
    
  }

  Widget _buildaftercolumn() {
    
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormField("Country of Citizenship"),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Country of Citizenship',
          ),
          _buildFormField("Mother Tongue"),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Mother Tongue',
          ),
          _buildFormField("Indigenous People"),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Indigenous People',
          ),
           _buildFormField("Dropdown"),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Philippines',
          ),
        ],
     );
  }


  
 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Container (
      margin: EdgeInsets.all(10.0),
           width: MediaQuery.of(context).size.width,
           child: Column(
            
        children: [
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Expanded(
                            child: _buildColumn1(),
                            ),
                            SizedBox(width: 20.0), 
                           Expanded(
                            child: _buildColumn2(),
                            ),
                      ],
                  ),
                 SizedBox(height: 10.0), // Add some vertical spacing
                    _buildaftercolumn(),
                  
                ],
                   
           ),    
        ),
        );
   
  }
    }


class Familybackground extends StatelessWidget{
 Widget _buildFormField(String labelText, {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 10.0, 10.0),
      child: Row(
     children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        if (required)
          Text(
            '*',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
      ],
      )
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Form(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
         _buildFormField("Father's Name ", required: true),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'First Name'),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'Middle Name'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Last Name'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Extension Name (Optional)'),
        
        _buildFormField("Mother's Name ", required: true),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'First Name'),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'Middle Name'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Last Name'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Extension Name (Optional)'),
        
        _buildFormField("Guardian's Name ", required: true),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'First Name'),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'Middle Name'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Last Name'),
            CerebroInputFormField(
              controller: TextEditingController(),
              text: 'Extension Name (Optional)'),
    
      ],
    ),
    );
  }

}

class EducationalBackground extends StatelessWidget{
    Widget _buildFormField(String labelText, {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      child: Row(
     children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        if (required)
          Text(
            '*',
            style: TextStyle(
              color: Colors.red,
            ),
          ),
      ],
      )
    );
    }   


  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            _buildFormField("with Special Education Needs? ", required: true),
            GeneralDropdown(
            items: ['Yes', 'No'],
            initialValue: 'No',
            onChanged: (value) {
              print('Selected value: $value');
            },
          ), 
                
    
            _buildFormField("Classification (if SPED)"),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: 'First Name'),
            
            _buildFormField("Learner Reference Number (LRN)"),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: "Learner Reference Number (LRN)"),

            _buildFormField("Student Type ", required: true),
            GeneralDropdown(
            items: ['Old', 'New'],
            initialValue: 'Old',
            onChanged: (value) {
              print('Selected value: $value');
            },
          ), 
            
            _buildFormField("Year/Grade Level ", required: true),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: 'Year/Grade Level'),
            
            _buildFormField("Last School Attended"),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: "St. Paul College"),  

            _buildFormField("Address of Last School Attended "),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: "Address of Last School Attended"),  
           ],
        ),
        );
  }
  }
