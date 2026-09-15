float cijfer = 5.7;
boolean diploma = false;
boolean cumlaude = false;

if(cijfer >= 5.5){
diploma = true;
}

if(cijfer >= 8.0){
  cumlaude = true;
}

if(diploma || cumlaude){
println("Gefeliciteerd!");
}
