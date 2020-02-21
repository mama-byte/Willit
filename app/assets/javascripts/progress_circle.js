
var mainDiv = document.getElementById("cont");

function animateCircle() {
  var val = mainDiv.dataset.percent;
  var circle = document.querySelector('#svg');
   circle = circle.querySelector('#bar');


  if (isNaN(val)) {
    val = 100;
  } else {
    var r = circle.getAttribute('r');
    var c = Math.PI*(r*2);
    if (val < 0) { val = 0;}
    if (val > 100) { val = 100;}

    var pct = ((100-val)/100)*c;

    circle.style.strokeDashoffset= pct;

    mainDiv.getAttribute('data-pct',val);
  }
}

mainDiv && animateCircle();



