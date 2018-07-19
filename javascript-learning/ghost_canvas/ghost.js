"use strict"
/**
 * The majority of this code is from: https://loopandtouch.wordpress.com/2014/04/22/how-to-draw-a-ghost-in-html5-canvas/
   * See readme.md for a list of changes I made
 */

window.addEventListener('load', (e) => {
  /* canvas setup */
  var canvas = get('canvas');
  var ctx    = canvas.getContext('2d');
  // canvas.width = 578;
  // canvas.height = 500;
  canvas.width = getBrowserWidth() * 0.5;
  canvas.height = getBrowserHeight() * 0.5;
  var center_x = canvas.width * 0.5;
  var center_y = canvas.width * 0.25;
  console.log('Canvas Width: ', canvas.width);
  console.log('Canvas Height: ', canvas.height);
  console.log('Canvas Center X: ', center_x);
  console.log('Canvas Center Y ', center_y);

  drawGhost(ctx, center_x, center_y)
});


/* base helper methods */

function get(id) { return document.getElementById(id); }

function getBrowserWidth() {
  return Math.max(
    document.body.scrollWidth,
    document.documentElement.scrollWidth,
    document.body.offsetWidth,
    document.documentElement.offsetWidth,
    document.documentElement.clientWidth
  );
}

function getBrowserHeight() {
  return Math.max(
    document.body.scrollHeight,
    document.documentElement.scrollHeight,
    document.body.offsetHeight,
    document.documentElement.offsetHeight,
    document.documentElement.clientHeight
  );
}

/**
 * [drawGhost description]
 * @param  {[string]} ctx [HTMLCanvasElement.getContext method]
 * @param  {[int]} center_x [x coordinate for center of canvas]
 * @param  {[int]} center_y [y coordinate for center of canvas]
 */

function drawGhost(ctx, center_x, center_y) {
  console.log(center_x, center_y);
  var x = center_x - 40;
  var y = center_y + 30;
  console.log(x, y);

  ctx.beginPath();
  ctx.strokeStyle = "black";
  ctx.lineWidth = "1";
  ctx.fillStyle = "rgba(255, 255, 255, 0.4";
  ctx.beginPath();

  // set drawing start point 
  ctx.moveTo(x, y);

  // define primary ghost shape
  ctx.quadraticCurveTo(x + 19, y - 90, x + 40, y);

  // define bottom part
  ctx.moveTo(x, y);
  ctx.quadraticCurveTo(x + 3, y + 4, x + 10, y);
  ctx.moveTo(x + 10, y);
  ctx.quadraticCurveTo(x + 12, y - 2, x + 20, y);
  ctx.moveTo(x + 20, y);
  ctx.quadraticCurveTo(x + 22, y + 4, x + 30, y);
  ctx.moveTo(x + 30, y);
  ctx.quadraticCurveTo(x + 35, y - 2, x + 40, y);

  // draw the ghost
  ctx.strokeStyle = "black";
  ctx.stroke();
  ctx.fill();
  ctx.closePath();

  // draw the eye circles
  ctx.fillStyle = "#000";
  ctx.beginPath();
  ctx.arc(x + 14, y - 29, 2, 0, Math.PI * 8, true);
  ctx.strokeStyle = "black";
  ctx.stroke();
  ctx.fill();
  ctx.beginPath();
  ctx.arc(x + 25, y - 29, 2, 0, Math.PI * 8, true);
  ctx.strokeStyle = "black";
  ctx.stroke();
  ctx.fill();
}

