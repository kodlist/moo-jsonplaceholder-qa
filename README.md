# moo-jsonplaceholder-qa

Test automation work built for testing restful apis using [Karate unified test automation framework](https://github.com/intuit/karate)

## Task for today


To complete the exercises below, please use this API [jsonplaceholder](https://jsonplaceholder.typicode.com/). There are more details on the resources available for this API in the [Readme](https://github.com/typicode/jsonplaceholder) here.


As a client of this [API](https://jsonplaceholder.typicode.com/users), I want to be able to:

 - Get a list of the following attributes about a user
<table>
 <tr><td>Name</td></tr>
 <tr><td>Username</td></tr>
 <tr><td>Email</td></tr>
 <tr><td>Phone</td></tr>
 <tr><td>Website</td></tr>
 </table>
 
 - Get a 404 status code when retrieving the details of an invalid user
 
 - Get a 200 status code when retrieving the details of a valid user
 
 - Create a new user
 
 - Delete a user
 
 - See the following fields in the header of a response when getting a list of users:
<table>
 <tr><td>Cache-Control => public</td></tr>
 <tr><td>Connection => keep-alive</td></tr>
 <tr><td>Content-Type => application/json</td></tr> 
</table>


Further checks:

1. Please write automated checks that cover these scenarios
2. Please write two additional pieces of acceptance criteria that describe other behaviours of the API, and implement checks for those as well
3. Please write a ReadMe for your test framework - the reviewer of your code should be able to run the tests you write using only the ReadMe
