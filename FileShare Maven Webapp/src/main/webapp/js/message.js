function but1(){
	if(document.getElementById('page1').style.display=='none'){
	document.getElementById('page1').style.display='block';
	document.getElementById('page2').style.display='none';
	document.getElementById('page3').style.display='none';
	}
}

function but2(){
	if(document.getElementById('page2').style.display=='none'){
	document.getElementById('page2').style.display='block';
	document.getElementById('page3').style.display='none';
	document.getElementById('page1').style.display='none';
	}
}

function but3(){
	if(document.getElementById('page3').style.display=='none'){
	document.getElementById('page3').style.display='block';
	document.getElementById('page1').style.display='none';
	document.getElementById('page2').style.display='none';
	}
}