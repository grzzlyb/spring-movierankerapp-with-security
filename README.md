# Spring MVC Movie Ranker App With Security

Prior to the web app that was published earlier, this is a further version of the app that has been enhanced with security features including login/logout support using Spring Security.

The link to the previous version can be found here:
https://github.com/grzzlyb/spring-mvc-movierankerapp

## Features
* Added beans to pipeline the configuration
* Spring Security dependencies added via Maven 
* Added login authentication with Error handling 
* Login credentials retrieved from database 
* Logout support 
* Passwords are encrypted using Bcrpyt encryption method
* Created custom filter in the `SecurityFilterChain`
* Given restriction based on user roles (USER/ ADMIN) 
* ADMIN is authorized to `ADD`, `UPDATE` and `DELETE` records
* USER is restricted to all of the above

## Screenshots

| ![admin_login](https://user-images.githubusercontent.com/123747958/222973056-0770b314-4914-41b6-a50e-012fa5bbf951.png) |
|:--:|
| *admin_login* |

<br>

| ![admin_view](https://user-images.githubusercontent.com/123747958/222973567-85aef9ab-ca59-4873-84ab-a5b59fe81f4d.png) |
|:--:|
| *admin_view* |

<br>

| ![user_login](https://user-images.githubusercontent.com/123747958/222973612-11e4c7ac-dc9f-4927-b21b-a5a621558d79.png) |
|:--:|
| *user_login*| 

<br>

| ![user_view](https://user-images.githubusercontent.com/123747958/222973625-959222a9-cc9d-477f-bff5-c967079417ac.png) |
|:--:|
| *user_view* |

<hr>
