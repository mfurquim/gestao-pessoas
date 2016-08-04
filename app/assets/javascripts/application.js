// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require wice_grid
//= require twitter/bootstrap
//= require_tree .

// Function for timetabling
var vector = new Array (0,0);

var array_timetabling = new Array(6);
for (var i = 0; i < 6; i++) {
  array_timetabling[i] = new Array(7);
  for (var j = 0; j < 7; j++) {
  		array_timetabling[i][j] = 0;
  }
}

function changeElements(){
	document.getElementById(vector[0]).innerHTML = document.getElementById(vector[1]).text;
	//alert(vector[0] + " " + vector[1]+" "+ document.getElementById(vector[1]).text + " ");
}
function firstElementVector(e){
	vector[0] = e.target.id;
}

function secondElementVector(o){  
	vector[1] = o.target.id;
} 
function takeElements() {
	var a = 0;
	for (var i = 0; i < 6; i++) {
	  for (var j = 0; j < 7; j++) {
	  	if(document.getElementById(a) != null){
	  		array_timetabling[i][j] = document.getElementById(a).innerHTML;
	  	}
	  	a+=1;
	  }
	}
	console.log(array_timetabling);
	alert(array_timetabling);
}

	$.ajax({
        url : "/academic_informations/show",
        type : "post",
        data : { array_timetabling: JSON.stringify(array_timetabling) }
    });