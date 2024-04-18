import 'package:cerebro_mobile/atoms/cerebro_date_picker.dart';
import 'package:cerebro_mobile/atoms/cerebro_textform_field.dart';
import 'package:cerebro_mobile/atoms/cerebro_dropdown_btn.dart';
import 'package:cerebro_mobile/atoms/cerebro_elevated_btn.dart';
import 'package:cerebro_mobile/atoms/teacher_navdrawer.dart';
import 'package:cerebro_mobile/organisms/teacher_appbar.dart';
import 'package:cerebro_mobile/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeacherEditProfile extends StatefulWidget {
  @override
  TeacherEditProfileState createState() => TeacherEditProfileState();
}
class TeacherEditProfileState extends State<TeacherEditProfile> {
    String dropdownValue = 'Personal Information';
    var items = ['Personal Information',  'Educational Background', 'License Information'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TeacherNavigationDrawer(),
      appBar: TeacherAppBar(title: 'ABC School of Cavite'),
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
            if (dropdownValue == 'Educational Background')
              EducationalBackground(),
            if (dropdownValue == 'License Information')
              LicenseInformation()
            ],
        ),
      ),
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
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
  late TextEditingController _registrationDateController = TextEditingController();

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
     
     Widget _buildColumn1() {
    return Column(
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
          _buildFormField("Religion "),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Religion',
          ),
        ],
    );
  }

  Widget _buildColumn2() {
      return Column(
        children: [
          _buildFormField("Date of Birth ", required: true),
          CerebroDateInputFormField(
            hintText: 'Date of Birth', 
          controller: _registrationDateController,
          allowFutureDates: false,
          allowPastDates: true,
          ),
          _buildFormField("Place of Birth ", required: true),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Place of Birth',
          ),
          _buildFormField("Nationality "),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Expanded(     
                            child: _buildColumn1(),
                            ),
                            SizedBox(width: 20.0,), 
                        Expanded(
                            child: _buildColumn2(),
                            ),
                      ],
                  ),
                 SizedBox(height: 2.0), // Add some vertical spacing
                    _buildaftercolumn(),
                  
                ],
                   
           ),    
        ),
        );
   
  }
    }

class EducationalBackground extends StatelessWidget{
    Widget _buildFormField(String labelText, {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
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
            _buildFormField("Degree", required: true),
             GeneralDropdown(
            items: ['Yes', 'No'],
            initialValue: 'No',
            onChanged: (value) {
              print('Selected value: $value');
            },
          ),
                
    
            _buildFormField("Major"),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: 'Major'),
            
            _buildFormField("Minor"),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: "Minor"),
            
            _buildFormField("School Attended"),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: "St. Paul College"),  

            _buildFormField("Year Attended"),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: "2020"),  
           ],
        ),
        );
  }
  }



class LicenseInformation extends StatefulWidget {
  @override
  _LicenseInformationState createState() => _LicenseInformationState();
}

class _LicenseInformationState extends State<LicenseInformation> {
  Widget _buildFormField(String labelText, {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
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
   late TextEditingController _registrationDateController;
   late TextEditingController _expirationDateController;
  
  @override
  void initState() {
    super.initState();
   _expirationDateController = TextEditingController();
   _registrationDateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
         _buildFormField("License Number", required: true),
            CerebroInputFormField(
              controller: TextEditingController(), 
              text: 'License Number'),
        _buildFormField("Date of Registration", required: true),
          CerebroDateInputFormField(
            controller: _registrationDateController,
            hintText: 'Date of Registration',
            allowPastDates: true, // Allow past dates
            allowFutureDates: false, // Disallow future dates
          ),
        _buildFormField("Date of Expiration", required: true),
          CerebroDateInputFormField(
              controller: _expirationDateController,
              hintText: 'Date of Expiration',
              allowPastDates: false, // Disallow past dates
              allowFutureDates: true, // Allow future dates
            ),
         _buildFormField("Upload License", required: true),    
            Container(
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width, 
              decoration: BoxDecoration(
                border: Border.all(
                  color: cerebroBlue300, 
                  width: 1.5, 
                ),
                borderRadius: BorderRadius.circular(5), 
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 30.0)),
                      CerebroOutlinedBtn(
                        onPressed: () {},
                        text: 'File Upload',
                      ),
                      SizedBox(width: 20),
                      Text(
                        'No file selected',
                        style: TextStyle(
                          fontSize: 14,
                          color: cerebroGreyborder,
                          ),
                      ),
                      
                      
                    ],
                  ),
                ],
                
              ),
              
            ),
         Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CerebroElevatedBtn(
                      onPressed: () => {},
                      text: 'Update Profile',
                    ),
                    ],
                  ),
                ),          
      ],
    );
  }

}
