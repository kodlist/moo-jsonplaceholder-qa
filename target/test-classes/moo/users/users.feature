########################################################################
########################################################################


#Author: kmehar650@gmail.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
## (Comments)
#Sample Feature Definition Template

########################################################################
########################################################################


########################################################################
########################################################################



Feature: 


				 
				 ***************************************************************
				 Users API - Fetch invalid and valid user, Create user, Delete user. Methods and resource we test in this feature using below properties.
				 
				 Endpoint: https://jsonplaceholder.typicode.com
				 Method: GET - Resource: /users
				 Method: POST - Resource: /users
				 Method: DELETE - Resource: /users
				 
				 ***************************************************************
				 ***************************************************************
				 
Background:            
          * url baseUrl
          * def header_Data = { Content-Type: "application/json", Accept: "application/json"} 


###################################################################
###################################################################



###################################################################
###################################################################



#@ignore
@fetchValidUser
Scenario: Fetch valid user - GET call.
          ***************************************************************
          *************************************************************** 
          In this scenario I am going to fetch Nth user (N - is going to derive from first get call).
          and then make another call using user id as a param 
          and then assert (in other words verify) name, email, phone, website are as per requirements.
          also assert status is ##200##, and also assert header - Content-Type , Connection , Cache-Control 
          Here, two GET calls are happening. Please look for match (match is also assert in karate).
                  
   Given path 'users'
	 When method get
	 Then status 200
   And match header Content-Type contains 'application/json'  
   And match header Connection == 'keep-alive'
   And match header Cache-Control contains 'public'
   
   * def first = response[0]

   Given path 'users', first.id
   When method get
   Then status 200
   And assert responseStatus == 200 || responseStatus == 204
   * print "response : ", response
   * print "user id from response : ", response.id 
      
   * def result = response
   * print "result : "  ,result.id
   * print "result.name : ", result.name
   * print "result.username : ", result.username
   * print "result.email : ", result.email
   * print "result.phone : ", result.phone
   * print "result.website : ", result.website
   
   Then match result.name ==  '#string'
   And match result.username ==  '#string'   
   And match response.id == '#number'
   And match response.phone == '#regex [0-9].*-[0-9]*-[0-9]*-[0-9]* x[0-9]*'
   * def userEmail = {email: '#(result.email)' }
   * print "email : ", userEmail
   And match userEmail == { email : '#regex [a-zA-Z].*@[a-zA-Z].[a-z].*' }
   
   


      
###################################################################
###################################################################



###################################################################
###################################################################



@ignore
@fetchInValidUser
Scenario: Fetch Invalid user - GET call.
          ***************************************************************
          *************************************************************** 
          In this scenario I am going to fetch invalid user.
          Note: while creating invalid user I will use JS function to generate random number to that user).
          and then make GET call using generated user id as a param and then assert status is ##400##
          please look for match (match is also assert in karate).
                  
   Given path 'users'
	 When method get
	 Then status 200

   * def first = response[0]
   * def functions =  call read('classpath:jsfunctions.js')
   * def x = 1000
   * def y = 100000
   * def randomNumber = functions.randomGenerator(x,y)
   * def randomId = karate.eval(Math.round(randomNumber))
   * set first.id = randomId
   * print "first.id " , first.id
   Given path 'users', first.id
   When method get
   Then status 404
   * print "response : ", response
   Then assert responseStatus == 404
      
   
   


      
###################################################################
###################################################################



###################################################################
###################################################################



@ignore
@createNewUser
Scenario Outline: Create a new user - POST call. Get user - GET call
          ***************************************************************
          *************************************************************** 
          In this scenario I am going to create a new user.
          and then assert user created by verifying response status ##201## or ##204##
          and then verify response has returned id for new user
          and then verify name, username and zipcode. please look for match (match is also assert in karate).
          
   * def payload = read('newuser.json')   
   * set payload.name = <name>
   * set payload.username = '<username>'
   * set payload.email = <email>
   * set payload.address.zipcode = <zipcode>
   * set payload.phone = <phone>
   * set payload.website = <website>
   * set payload.company.name = <company_name>
   * print "payload : ", payload
   Given path 'users'
   And request payload
   * headers header_Data
   * configure connectTimeout = 10000
   * configure readTimeout = 100000
   When method post
   Then assert responseStatus == 200 || responseStatus == 201 ||  responseStatus == 204
   And match response.name == <name>
   And match response.username == '<username>'
   And match response.id == '#number'
   And match response.address.zipcode == <zipcode>
   Examples:
   | name         | username | email                | phone                   | website             | company_name       | zipcode      |
   | 'Jane Brent' | Jane     | 'janeb@getnada.com'  | '1-880-787-8969 x56445' | 'getnada.com'       | 'CC Group'         | '95656-895'  |
   
   

###################################################################
###################################################################



###################################################################
###################################################################



@ignore
@deleteUser
Scenario: Delete a user - DELETE call. Get user - GET call
          ***************************************************************
          *************************************************************** 
          In this scenario I am going to fetch user and pass that user id to delete operation
          and then assert response is empty and assert status is ##200## or ##204##
          please look for match (match is also assert in karate).
          
   Given path 'users'
	 When method get
	 Then status 200

   * def first = response[0]

   Given path 'users', first.id
   When method delete
   Then status 200
   And assert responseStatus == 200 || responseStatus == 204
   And match response == {}
   
   
    
###################################################################
###################################################################



###################################################################
###################################################################