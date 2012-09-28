var rsp = require("serialport");
var xbee = require("xbee");
var SerialPort = rsp.SerialPort; // localize object constructor

// connect to xbee module on /dev/ttyUSB0 using serialport.
// Pass xbee.packetParser as the parser - that's it
var serial_xbee = new SerialPort("/dev/tty.usbmodem411", { 
  parser: xbee.packetParser()
});

// listen for incoming xbee data
serial_xbee.on("data", function(data) {
  console.log('xbee data received:', data.type);    
});



setInterval(function(){

  serial_xbee.write('H');
  console.log('H');
  setTimeout(function(){

    serial_xbee.write('L');
    console.log('L');
  },1000);

}, 3000);
