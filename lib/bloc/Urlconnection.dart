class UrlCollection{
   static String baseApi="http://wedding.websquareit.com/index.php/welcome/";

   static String login_url=baseApi+"login";

   static String reg_url=baseApi+"regis";
   static String add_user_url=baseApi+"user_regis";

   static String login(String email, String password) {
      return baseApi + 'login?email=' + email + '&password=' + password;
   }
}


