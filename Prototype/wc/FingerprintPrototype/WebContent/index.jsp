<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/base.css">
<link rel="stylesheet" href="CSS/layout.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

<script>
	/**
	 * JavaScript code to detect available availability of a
	 * particular font in a browser using JavaScript and CSS.
	 *
	 * Author : Lalit Patel
	 * Website: http://www.lalit.org/lab/javascript-css-font-detect/
	 * License: Apache Software License 2.0
	 *          http://www.apache.org/licenses/LICENSE-2.0
	 */

	var Detector = function() {
		// a font will be compared against all the three default fonts.
		// and if it doesn't match all 3 then that font is not available.
		var baseFonts = [ 'monospace', 'sans-serif', 'serif' ];

		//we use m or w because these two characters take up the maximum width.
		// And we use a LLi so that the same matching fonts can get separated
		var testString = "mmmmmmmmmmlli";

		//we test using 72px font size, we may use any size. I guess larger the better.
		var testSize = '72px';

		var h = document.getElementsByTagName("body")[0];

		// create a SPAN in the document to get the width of the text we use to test
		var s = document.createElement("span");
		s.style.fontSize = testSize;
		s.innerHTML = testString;
		var defaultWidth = {};
		var defaultHeight = {};
		for ( var index in baseFonts) {
			//get the default width for the three base fonts
			s.style.fontFamily = baseFonts[index];
			h.appendChild(s);
			defaultWidth[baseFonts[index]] = s.offsetWidth; //width for the default font
			defaultHeight[baseFonts[index]] = s.offsetHeight; //height for the defualt font
			h.removeChild(s);
		}

		function detect(font) {
			var detected = false;
			for ( var index in baseFonts) {
				s.style.fontFamily = font + ',' + baseFonts[index]; // name of the font along with the base font for fallback.
				h.appendChild(s);
				var matched = (s.offsetWidth != defaultWidth[baseFonts[index]] || s.offsetHeight != defaultHeight[baseFonts[index]]);
				h.removeChild(s);
				detected = detected || matched;
			}
			return detected;
		}

		this.detect = detect;
	};

	function get_fonts() {
		var fonts = [ "Arial", "	Helvetica", "Verdana", "Comic Sans",
				"Windings", "Webdings", "Georgia", "Rotterdalle", "Sweet Cake",
				"Coldiac", "Kilauea", "Blacker", "Rubik", "Cormorant" ];
		var fontDetector = new Detector();
		var fontExist = "";
		for (var i = 0; i < fonts.length; i++) {
			fontExist += fontDetector.detect(fonts[i]) + " - ";
		}
		return fontExist;
	}

	function get_graphicCard() {
		var canvas = document.createElement('canvas');
		var gl;
		var debugInfo;
		var vendor;
		var renderer;

		try {
			gl = canvas.getContext('webgl')
					|| canvas.getContext('experimental-webgl');
		} catch (e) {
		}

		if (gl) {
			debugInfo = gl.getExtension('WEBGL_debug_renderer_info');
			vendor = gl.getParameter(debugInfo.UNMASKED_VENDOR_WEBGL);
			renderer = gl.getParameter(debugInfo.UNMASKED_RENDERER_WEBGL);
		}

		return renderer;
	}

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

			canvasInput.font = "9px 'Times New Roman'";
			canvasInput.textBaseline = "middle";
			canvasInput.fillStyle = "#0fd2ee";
			canvasInput.fillRect(10, 10, 10, 10);
			canvasInput.fillStyle = "#ff00a7";
			canvasInput.fillText(allSigns, 10, 25);
			canvasInput.fillStyle = "rgba(99, 66, 33, 0.1)";
			canvasInput.fillText(allSigns, 20, 47);

			canvasInput.font = "21px 'Georgia'";
			canvasInput.textBaseline = "hanging";
			canvasInput.fillStyle = "#2e2c9b";
			canvasInput.fillRect(25, 17, 32, 22);
			canvasInput.fillStyle = "#813338";
			canvasInput.fillText(allSigns, 20, 51);
			canvasInput.fillStyle = "rgba(120, 200, 70, 0.4)";
			canvasInput.fillText(allSigns, 43, 71);

			// create hash + add graphicCard (as hash not always unique)
			hash = get_graphicCard() + " | " + canvas.toDataURL();
			console.log(hash);

			// send hash to servlet
			$.ajax({
				type : 'POST',
				data : {
					method : 'canvas',
					hash : hash
				},
				url : 'Fingerprinting',
				success : function(result) {
					$('#result1').html(result);
				}
			});

			return hash;
		} catch (errorMsg) {
			//console.log("An error occured: " + errorMsg)
			return "An unexpected error occured";
		}
	}

	function fingerprint_browser() {
		"use strict";

		var hash = null;

		try {
			// timezone
			var date1 = new Date(2019, 0, 1);
			var date2 = new Date(2019, 6, 1);
			var date1Offset = date1.getTimezoneOffset();
			var date2Offset = date2.getTimezoneOffset();

			// language
			var language = navigator.language ? navigator.language
					: "undefined";
			var languages = navigator.languages ? navigator.languages
					: "undefined";
			// there are MS specified properties (navigator.browserlanguage)
			// not used - as prototype for multiple OS

			// java enabled
			var javaEnabled = navigator.javaEnabled() ? true : false;

			// display
			if (window.screen) {
				var screenAvailWidth = window.screen.availWidth;
				var screenAvailHeight = window.screen.availHeight;
				var screenWidth = window.screen.width;
				var screenHeight = window.screen.height;
				var screenColorDepth = window.screen.colorDepth;
			}

			// useragent string
			var uas = navigator.userAgent;

			// further settings
			var cookieEnabled = navigator.cookieEnabled;
			var doNotTrack = navigator.doNotTrack;
			var cores = window.navigator.hardwareConcurrency;
			var touchPoints = navigator.maxTouchPoints;

			// plugins
			var pluginCount = navigator.plugins.length;
			var plugins = "";

			for (var i = 0; i < pluginCount; i++) {
				var version = navigator.plugins[i].version ? navigator.plugins[i].version
						: "x";
				plugins += navigator.plugins[i].name + ", "
						+ navigator.plugins[i].description + "(" + version
						+ "), " + navigator.plugins[i].filename + " | ";
			}

			hash = uas + " | " + screenAvailWidth + " | " + screenAvailHeight
					+ " | " + screenWidth + " | " + screenHeight + " | "
					+ screenWidth + " | " + screenColorDepth + " | "
					+ javaEnabled + " | " + language + " | " + languages
					+ " | " + date2Offset + " | " + date1Offset + " | "
					+ cookieEnabled + " | " + doNotTrack + " | " + cores
					+ " | " + touchPoints + " | " + pluginCount + " | "
					+ plugins + get_fonts() + get_graphicCard();

			console.log(hash);

			// send hash to servlet
			$.ajax({
				type : 'POST',
				data : {
					method : 'browser',
					hash : hash
				},
				url : 'Fingerprinting',
				success : function(result) {
					$('#result2').html(result);
				}
			});

			return hash;
		} catch (errorMsg) {
			console.log("An error occured: " + errorMsg)
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

		<div class="well">This web browser fingerprinting prototype was
			created as part of a bachelor thesis. Its purpose is to present the
			two fingerprinting techniques "canvas fingerprinting" and "browser
			fingerprinting".</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<a data-toggle="collapse" href="#CanvasFP">
					<h4 class="panel-title">Canvas Fingerprinting</h4>
				</a>
			</div>
			<div id="CanvasFP" class="panel-collapse collapse collapse in">
				<div class="panel-body">Canvas Fingerprinting uses the HTML5
					canvas element to render text and color to the browser. The
					canvas.toDataURL() method is used to create a hash using the pixels
					of the created canvas.</div>
				<div class="panel-footer" id="result1">
					<button type="button" class="btn btn-info"
						onclick="fingerprint_canvas();">Check Canvas Fingerprint</button>
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
				<div class="panel-body">Browser fingerprinting uses various
					characteristics like language and screen properties to create a
					hash.</div>
				<div class="panel-footer" id="result2">
					<button type="button" class="btn btn-info"
						onclick="fingerprint_browser();">Check Browser
						Fingerprint</button>
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
				<div class="panel-body">This prototype was tested on multiple
					computers and mobile phones. In the course of this evaluation each
					of the 25 created browser and the 25 created canvas hashes turned
					out to be individual.</div>
			</div>
		</div>
	</div>
</body>

<footer>
<div class=footer>by Janine Denise Mayer</div>
</footer>

</html>