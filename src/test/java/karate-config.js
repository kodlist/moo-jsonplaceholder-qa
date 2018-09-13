function() {    
	var env = karate.env; // get system property 'karate.env'
	  
	  //enable ssl (and no certificate is required) - NOTE: But this works occasionally.
	  //karate.configure( 'ssl' , true)
	  
	  //enable ssl and force the algorithm to TLSv1.2   - NOTE: But this works occasionally.
	  //karate.configure( 'ssl', 'TLSv1.2')
	  
	/* var port == karate.properties['demo.server.port']; 
	 if (!port) {
		    port = karate.env == 'qa' ? 8090 : 8080;
		  }*/
		  
	 var protocol = 'https'; 
	 
	 if (env != "qa"){
		    env = "qa";
	 }
	// var config = { demoBaseUrl: protocol + '://127.0.0.1:' + port }; 
	// var config = { demoBaseUrl: protocol + '://jsonplaceholder.typicode.com/' };
	 var config = {   env: env	  };
	  
	  if (env == "dev") 
	  {
		  config.baseUrl = "https://host/";
	  } else if (env == "qa") 
	  {
	     config.baseUrl = "https://jsonplaceholder.typicode.com/";
	  } else if (env == "int") 
	  {
	     config.baseUrl = "https://host/";
	  } else if (env == "sat") 
	  {
	     config.baseUrl = "https://host/";
	  }
	  
	 

	  karate.log("Running on environment: ", env);
	  karate.configure("logPrettyRequest", true);
	  karate.configure("logPrettyResponse", true);
	  
	  karate.configure('connectTimeout', 30000);
	  karate.configure('readTimeout', 30000);
	 
  return config;
}