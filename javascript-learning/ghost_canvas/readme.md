# Draw a Ghost with Canvas

* The majority of this code is from: https://loopandtouch.wordpress.com/2014/04/22/how-to-draw-a-ghost-in-html5-canvas/
* Modifications I made:
    * Added "use strict" statement
    * Used Arrow function for addEventListener
    * Removed the [0] from the end of `getElementsByTagName` in `var canvas`
    * Replaced `getElementsByTagName` with `getElementById`
    * Improved canvas setup and positioning
    * Added base helper methods:
        * `get(id)` abbreviates getElementById
        * `getBrowserWidth` and `getBrowserHeight` aid in calculating positioning for canvas and drawing setup
    * Replaced all instances of this.x and this.y with x and y
    * Renamed draw_ghost() to drawGhost()
    * Added DOCBLOC for drawGhost function
