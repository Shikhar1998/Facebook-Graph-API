<!DOCTYPE html>
<html>
<title>FB Fetcher</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-navbar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
button.abc {
    background-color: Tomato;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
<body>

<ul class="w3-navbar w3-red w3-card-2 w3-top w3-left-align w3-large">
  <li class="w3-hide-small"><a href="index.jsp" class="w3-padding-large w3-hover-white">Home</a></li>
  <li><a href="#" class="w3-padding-large w3-white">Fetch</a></li>
  <li class="w3-hide-small"><a href="about.jsp" class="w3-padding-large w3-hover-white">About</a></li>
</ul>


<div class="w3-container w3-red w3-center w3-padding-128">
  <h1 class="w3-margin w3-jumbo">FACEBOOK FETCHER</h1>
  <p class="w3-xlarge">Using FB Graph API</p>
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" ></script>
	<script>
		// initialize and setup facebook js sdk
		window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '788821351218793',
		      xfbml      : true,
		      version    : 'v2.7'
		    });
		};
		(function(d, s, id){
		    var js, fjs = d.getElementsByTagName(s)[0];
		    if (d.getElementById(id)) {return;}
		    js = d.createElement(s); js.id = id;
		    js.src = "//connect.facebook.net/en_US/sdk.js";
		    fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		// login with facebook with extra permssions
		function login() {
			FB.login(function(response) {
				if (response.status === 'connected') {
		    		document.getElementById('status').innerHTML = '<h3>We are connected.</h3>' + "<button class='abc' onclick='getInfo()'>Get Info</button><br><hr>";
		    		document.getElementById('login').style.visibility = 'hidden';
					document.getElementById('lhead').style.visibility = 'hidden';
					document.getElementById('bhead').style.visibility = 'hidden';
		    	} else if (response.status === 'not_authorized') {
		    		document.getElementById('status').innerHTML = 'We are not logged in.'
		    	} else {
		    		document.getElementById('status').innerHTML = 'You are not logged into Facebook.';
		    	}
			}, {scope: 'email'});
		}		
		// getting basic info
		function getInfo() {
			FB.api('/nsitonline/feed', 'GET', {"fields": 'id,shares,likes.limit(0).summary(true),message,caption',"limit":'59'}, function(response) {
				var v = (response.data);
				var a ="",b ="",c ="",d= "",f="";
				for(var k in v){
					if (v[k]){
						if ("caption" in v[k] && v[k]!=undefined){
							a=a+v[k].caption+"_";
						}
						else{
							a=a+"None"+"_";
						}
						if ("message" in v[k]){
							b=b+v[k].message.substring(0,67);
							b=b.split("#").join("");
							b=b.split("&").join("");
							b=b.split("?").join("");
							b=b.split(/['"]+/g).join("");
							b=b.split("ðŸ†").join("");
							b=b.split("ðŸ”°").join("");
							b=b+"_";
						}
						else{
							b=b+"None"+"_";
						}
						if ("shares" in v[k]){
							c=c+v[k].shares.count+"-";
						}
						else{
							c=c+"0"+"-";
						}
						d=d+v[k].likes.summary.total_count+"-";
						f=f+v[k].id+"-";
					}
				}
			a=a+"0";
			b=b+"0";
			c=c+"0";
			d=d+"0";
			f=f+"0";
			FB.api('/nsitonline', 'GET', {fields: 'id,picture.width(150).height(150)'}, function(response) {
				pic = "<center><img src = '"+response.picture.data.url+"'></center>";
				document.getElementById("photo").innerHTML =(pic)+"<hr><b><center><h2>NSIT ONLINE</h2></center></b><hr>";
			});
			xhttp=new XMLHttpRequest();

			xhttp.open("GET","show.jsp?c="+a+"&l="+d+"&s="+c+"&f="+f+"&m="+b,true);
			xhttp.send();
			xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4 && xhttp.status == 200) {
				document.getElementById("catch").innerHTML =(xhttp.responseText)+"<br><h4>Notes: 1.The number of posts fetched are : 59. <br>2.Lesser SNO means newer post.<br>3.Can fetch more than 100 posts if character substring in line 95 made less to 20 in index.jsp.<br>(This is because local host allows only 2mb data send over post)";
			}
			};
			});
		}
	</script>
<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
  <div class="w3-content">
    <div id="status"></div>
	<div id="getinf"></div>
	<div id="photo"></div>
	<div id="catch"></div>
	<div id ="lhead"><h3>You need to Login to Facebook to Continue : </div>
	<button onclick="login()" id="login" class="abc">Login</button>
	<div id="bhead"><br>P.S. You are required to be connected to Internet</div>
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
