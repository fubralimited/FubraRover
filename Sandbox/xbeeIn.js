var serialport = require("serialport");
  var SerialPort = serialport.SerialPort; // localize object constructor
  
  var sp = new SerialPort("/dev/tty.usbmodem411", {
    parser: serialport.parsers.readline("\n")
  });

  sp.on("data", function (data) {
    console.log("here: "+data);
  });

setInterval(function(){
  //var cmd = '' + 'h' + '0';
	sp.write('h');
	console.log('H');
	setTimeout(function(){
    //var cmd = '' + 'l' + '0';
		sp.write('l');
		//console.log('L');
	},1500);

}, 4000);
