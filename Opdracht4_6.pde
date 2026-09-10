float cijferEen = 5.5;
float cijferTwee = 6.7;
float cijferDrie = 8.4;
float gemmiddelde = 0;

gemmiddelde = (cijferEen + cijferTwee + cijferDrie) / 3;

gemmiddelde *= 10;
gemmiddelde = (int)gemmiddelde;
gemmiddelde /= 10;

println(gemmiddelde);
