const int ledPin = 13;

void setup()  {
    Serial.begin(9600);
    // sometimes weird data on startup?
    Serial.flush();
    pinMode(ledPin, OUTPUT);
}

void loop() {
}

/*
void serialEvent() {
    // if 2 or more bytes available, read them together
    if (Serial.available() > 0) {
    
        int d = Serial.read();
        //Serial.write(d);
        if (d == 'h') {
            digitalWrite(ledPin, HIGH);
        } else if (d == 'l') {
            digitalWrite(ledPin, LOW);
        }
    }
}*/
