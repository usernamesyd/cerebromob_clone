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


class PersonalInfoPages extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
 height: MediaQuery.of(context).size.height,
 child: PageView(
      
        children: [
            PersonalInfo(),
            PersonalInfo2(),
        ],
 ),
    );
   
   
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
     
     Widget _buildColumn1() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormField("Gender ", required: true),
          CerebroInputFormField(
            controller: TextEditingController(),
            text: 'Gender',
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
            _buildFormField("with Special Education Needs? ", required: true),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: 'No'),
                
    
            _buildFormField("Classification (if SPED)"),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: 'First Name'),
            
            _buildFormField("Learner Reference Number (LRN)"),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: "Learner Reference Number (LRN)"),

            _buildFormField("Student Type ", required: true),
                CerebroInputFormField(
                controller: TextEditingController(), 
                text: 'First Name'), 
            
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

class YesNoDropdown extends StatefulWidget{
  @override
    YesNoDropdownState createState() =>  YesNoDropdownState();
    }


class YesNoDropdownState extends State<YesNoDropdown> {
  String dropdownValue = 'No';
  bool isOpen = false; // Track dropdown open/closed state

  var items = [
      'No',
      'Yes'
    ];

  void toggleOverlay() {
    setState(() {
      isOpen = !isOpen;
    });
  }
  @override
    Widget build(BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
                color: cerebroGreyborder,
                width: 1.0,
                style: BorderStyle.solid,
            
            ),
          color: cerebroGreyinput,
        ),
        
     child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),

            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                    Itemdropdownbutton(
                        items: items,
                        value: dropdownValue,
                        onChanged: (String? value) {
                        setState(() {
                            dropdownValue = value!;
                        });
                        },
                    ),
                ]
            )
            
     ),
      );
      
    
  }
  }
