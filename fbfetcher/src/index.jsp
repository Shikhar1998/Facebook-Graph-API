<!DOCTYPE html>
<html>
<title>FB Fetcher</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-navbar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
</style>
<body>

<ul class="w3-navbar w3-red w3-card-2 w3-top w3-left-align w3-large">  
  <li><a href="#" class="w3-padding-large w3-white">Home</a></li>
  <li class="w3-hide-small"><a href="fetch.jsp" class="w3-padding-large w3-hover-white">Fetch</a></li>
  <li class="w3-hide-small"><a href="about.jsp" class="w3-padding-large w3-hover-white">About</a></li>
</ul>


<div class="w3-container w3-red w3-center w3-padding-128">
  <h1 class="w3-margin w3-jumbo">FACEBOOK FETCHER</h1>
  <p class="w3-xlarge">Using FB Graph API</p>
</div>

<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1>Introduction</h1>
      <h5 class="w3-padding-32">Facebook Graph API enables one to Fetch/Post/Delete data from User Feed or Public FB page.</h5>

      <p class="w3-text-grey">I have used the Javascript SDK provided by the Facebook. The app id is 788821351218793. For accessing the data you need to have a FB account and should login through the app. To continue click on <b>FETCH.....</b></p>
    </div>

    <div class="w3-third w3-center">
      <img src = "templates/logo.jpeg"></img>
    </div>
  </div>
</div>

<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
  <div class="w3-content">
    <div class="w3-third w3-center">
      <img src="templates/cmp.jpeg"></img>
    </div>

    <div class="w3-twothird">
      <h1>Pre-Requisites</h1>
      <h5 class="w3-padding-32">The list of items required on the system to be run:</h5>
      <p class="w3-text-grey"><li>Oracle 10g or higher</li><li>FB Account</li><li>JSON JAR File</li><li>LOCAL HOST</li></p>
    </div>
  </div>
</div>

<div class="w3-container w3-black w3-center w3-opacity w3-padding-64">
    <h1 class="w3-margin w3-xlarge">FACEBOOK FETCHER</h1>
</div>

<!-- Footer -->
<footer class="w3-container w3-padding-64 w3-center w3-opacity">
 <p>Template Provided by W3</p>
</footer>


</body>
</html>
