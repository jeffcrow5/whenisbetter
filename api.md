# WhenIsBetter API Documentation

This repository contains the documentation for WhenIsBetter’s frontend.

#### Contents

1. Overview
2. Endpoints

## 1. Overview

WhenIsBetter’s API uses PostgREST to create a simple API that connects to the PostgeSQL database. The API can be used by sending HTTP requests to the endpoints listed below. Endpoints that modify the database will require an authentication token to be sent with the request. A JWT token can be sent using the `Authorization` HTTP header with the value `Bearer <Insert JWT token here>`.

## 2. Endpoints

### `/rpc/signup`

<b>HTTP Method:</b> POST <br>
<b>Description:</b> Sending a POST request to this endpoint will hash the password entered by the user and create a new entry in the `Users` table with all of the new user's information. <br>
<b>Query Parameters:</b> none <br>
<b>Request Body:</b> 
```json
{
	"firstname": "Jimbo",
	"lastname": "Johnson",
	"email": "jimbo@johnson.com",
	"password": "password"
}
``` 
<b>Response Body:</b> none

### `/rpc/login`

<b>HTTP Method:</b> POST <br>
<b>Description:</b> Sending a POST request to this endpoint will check if the password sent in the request body is valid for the hash in the database associated with the email sent in the request body. It will also generate and return a JWT token that is associated with the user. <br>
<b>Query Parameters:</b> none <br>
<b>Request Body:</b>

```json
{
	"email": "jimbo@johnson.com",
	"password": "password"
}
``` 
<br>
<b>Response Body:</b>

```json
[
	{
		"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9ey..."
	}
]
```
<br>

### `/User`

<b>HTTP Method:</b> GET <br>
<b>Description:</b> Sending a GET request to this endpoint will return information from the Users table. A userid can be specified as a query parameter to get information from a specific user. <br>
<b>Query Parameters:</b> `?userid=eq.1` <br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> 

```json
[
	{
		"firstname": "Rick",
		"lastname": "Astley",
		"emailaddress": "nevergonnagive@you.up",
		"isadmin": 1,
		"userpassword": "$2a$08$3CY2Rf0yKpNK9EmD...",
		"defaulttimes": {
			"friday": [
				13,
				14,
				15
			],
			"monday": [
				12,
				13,
				14,
				15
			],
			"sunday": [
				18,
				19
			],
			"tuesday": [
				6,
				7,
				8,
				"18"
			],
			"saturday": [
				9,
				10,
				11,
				12,
				13
			],
			"thursday": [
				16,
				18,
				"7",
				"8"
			],
			"wednesday": [
				15,
				"10",
				"11"
			]
		},
		"userid": 1
	}
]
```

### `/User`

<b>HTTP Method:</b> PATCH <br>
<b>Description:</b> Sending a PATCH request to this endpoint will update the information sent in the request body for the user specified in the query parameter. The user's first name, last name, and default times can be sent in the request body. <br>
<b>Query Parameters:</b> `?userid=eq.1` <br>
<b>Request Body:</b>

```json
{
	"firsname": "Jimmy",
	"lastname": "Johnson",
	"defaulttimes": {
		"monday": [12, 13, 14, 15],
		"tuesday": [6, 7, 8],
		"wednesday": [15],
		"thursday": [16, 18],
		"friday": [13, 14, 15],
		"saturday": [9, 10, 11, 12, 13],
		"sunday": [18, 19]
	}
}
```
<b>Response Body:</b> none

### `/User`

<b>HTTP Method:</b> DELETE <br>
<b>Description:</b> Sending a DELETE request to this endpoint will delete a user from the database. It will also delete any entry from other tables that reference the userid specified in the query string. <br>
<b>Query Parameters:</b> `?userid=eq.1`<br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> none

### `/Group`

<b>HTTP Method:</b> GET <br>
<b>Description:</b> Sending a GET request to this endpoint will return information from all groups. A groupid or the group's invite code can be specified as a query parameter to get information from a specific group. <br>
<b>Query Parameters:</b> `?groupid=eq.1` or `?groupinvitecode=eq.123456789102` <br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> 

```json
[
	{
		"groupinvitecode": "123456789102",
		"groupname": "group",
		"groupdesc": "description",
		"groupimage": "test.png",
		"groupadmin": 1,
		"groupid": 2
	}
]
```

### `/Group`

<b>HTTP Method:</b> POST <br>
<b>Description:</b> Sending a POST request to this endpoint will create a new group with the information sent in the request body <br>
<b>Query Parameters:</b> none <br>
<b>Request Body:</b>

```json
{
	"groupinvitecode": "123code4567",
	"groupname": "group3",
	"groupdesc": "description",
	"groupimage": "test.png",
	"groupadmin": 1
}
```
<b>Response Body:</b> none

### `/User`

<b>HTTP Method:</b> DELETE <br>
<b>Description:</b> Sending a DELETE request to this endpoint will delete a group from the database. It will also delete any entry from other tables that reference the groupid specified in the query string. <br>
<b>Query Parameters:</b> `?groupid=eq.1`<br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> none

### `/Event`

<b>HTTP Method:</b> POST <br>
<b>Description:</b> Sending a POST request to this endpoint will create a new event with the information sent in the request body <br>
<b>Query Parameters:</b> none <br>
<b>Request Body:</b>

```json
{
	"eventname": "name",
	"eventdesc": "description",
	"eventduration": 1.5,
	"eventstarttime": "2022-01-30T13:00:00",
	"groupid": 1
}
```
<b>Response Body:</b> none

### `/Event`

