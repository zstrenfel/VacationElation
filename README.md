

![Logo](https://github.com/zstrenfel/VacationElation/blob/master/client/assets/imgs/logo.png)

# okayVacay
Created for Launch Hackathon 2016 by [Zach Strenfel](https://github.com/zstrenfel) & [Jason Huang](https://github.com/huang5640)

*Visit the site* **[here.](https://okayvacay-client.herokuapp.com)**

*Note: the server is currently unavaliable and this presents only an example of our build. No account information is needed as well; simply input any string into the email field and click 'Sign-Up.*


*To run this app locally, start the rails server in the root directory (rails s) and the node server inside of the client folder (npm start), simultaneously*

----------


## Description

 *okayVacay* is designed to help the user find the cheapest options for travel avaliable in their budget and aligned with their interests. It takes into account: departing airport, avaliable days for travel, budget constraints, user interests; and returns a list of travel options that match the selected criteria. Our app is not for those who already have a destination in mind, but rather for those looking to adventure out, on a budget.


## Build

In order to best utilize our different skill-sets and areas of expertise, we decoupled the back and the front-end segments and hosted them seperately.

**Jason - Back-End**
MongoDB and Ruby on Rails are used in the back to send requests to the Expedia API Flight and Hotel search on request. After recieving a response, the data  is run through an algorithm that sorts and finds the best-fit trip from the user input for the client. A JSON array of the trip information is then returned to the front-end.

**Zach - Front-End**
The front-end was built using React.js and handles the collection of user input. On submit, it sends an ajax request to the back to get trip information.
UI/UX was also handled by Zach.

*Client-Side code is avaliable in the "client" folder located in the root directory (./client)*
