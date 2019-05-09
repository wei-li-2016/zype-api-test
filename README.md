# Zype API application

## Things needed to run the application:

* **Ruby version** : ruby 2.5.1p57
* **Rails version** : ruby 2.5.1p57
* **Database**: MySql
* **Database creation**
```bash
$ Rails db:create
```
* **Run the application**
```bash
$ rails s
```
* **Environment variables**  
To run the app '.env' file is required at root directory of app for credentials. Create '.env' file with below variables.
```bash
ZYPE_APP_KEY = ''
ZYPE_CLIENT_ID = ''
ZYPE_CLIENT_SECRET =''
```

## High level architecture overview

* When user hits the root url 'localhost:3000' the request will go to the HomeController index action.

* 'index' action will fetch all videos from Zype API and render index.html to user.

* All the API calls to Zype are maintained as Class methods in ZypeClient class in 'lib' directory.

* When clicks on any video then it goes to 'watch_video' method and call the 'single_video' method from ZypeClass. If the response containes 'subscription_required' true then user will see the login form and subscription button and if the 'subscription_required' false then user will see the video.

* If the video is a subscription video then user must have to login. The 'authenticate_user' action of HomeController is responsible to login the user. Application will communitcate with Zype API using 'oauth' class method in ZypeClient class. The API call response contains the access token and access_token will stored in current session.

* The navigation bar has a button 'Logout', If user clicks the 'logiut' button then the user will logout from the application and the access_token from session will be removed.
