extension StringValidatorExtension on String?{
  String? validateEmptyField(){
    if(this == null || this!.isEmpty){
      return 'Please fill the empty field.';

    }
     return null;
  }
}