const int ledPin = 13;

const int leftTrack = 5;

void setup()  {
    Serial.begin(9600);
    // sometimes weird data on startup?
    Serial.flush();
    pinMode(ledPin, OUTPUT);
    pinMode(ledPin, OUTPUT);
}

void loop() {
}

void serialEvent() {
    // if 2 or more bytes available, read them together
    if (Serial.available() > 0) {
    
        int d = Serial.read();
        //analogWrite(leftTrack, d);
        
        
        if (d == 'h') {
            digitalWrite(ledPin, HIGH);
        } else if (d == 'l') {
            digitalWrite(ledPin, LOW);
        }
    }
}
