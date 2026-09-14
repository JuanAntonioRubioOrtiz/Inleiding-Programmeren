float gewichtVariabele = 110;
float lengteVariabele = 1.80;
String gewicht = "kg";
String lengte = "m";

float BMI = 0;

BMI = gewichtVariabele / (lengteVariabele * lengteVariabele);

BMI = round(BMI);

print("Met een gewicht van ");
print(gewichtVariabele + gewicht);
print(" en een lengte van ");
print(lengteVariabele + lengte);
print(", is jouw BMI " + BMI);
