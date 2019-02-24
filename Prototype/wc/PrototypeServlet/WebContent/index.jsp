<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="CSS/base.css">
  <link rel="stylesheet" href="CSS/layout.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous"></script>

  <script>
    // source:
    // https://browserleaks.com/canvas#how-does-it-work
    // https://www.darkwavetech.com/index.php/device-fingerprint-blog/canvas-device-print
    function fingerprint_canvas() {
      "use strict"; // feature in EXMAScript 5 - prevents some actions + more exceptions     

      var canvas = null;
      var canvasInput = null;
      var hash = null;
      var allSigns = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~1!2@3#4$5%6^7&8*9(0)-_=+[{]}|;:',<.>/?";

      try {
        // create canvas
        canvas = document.createElement('canvas');
        
        // fill canvas
        canvasInput = canvas.getContext('2d');
        canvasInput.textBaseline = "top";
        canvasInput.font = "14px 'Arial'";
        canvasInput.textBaseline = "alphabetic";
        canvasInput.fillStyle = "#f60";
        canvasInput.fillRect(125, 1, 62, 20);
        canvasInput.fillStyle = "#069";
        canvasInput.fillText(allSigns, 2, 15);
        canvasInput.fillStyle = "rgba(102, 204, 0, 0.7)";
        canvasInput.fillText(allSigns, 4, 17);

        // create hash
        hash = canvas.toDataURL();
        console.log(hash);

        // send hash to servlet
        $.ajax({
          type: 'POST',
          data: { hash: hash },
          url: 'Fingerprinting',
          success: function (result) {
            $('#result1').html(result);
          }
        });

        return hash;
      } catch (errorMsg) {
        //console.log("An error occured: " + errorMsg)
        return "An unexpected error occured";
      }
    }


  </script>

  <title>Prototype</title>
</head>

<body>
  <div id="header-content" class="header-content">
    <h3>Web Browser Fingerprinting Prototype</h3>
  </div>

  <div class="page-content">
  
	<div class="well">
	Add here what fingerprinting is and that this prototype was created im rahmen of my Bachelorthesis and 
	that it should show how canvas fingerprinting and browser fingerprinting.
	Add that each fingerprint creates own hash - not compatible as canvas gets bit from canvas and browser creates own.
	</div>

    <div class="panel panel-info">
      <div class="panel-heading">
        <a data-toggle="collapse" href="#CanvasFP">
          <h4 class="panel-title">Canvas Fingerprinting</h4>
        </a>
      </div>
      <div id="CanvasFP" class="panel-collapse collapse collapse in">
       <div class="panel-body">Explanation etc.
          how does it work, what's its weakness
        </div>
        <div class="panel-footer" id="result1">
          <button type="button" class="btn btn-info" onclick="fingerprint_canvas();">Check Canvas Fingerprint</button>
        </div>
      </div>
    </div>
    
    <div class="panel panel-info">
      <div class="panel-heading">
        <a data-toggle="collapse" href="#BrowserFP">
          <h4 class="panel-title">Browser Fingerprinting</h4>
        </a>
      </div>
      <div id="BrowserFP" class="panel-collapse collapse collapse in">
       <div class="panel-body">Explanation etc.
          how does it work, what's its weakness
        </div>
        <div class="panel-footer" id="result1">
         <button type="button" class="btn btn-info" onclick="fingerprint_canvas();">Check Browser Fingerprint</button>
        </div>
      </div>
    </div>

    <div class="panel panel-info">
      <div class="panel-heading">
        <a data-toggle="collapse" href="#Evaluation">
          <h4 class="panel-title">Evaluation</h4>
        </a>
      </div>
      <div id="Evaluation" class="panel-collapse collapse collapse in">
        <div class="panel-body">
        This prototype was tested on X devices and on Y different browser.
        
        <div class="table-content">
         <div class="row" style="font-weight: bold;">
		    <div class="col-md-2"></div>
		    <div class="col-sm-2">Chrome</div>
		    <div class="col-sm-2">Mozilla Firefox</div>
		    <div class="col-sm-2">Opera</div>
		    <div class="col-sm-2">Microsoft Edge</div>
		    <div class="col-sm-2">Safari</div>
		  </div>
		  <div class="row" style="background-color: #e5e5e0;">
		    <div class="col-md-2" style="font-weight: bold;">Windows</div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		  </div>
		  <div class="row">
		    <div class="col-md-2" style="font-weight: bold;">Mac OS</div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		  </div>
		  <div class="row" style="background-color: #e5e5e0;">
		    <div class="col-md-2" style="font-weight: bold;">Linux</div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		    <div class="col-sm-1"></div>
		  </div>
        </div>
        </div>
      </div>
    </div>
  </div>
</body>

<footer>
  <div class=footer>
    by Janine Denise Mayer
  </div>
</footer>

</html>