Canvas.prototype.draw = function(){
    this.clearCanvas(); 
    var size = this.sizeOfCell;
    
    window.main.t++;
    t = window.main.t;

    t = t*size;

    if (t > this.element.width){
        this.clearCanvas(); 
        $("#reset").trigger("click");
    }    
   
    /// FOR VALENTINE CHANGE HERE
    // size == cell, this.element.height/2 == Ox, this.element.width/2 == Oy
    size = 4*size;
    var pFrom = new Point(t, this.element.height/2-size);
    var pTo = new Point(t, this.element.width/2+size);
    this.drawLine(pFrom, pTo, 5, '#ff0000');

    var pFrom = new Point(t-size, this.element.height/2);
    var pTo = new Point(t+size, this.element.width/2);
    this.drawLine(pFrom, pTo, 5, '#ff0000');

    var pFrom = new Point(t, this.element.height/2-size);
    var pTo = new Point(t+size, this.element.width/2-size);
    this.drawLine(pFrom, pTo, 5, '#ff0000');

    var pFrom = new Point(t+size, this.element.height/2);
    var pTo = new Point(t+size, this.element.width/2+size);
    this.drawLine(pFrom, pTo, 5, '#ff0000');

    var pFrom = new Point(t-size, this.element.height/2+size);
    var pTo = new Point(t, this.element.width/2+size);
    this.drawLine(pFrom, pTo, 5, '#ff0000');
    
}

$(document).ready(function(){

    window.canvas = new Canvas('myCanvas',20);
    window.main = new Main(500);

    $("#time").change(function () {
        main.time = this.value;
        $("#stop").trigger("click");
        $("#start").trigger("click"); 
    });

    $('#status').html("stopped");

    $("#stop").click(function () {
        if (main.stop()){
            $('#status').html("stopped");
        }
    });

    $("#t").change(function(){
        if ($(this).val() > window.canvas.element.width/window.canvas.sizeOfCell){
            $(this).val(0);
            alert("too big");
        }else{
            main.t = $(this).val();
        }
    });

    $("#next").click(function () {
        $("#t").val(window.main.t);
        canvas.draw();
    });

    $("#start").click(function () {
         if (main.start()){
            $("#status").html("running");
        }
    });

    $("#reset").click(function () {
        main.reset();
        canvas.clearCanvas();
        $('#status').html("stopped");
        $("#t").val(0);
    });
 
});



/////////////////////////////////////////////////////////////////
///////////ANOTHER CLASS/////////////////////////////////////////
/////////////////////////////////////////////////////////////////
//point class
function Point(_x, _y) {
  this.x =  Number(_x);
  this.y =  Number(_y);
}


/////////////////////////////////////////////////////////////////
///////////ANOTHER CLASS/////////////////////////////////////////
/////////////////////////////////////////////////////////////////
//make class Canvas
function Canvas (_id, _amountOfCell) {
    this.element = document.getElementById(_id);
    if (_amountOfCell === undefined){
        this.sizeOfCell = this.element.width/10;
    }else{
        this.sizeOfCell = this.element.width/_amountOfCell;
    }

    this.prepareScene();
}
Canvas.prototype.getContext = function() {
    return this.element.getContext('2d');
};
Canvas.prototype.drawLine = function (pointFrom, pointTo, width, color){
    var ctx = this.getContext(); 
    
    ctx.beginPath();
    ctx.moveTo(pointFrom.x, pointFrom.y);
    ctx.lineTo(pointTo.x, pointTo.y);
    if (width !== undefined){
        ctx.lineWidth = width;
    }
    if (color !== undefined){
        ctx.strokeStyle = color;
    }
    ctx.stroke();
    ctx.closePath();
}
Canvas.prototype.drawAxes = function () {
    var size = this.sizeOfCell;
    var ctx = this.getContext();
    
    for (var i = 0; i < this.element.width; i += size) {
        var pFrom = new Point(i+0.5, 0);
        var pTo = new Point(i+0.5, this.element.height);
        this.drawLine(pFrom, pTo, 0.5);

        pFrom = new Point(0, i+0.5);
        pTo = new Point(this.element.width, i+0.5);
        this.drawLine(pFrom, pTo, 0.5);
    }

    var pFrom = new Point(this.element.height/2, 0);
    var pTo = new Point(this.element.height/2, this.element.height);
    this.drawLine(pFrom, pTo, 3);

    var pFrom = new Point(0, this.element.width/2);
    var pTo = new Point(this.element.width, this.element.width/2);
    this.drawLine(pFrom, pTo, 3);

};
Canvas.prototype.prepareScene = function() {
    this.drawAxes();
    var image = new Image();
    image.src = this.element.toDataURL("image/png").replace("image/png", "image/octet-stream");
    this.backgroung = image;
};
Canvas.prototype.clearCanvas = function(){
    var ctx = this.getContext();
    ctx.clearRect(0, 0, this.element.width, this.element.height);
    ctx.drawImage(this.backgroung, 0, 0);
}



/////////////////////////////////////////////////////////////////
///////////ANOTHER CLASS/////////////////////////////////////////
/////////////////////////////////////////////////////////////////
// Controller class Main
// time in miliseconds
function Main(_time){
    this.run = false;
    this.t = 0; 
    this.time = _time; 
}
Main.prototype.stop = function(){
    if (this.run === true) {
        clearInterval(this.interval);
        this.run = false;
        return true;
    }
    return false;
}
Main.prototype.start = function(){
    if (this.run === false) {
        this.interval = setInterval(function(){
            window.canvas.draw();
            $("#t").val(window.main.t);
        }, this.time);
        this.run = true;
        return true;
    }
    return false;
}
Main.prototype.reset = function(){
    this.run = false;
    clearInterval(this.interval);
    this.t = 0;
}




