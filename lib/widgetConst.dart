import 'package:url_launcher/url_launcher.dart';

 calling ()async{
  const url='tel:+963943517166';
  if(await canLaunch(url) )
  {
    await launch(url);
  }else
  {
    throw 'could not launch $url';
  }
}
messege ()async{
  const url='sms:+963943517166';
  if(await canLaunch(url) )
  {
    await launch(url);
  }else
  {
    throw 'could not launch $url';
  }
}