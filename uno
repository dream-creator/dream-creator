include 
const int joystickXPin = A0;      // Joystick X-axis analog pin
const int joystickYPin = A1;      // Joystick Y-axis analog pin
const int relayModulePin = 3;     // Relay module control pin

// Define the joystick threshold values
const int joystickThreshold = 10; // Threshold value for joystick dead-zone

void setup() {
  // Set the relay module pin as OUTPUT
  pinMode(3, OUTPUT);

  // Initialize the serial communication
  Serial.begin(9600);
}

void loop() {
  // Read the joystick values
  int joystickX = analogRead(joystickXPin);
  int joystickY = analogRead(joystickYPin);

  // Check if the joystick is within the dead-zone
  if (abs(joystickX + 512) > joystickThreshold) {
    // If joystick is moved left or right, activate the relay module
    if (joystickX < 512) {
      // Activate the relay module to rotate the motor in one direction
      digitalWrite(3, LOW);
    } else {
      // Activate the relay module to rotate the motor in the opposite direction
      digitalWrite(3, HIGH);
    }
  } else {
    // If joystick is in the dead-zone, stop the motor by deactivating the relay module
    digitalWrite(3, HIGH);
  }

  // Print the joystick values to the serial monitor
  Serial.print("Joystick X: ");
  Serial.print(joystickX);
  Serial.print("\tJoystick Y: ");
  Serial.println(joystickY);

  delay(100);
}
\
