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




<script src="http://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

<script>
function fingerprint_canvas() {
	"use strict";
    var strOnError, canvas, strCText, strText, strOut;

    strOnError = "Error";
    canvas = null;
    strCText = null;
    strText = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~1!2@3#4$5%6^7&8*9(0)-_=+[{]}|;:',<.>/?";
    strOut = null;

    try {
        canvas = document.createElement('canvas');
        strCText = canvas.getContext('2d');
        strCText.textBaseline = "top";
        strCText.font = "14px 'Arial'";
        strCText.textBaseline = "alphabetic";
        strCText.fillStyle = "#f60";
        strCText.fillRect(125, 1, 62, 20);
        strCText.fillStyle = "#069";
        strCText.fillText(strText, 2, 15);
        strCText.fillStyle = "rgba(102, 204, 0, 0.7)";
        strCText.fillText(strText, 4, 17);
        strOut = canvas.toDataURL();
        console.log(strOut);

        var hash = strOut;
        
        $.ajax({
			type:'POST',
			data: {hash: hash},
			url: 'Fingerprinting',
			success: function(result) {
				$('#result1').html(result);
			}
		});
    } catch (err) {
        return strOnError;
    }
}
</script>

<title>Prototype</title>
</head>
<body>
	<div id="header-content" class="header-content">
    <h2>Web Browser Fingerprinting Prototype</h2>
  </div>

<div class="page-content">
    <button type="button" class="btn btn-info" onclick="fingerprint_canvas();">Check Fingerprint</button>
    <div class="panel panel-info">
      <div class="panel-body" id="result1"></div>
    </div>


    <div class="panel-group">
      <div class="panel panel-info">
        <div class="panel-heading">
          <a data-toggle="collapse" href="#CanvasFP">
            <h4 class="panel-title">Canvas Fingerprinting</h4>
          </a>
        </div>
        <div id="CanvasFP" class="panel-collapse collapse">
          <div class="panel-body">Explanation etc. 
          
          
          </div>
          <div class="panel-footer">if multiple FP techniques -> here button</div>
        </div>
      </div>

      <div class="panel panel-info">
        <div class="panel-heading">
          <a data-toggle="collapse" href="#Mitigation">
            <h4 class="panel-title">Mitigation</h4>
          </a>
        </div>
        <div id="Mitigation" class="panel-collapse collapse">
          <div class="panel-body">Ways to mitigate fingerprinting</div>
        </div>
      </div>
    </div>
    
    <div class="panel panel-info">
        <div class="panel-heading">
          <a data-toggle="collapse" href="#Evaluation">
            <h4 class="panel-title">Evaluation</h4>
          </a>
        </div>
        <div id="Evaluation" class="panel-collapse collapse">
          <div class="panel-body">Where the prototype was tested</div>
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