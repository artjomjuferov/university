window.gravity = 10; // гравитационная постоянная
window.dt = 0.1; // шаг по времени
window.fmax = 1; // максимальное значение силы
window.m = 0.1;
window.time = 100;
window.points = new Array();
window.run = false;

$(document).ready(function(){
  window.canvas = document.getElementById('myCanvas'); 

  $("#myCanvas").click(function(ev){
    var ctx = window.canvas.getContext('2d');
    ctx.clearCanvas(window.canvas);

    var x = ev.pageX - canvas.offsetLeft;
    var y = ev.pageY - canvas.offsetTop;
    
    var point = new Point(x, y);
  
    points.push(point);
    
    ctx.drawAllPoints(points);
  });

  $("#stop").click(function () {
      if (stop()){
          $('#status').html("stopped");
      }
  });

  $("#next").click(function () {
      CalcAndDraw(window.points);
  });

  $("#start").click(function () {
       if (start()){
          $("#status").html("running");
      }
  });
});

function CalcAndDraw(points){
  CalcForces(points, gravity, fmax);
  MovePoints(points, dt);

  var ctx = canvas.getContext('2d');
  ctx.clearCanvas(canvas);

  ctx.drawAllPoints(points);
}

CanvasRenderingContext2D.prototype.drawPoint = function (point, color){
  this.beginPath();
  var r=5;
  if(typeof(color) !== undefined){
    this.fillStyle = color;
    this.strokeStyle = color;
  }else{
    this.fillStyle = "black";
    this.strokeStyle = "black";
  }
  this.arc(point.x, point.y, r, 0, 2 * Math.PI, false);
  this.fill();
  this.stroke();
};
CanvasRenderingContext2D.prototype.drawAllPoints = function (points){
  for (var i = 0; i < points.length; i++) {
      this.drawPoint(points[i]);
  };
};
CanvasRenderingContext2D.prototype.clearCanvas = function(canvas){
    this.clearRect(0, 0, canvas.width, canvas.height);
}

var stop = function(){
    if (window.run === true) {
        clearInterval(window.interval);
        window.run = false;
        return true;
    }
    return false;
}
var start = function(){
    if (window.run === false) {
        window.interval = setInterval(function(){
            CalcAndDraw(window.points);
            console.log(window.points);
        }, window.time);
        window.run = true;
        return true;
    }
    return false;
}
var reset = function(){
    window.run = false;
    clearInterval(window.interval);
    window.t = 0;
}



//////////////////////////////
////////issue 3 points//////// 
//////////////////////////////

function Point(_x, _y) {
  this.x =  Number(_x);
  this.y =  Number(_y);
  this.vx = 100*(0.5-Math.random());
  this.vy = 100*(0.5-Math.random());
  this.forceX = 0;
  this.forceY = 0;
  this.m = Math.random();
}

function CalcForces(points, gravity, fmax){
   for (var i = 0; i < points.length; i++) {
    for (var j = 0; j < points.length; j++) {
      if (i == j){
        continue;
      } 
      var dx = points[j].x - points[i].x; 
      var dy = points[j].y - points[i].y;
      var r_2 = 1 / (dx * dx + dy * dy);
      var r_1 = Math.sqrt(r_2);
      var fabs = gravity * points[i].m * points[j].m * r_2;
      if (fabs > fmax){
        fabs = fmax;
      }  
      
      points[i].forceX = points[i].forceX + fabs * dx * r_1;
      points[i].forceY = points[i].forceY + fabs * dy * r_1;
    }
  }
}

function MovePoints(points, dt){
  for (var i = 0; i < points.length; i++) {
    var dvx = points[i].forceX * dt / points[i].m;
    var dvy = points[i].forceY * dt / points[i].m;
    points[i].x += (points[i].vx + dvx / 2) * dt;
    points[i].y += (points[i].vy + dvy / 2) * dt;
    points[i].vx += dvx;
    points[i].vy += dvy;
    points[i].forceX = 0;
    points[i].forceY = 0;
  }
}