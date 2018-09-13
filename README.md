# moo-jsonplaceholder-qa

Test automation work built for testing restful apis using [Karate unified test automation framework](https://github.com/intuit/karate)

## Task for today


To complete the exercises below, please use this API [jsonplaceholder](https://jsonplaceholder.typicode.com/). There are more details on the resources available for this API in the [Readme](https://github.com/typicode/jsonplaceholder) here.


As a client of this API, I want to be able to:

 - Get a list of the following attributes about a user
<table>
 <tr><th> Name </th></tr>
 <tr><th> Username </th></tr>
 <tr><th> Email </th></tr>
 <tr><th> Phone </th></tr>
 <tr> <th>Website</th></tr>
 </table>
 - Get a 404 status code when retrieving the details of an invalid user
 - Get a 200 status code when retrieving the details of a valid user
 - Create a new user
 - Delete a user
 - See the following fields in the header of a response when getting a list of users:
 <table>
 <tr> Cache-Control => public</tr>
 <tr> Connection => keep-alive</tr>
 <tr> Content-Type => application/json</tr> 
 </table>


Further checks:


