var a = document.getElementsByTagName('canvas')[0];
var b = document.body;

var requestAnimationFrame =
    window.requestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.msRequestAnimationFrame ||
    function(f){ setTimeout(f, 1000/30); };

a.style.width = (a.width = innerWidth) + 'px';
a.style.height = (a.height = innerHeight) + 'px';

var c = a.getContext('2d');


con = console


sw = a.width;
sh = a.height;

function drawGlypy(angle, distance) {

    var rings = 19;

    for ( var j = 0; j < rings; j++ ) {

      base = Math.pow(1.5, (j + 1) )

      d = base + distance * base;

      x = sw / 2 + Math.cos(angle) * d;
      y = sh / 2 + Math.sin(angle) * d;

      size = d / 20
      
      c.fillStyle = "hsla(" + ~~(j / rings * 300) + ",100%, 30%, 1)"
      c.beginPath();
      c.arc(x, y, size * 3, 0, 2 * Math.PI, false);
      c.fill();

    }
}

p = 0;

function r() {

  a.width = a.width

  p++;

  dots = 20

  tunnel = 0;//Math.sin(p/10) * 20

  for ( var i = 0; i < dots; i++ ) {

    // angle = Math.random() * Math.PI * 2;
    angle = p / 100 + i / dots * Math.PI * 2;
    
    // distance = Math.random() * sw / 2 / 10;
    //distance = (Math.sin(3 * i / dots * Math.PI * 2) + 1) / 2;
    distance = tunnel +  (Math.sin(3 * i / dots * Math.PI * 2) + 1 + Math.cos(p / 20 + 2 * i / dots * Math.PI * 2) + 1) / 4;
    // distance = i / dots;//Math.random();

    drawGlypy(angle, distance);
  }

  requestAnimationFrame(r);
}
r()