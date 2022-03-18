# WhenIsBetter Frontend Documentation

This repository contains the documentation for WhenIsBetter’s frontend.

#### Contents

1. Overview
2. Views
3. Other Important Files

## 1. Overview

WhenIsBetter’s frontend is based on a Vue.js web framework and runs using Yarn. The application is designed to help users schedule events with others. It utilizes Bootstrap and Bootstrap-Vue to assist in rapid development, as the timeframe to complete the project was shorter than anticipated.

## 2. Views

### Register Page (/frontend/src/pages/Register.vue)

![Register Page](/screenshots/Register.png)
*Figure 1: Register Page*

New users create a profile by entering their first and last name, a unique email address, and their password. The email address must not already exist in the database. 


### Login Page (/frontend/src/pages/Login.vue)

![Login Page](/screenshots/Login.png)
*Figure 2: Login Page*

Existing users can enter their email address and password they used to create their account to log into their account.

### Admin Panel (/frontend/src/pages/Admin.vue)

Users who have administrator status have the ability to see a full list of all users, the groups they are in, and the events that exist within those groups.

#### Group View
![Admin Panel Group View](/screenshots/Admin%20Panel%20Group%20View.png)
*Figure 3: Admin Panel Group View*

Administrators can view a specific group's members and events by using Group View mode. From there, they can delete any group members or events they deem necessary.

#### User View
![Admin Panel User View](/screenshots/Admin%20Panel%20User%20View.png)
*Figure 4: Admin Panel User View*

Administrators can also view a specific user in the database. They can make the user an administrator or revoke administrator status instead.

### Home Panel (/frontend/src/pages/Home.vue)

![Home Panel](/screenshots/Home%20Panel.png)
*Figure 5: Home Panel*

The Home Panel is the main hub that the user interacts with. It is where the user can join, create, or leave groups; create, view, and delete events; mark whether or not they are attending specific group events; and view other group members' availability.

#### Create Group

![Create Group](/screenshots/Create%20Group.png)
*Figure 6: Create Group*

A user inputs information about their new group and submits it. The frontend sends API requests to create the new group and add the current user to the group.

#### Join Group

![Join Group](/screenshots/Join%20Group.png)
*Figure 7: Join Group*

To join an existing group, a user enters the Invite Code of the group and submits it. The frontend sends an API request that adds the user to the group. After joining, the user inputs their available times for the group and can then view group events and other group members' times.

#### Create Event

![Create Event](/screenshots/Create%20Event.png)
*Figure 8: Create Event*

When creating an event, the user enters the event's name, gives it a description, the duration of the event, and the event's start time. The frontend sends an API request to create the new event and associated it with the currently selected group.

#### View Event

![View Event](/screenshots/View%20Event.png)
*Figure 9: View Event*

When a user clicks on one of the group's events, they can view the event's properties in more detail. The user can also indicate whether they are attending the event or not by clicking the Yes or No buttons on the event. The user can also delete the event from this view.

#### Settings Page

![Settings Page Top Half](/screenshots/Profile%20Top%20Half.png)
![Settings Page Bottom Half](/screenshots/Profile%20Bottom%20Half.png)
*Figures 10 and 11: Settings Page*

On the Settings page, the user can update their first and/or last name and can also update their default weekly available times for events. They save these settings by clicking the Save button at the bottom of the page.

## 3. Other Important Files

### Api.js

This file contains the requests that are made to the API and the data required to fulfill those requests.

### main.js

This file contains the routes that the Vue application uses. It tells the Vue application what navigation options exist in the application.

### auth.js

This file contains authentication methods that are used to check whether a user is logged in or not.

### NavBar.vue (/frontend/src/components/NavBar.vue)

This Vue component file contains the code for the navbar at the top of every view.

### Logout.vue

When a user presses the Log Out button on the navbar, the Vue instance routes to this file. The logout procedures in auth.js are run, and the user is then redirected to the Login page.
