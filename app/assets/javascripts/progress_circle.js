
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

    circle.style.strokeDashoffset = pct;

    mainDiv.getAttribute('data-pct',val);
  }
}

mainDiv && animateCircle();




// var outerDiv = document.getElementById("ceremony");
//   value = outerDiv.dataset.percentage;
//   // var $circle = $('#svg #bar');
//  var round = document.querySelector('#svg1');
//  round = round.querySelector('#bar1');


//   if (isNaN(value)) {
//    value = 100;
//   }
//   else{
//     var r = round.getAttribute('r');
//     var c = Math.PI*(r*2);
//     if (value < 0) { value = 0;}
//     if (value > 100) { value = 100;}

//     var pctg = ((100-value)/100)*c;

//     round.style.strokeDashoffset= pctg;

//    outerDiv.getAttribute('data-pctg',value);
//   }


//   var extDiv = document.getElementById("contact");
//   vall = extDiv.dataset.percentage;
//   // var $circle = $('#svg #bar');
//  var rund = document.querySelector('#svg2');
//  rund = rund.querySelector('#bar2');


//   if (isNaN(vall)) {
//    vall = 100;
//   }
//   else{
//     var r = rund.getAttribute('r');
//     var c = Math.PI*(r*2);
//     if (vall < 0) { vall = 0;}
//     if (vall > 100) { vall = 100;}

//     var pctge = ((100-vall)/100)*c;

//     rund.style.strokeDashoffset= pctge;

//    extDiv.getAttribute('data-pctge',vall);
//   }
