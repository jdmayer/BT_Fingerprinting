// code from: https://www.darkwavetech.com/index.php/device-fingerprint-blog/canvas-device-print

function fingerprint_canvas() {
    console.log("generate fingerprint");
    
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
        return strOut;
    } catch (err) {
        return strOnError;
    }
    
    

    //readFromFile();
    //saveToFile(jsonData);
}

function saveToFile(jsonData) {
    console.log("save to file");
    //console.log(JSON.stringify(jsonData));


    /*
    // download file
    try {
        var b = new Blob([(JSON.stringify(jsonData))],{type:"text/plain;charset=utf-8"});
        saveAs(b, "filex.txt");
    } catch (e) {
        window.open("error occured", '_blank','');
    }
    */

}

function readFromFile() {
    console.log("read from file");

    /*
    data = loadJSON("Data_CanvasFingerprinting.json");
    console.log(data);
    
    // does not work in chrome
    fetch('Data_CanvasFingerprinting.json')
        .then(response => response.json())
        .then(jsonResponse => console.log(jsonResponse))
        .then(console.log("tried"));
    */

    "use strinct";

    var myInit =  { method: 'GET', 
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    mode: 'cors',
                    cache: 'default'
                };
    let myRequest = new Request("./Data_CanvasFingerprinting.json", myInit);

    fetch(myRequest).then(function(resp) {
        return resp.json();
    }).then(function(data){
        console.log(JSON.stringify(data.users));
        data.forEach(function(entry){
            console.log("-- " + entry.hash);
        })

    });

    console.log("fetched data");
}



function saveToExcel() {
    console.log("saving");
    var fs; // = require("fs");
    var sampleObject = {
        a: 1,
        b: 2,
        c: {
            x: 11,
            y: 22
        }
    };

    fs.writeFile("./object.json", JSON.stringify(sampleObject, null, 4), (err) => {
        if (err) {
            console.error(err);
            return;
        };
        console.log("File has been created");
    });


}