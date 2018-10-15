$(document).ready(function(){
    alert("1111111111");
	var username1 = document.getElementById("username");

	$("#username").blur(function(){
		username = username1.value;
		$.get("/isNameExist?username="+username,function(response){
			if(response=="用户名已存在"){
				$("#username").focus();
				document.getElementById("span").innerHTML="<font color='red'>"+response+"</font>";
			}
		});
	});

	$("#username").focus(function(){
	document.getElementById("span").innerHTML="";
    });
});



