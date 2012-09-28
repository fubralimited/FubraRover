var SerialPort = require("serialport");
var fs = require("fs");
var port = '/dev/tty.usbmodem411';
var baudrate = 9600;
var active = false;

var serialPort = new SerialPort.SerialPort(port, {
          baudrate: baudrate
        });
serialPort.on("data", function (data) {
  serialPort.write("OMG IT WORKS\r");
});