<b>HTTP Method:</b> DELETE <br>
<b>Description:</b> Sending a DELETE request to this endpoint will delete an event from the database. It will also delete any entry from other tables that reference the eventid specified in the query string. <br>
<b>Query Parameters:</b> `?eventid=eq.1`<br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> none

### `/GroupHasUser`

<b>HTTP Method:</b> POST <br>
<b>Description:</b> Sending a POST request to this endpoint will add the user with the id specified in the request body to the group with the id specified in the request body. The user's available times for the group are also specified in the request body. <br>
<b>Query Parameters:</b> none <br>
<b>Request Body:</b>

```json
{
	"userid": 2,
	"groupid": 1
}
```
<b>Response Body:</b> none

### `/GroupHasUser`

<b>HTTP Method:</b> DELETE <br>
<b>Description:</b> Sending a DELETE request to this endpoint will remove the user with the id specified in the query parameter from the group with the id specified in the query parameter.<br>
<b>Query Parameters:</b> `?userid=eq.2&groupid=eq.1 ` <br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> none

### `/UserAttendsEvent`

<b>HTTP Method:</b> POST <br>
<b>Description:</b> Sending a POST request to this endpoint will record that the user with the id specified in the request body is attending the event with the id specified in the request body. <br>
<b>Query Parameters:</b> none <br>
<b>Request Body:</b>

```json
{
	"eventid": 3,
	"userid": 2
}
```
<b>Response Body:</b> none

### `/UserAttendsEvent`

<b>HTTP Method:</b> DELETE <br>
<b>Description:</b> Sending a DELETE request to this endpoint will record that the user with the id specified in the request body is not attending the event with the id specified in the request body<br>
<b>Query Parameters:</b> `?userid=eq.2&eventid=eq.1 ` <br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> none

### `/user_settings`

<b>HTTP Method:</b> GET <br>
<b>Description:</b> Sending a GET request to this endpoint will return the current settings for the user specified in the query parameter <br>
<b>Query Parameters:</b> `?userid=eq.1` <br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> 

```json
[
	{
		"firstname": "Rick",
		"lastname": "Astley",
		"emailaddress": "nevergonnagive@you.up",
		"userid": 1,
		"defaulttimes": {
			"friday": [
				13,
				14,
				15
			],
			"monday": [
				12,
				13,
				14,
				15
			],
			"sunday": [
				18,
				19
			],
			"tuesday": [
				6,
				7,
				8,
				"18"
			],
			"saturday": [
				9,
				10,
				11,
				12,
				13
			],
			"thursday": [
				16,
				18,
				"7",
				"8"
			],
			"wednesday": [
				15,
				"10",
				"11"
			]
		}
	}
]
```

### `/user_attends_events`

<b>HTTP Method:</b> GET <br>
<b>Description:</b> Sending a GET request to this endpoint will check what events a user is attending, what users are attending an event, or if a user is attending a specific event, depending on the query parameters specified. <br>
<b>Query Parameters:</b> `?userid=eq.1` or `?event=eq.1` or `?userid=eq.1&?eventid=eq.1` <br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> 

```json
[
	{
		"eventid": 1,
		"userid": 1
	}
]
```

### `/group_members`

<b>HTTP Method:</b> GET <br>
<b>Description:</b> Sending a GET request to this endpoint will return all the group members of the group with the id specified in the query parameter. <br>
<b>Query Parameters:</b> `?groupid=eq.1` <br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> 

```json
[
	{
		"groupid": 2,
		"firstname": "Rick",
		"lastname": "Astley",
		"userid": 1,
		"grouptimes": {}
	},
	{
		"groupid": 2,
		"firstname": "Jimmy",
		"lastname": "Johnson",
		"userid": 2,
		"grouptimes": {}
	}
]
```

### `/user_individual_group_events`

<b>HTTP Method:</b> GET <br>
<b>Description:</b> Sending a GET request to this endpoint will return all of the events associated with the groupid specified in the query parameter. <br>
<b>Query Parameters:</b> `?groupid=eq.1` <br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> 

```json
[
	{
		"eventid": 14,
		"eventname": "new",
		"eventdesc": "newnew",
		"eventduration": 1.5,
		"eventstarttime": "2022-03-23T01:00:00",
		"groupid": 2
	},
	{
		"eventid": 15,
		"eventname": "test",
		"eventdesc": "testse",
		"eventduration": 2,
		"eventstarttime": "2022-03-24T00:59:00",
		"groupid": 2
	},
	{
		"eventid": 17,
		"eventname": "fun party",
		"eventdesc": "this is gonna be a fun party",
		"eventduration": 3.5,
		"eventstarttime": "2022-03-19T00:00:00",
		"groupid": 2
	}
]
```

### `/user_groups`

<b>HTTP Method:</b> GET <br>
<b>Description:</b> Sending a GET request to this endpoint will return all the groups that the user with the id specified in the query parameter is a member of. <br>
<b>Query Parameters:</b> `?userid=eq.1` <br>
<b>Request Body:</b> none <br>
<b>Response Body:</b> 

```json
[
	{
		"groupname": "Rick Rollers",
		"userid": 1,
		"groupid": 1,
		"groupinvitecode": "123456781234",
		"groupdesc": "Got em"
	},
	{
		"groupname": "group",
		"userid": 1,
		"groupid": 2,
		"groupinvitecode": "123456789102",
		"groupdesc": "description"
	},
	{
		"groupname": "group3",
		"userid": 1,
		"groupid": 3,
		"groupinvitecode": "123code456",
		"groupdesc": "description"
	},
	{
		"groupname": "a",
		"userid": 1,
		"groupid": 17,
		"groupinvitecode": "33727692-b1b",
	},
]
```