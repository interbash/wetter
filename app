var weather;

/*Nummerierung: 
*0 = aktuell
*1 = 1h
*2 = 2h
*3 = 6h
*4 = 12h
*5 = 24h
*6 = 2d
*7 = 3d
*8 = 5d
*9 = 7d

1* = München
2* = Berlin
3* = Köln
4* = Stuttgart
*/

var temp = new Array();
var humidity = new Array();
var wind = new Array();
let nieders = new Array();
let Stadt = new Array();
Stadt = ["München", "Berlin", "Köln", "Hamburg"];


var f = 1;
var Seite = 1;
var vorSeite = Seite;
var u = 0;
//var h = 0;

urlMUC = 'https://api.openweathermap.org/data/2.5/onecall?lat=48.137428&lon=11.57549&appid=bf26c147ec8bf4877dea8f5c2021d75b&units=metric';
urlBER = 'https://api.openweathermap.org/data/2.5/onecall?lat=52.520008&lon=13.404954&appid=bf26c147ec8bf4877dea8f5c2021d75b&units=metric';
urlKOL = 'https://api.openweathermap.org/data/2.5/onecall?lat=50.935173&lon=6.953101&appid=bf26c147ec8bf4877dea8f5c2021d75b&units=metric';
urlHH = 'https://api.openweathermap.org/data/2.5/onecall?lat=53.551086&lon=9.993682&appid=bf26c147ec8bf4877dea8f5c2021d75b&units=metric';


function setup (){
  millis();
  createCanvas (1500, 800);
  background(200);
  Hintergrund();
  loadJSON(urlMUC, gotDataMUC);
  loadJSON(urlBER, gotDataBER);
  loadJSON(urlKOL, gotDataKOL);
  loadJSON(urlHH, gotDataHH);
  //setInterval(Upload, 180000);
  setInterval(Upload, 50000);
  
  var firebaseConfig = {
    apiKey: "AIzaSyD6N-Xls-c1dMJOmDz9_ShmwPVbpUC6Pns",
    authDomain: "wetterapp-a4e50.firebaseapp.com",
    databaseURL: "https://wetterapp-a4e50.firebaseio.com",
    projectId: "wetterapp-a4e50",
    storageBucket: "wetterapp-a4e50.appspot.com",
    messagingSenderId: "400733481596",
    appId: "1:400733481596:web:37725cf3b8dcb4477d37f9"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  console.log(firebase);
  button1 = createButton('Weiter');
  button1.position(150, 600);
  button1.mousePressed(einsweiter);
  button2 = createButton('Zurück');
  button2.position(50, 600);
  button2.mousePressed(einszurueck);

  if (Seite = 1) {
    drawSeite();
    console.log('Seite Eins')
  }
}


function gotDataMUC(data){
  weather = data;
  //*************************Temperatur
  temp = [
    weather.current.temp,
    weather.hourly[1].temp,
    weather.hourly[2].temp,
    weather.hourly[6].temp,
    weather.hourly[12].temp,
    weather.hourly[24].temp,
    weather.daily[1].temp.day,
    weather.daily[3].temp.day,
    weather.daily[5].temp.day,
    weather.daily[7].temp.day
  ];

  //*************************luftfeuchte
  humidity = [
    weather.current.humidity,
    weather.hourly[1].humidity,
    weather.hourly[2].humidity,
    weather.hourly[6].humidity,
    weather.hourly[12].humidity,
    weather.hourly[24].humidity,
    weather.daily[2].humidity,
    weather.daily[3].humidity,
    weather.daily[5].humidity,
    weather.daily[7].humidity
  ];

  //*************************Wind
  wind = [
    weather.current.wind_speed,
    weather.hourly[1].wind_speed,
    weather.hourly[2].wind_speed,
    weather.hourly[6].wind_speed,
    weather.hourly[12].wind_speed,
    weather.hourly[24].wind_speed,
    weather.daily[2].wind_speed,
    weather.daily[3].wind_speed,
    weather.daily[5].wind_speed,
    weather.daily[7].wind_speed
  ];

  //*************************Niederschlag
  nieders = [
    weather.current.weather[0].description,
    weather.hourly[1].weather[0].description,
    weather.hourly[2].weather[0].description,
    weather.hourly[6].weather[0].description,
    weather.hourly[12].weather[0].description,
    weather.hourly[24].weather[0].description,
    weather.daily[2].weather[0].description,
    weather.daily[3].weather[0].description,
    weather.daily[5].weather[0].description,
    weather.daily[7].weather[0].description
  ];
}

function gotDataBER(data){
  weather = data;
  //*************************Temperatur
  temp.push(
    weather.current.temp,
    weather.hourly[1].temp,
    weather.hourly[2].temp,
    weather.hourly[6].temp,
    weather.hourly[12].temp,
    weather.hourly[24].temp,
    weather.daily[1].temp.day,
    weather.daily[3].temp.day,
    weather.daily[5].temp.day,
    weather.daily[7].temp.day
  );

  //*************************luftfeuchte
  humidity.push(
    weather.current.humidity,
    weather.hourly[1].humidity,
    weather.hourly[2].humidity,
    weather.hourly[6].humidity,
    weather.hourly[12].humidity,
    weather.hourly[24].humidity,
    weather.daily[2].humidity,
    weather.daily[3].humidity,
    weather.daily[5].humidity,
    weather.daily[7].humidity
  );

  //*************************Wind
  wind.push(
    weather.current.wind_speed,
    weather.hourly[1].wind_speed,
    weather.hourly[2].wind_speed,
    weather.hourly[6].wind_speed,
    weather.hourly[12].wind_speed,
    weather.hourly[24].wind_speed,
    weather.daily[2].wind_speed,
    weather.daily[3].wind_speed,
    weather.daily[5].wind_speed,
    weather.daily[7].wind_speed
  );

  //*************************Niederschlag
  nieders.push(
    weather.current.weather[0].description,
    weather.hourly[1].weather[0].description,
    weather.hourly[2].weather[0].description,
    weather.hourly[6].weather[0].description,
    weather.hourly[12].weather[0].description,
    weather.hourly[24].weather[0].description,
    weather.daily[2].weather[0].description,
    weather.daily[3].weather[0].description,
    weather.daily[5].weather[0].description,
    weather.daily[7].weather[0].description
  );
  
}

function gotDataKOL(data){
  weather = data;
  //*************************Temperatur
  temp.push(
    weather.current.temp,
    weather.hourly[1].temp,
    weather.hourly[2].temp,
    weather.hourly[6].temp,
    weather.hourly[12].temp,
    weather.hourly[24].temp,
    weather.daily[1].temp.day,
    weather.daily[3].temp.day,
    weather.daily[5].temp.day,
    weather.daily[7].temp.day
  );
  console.log(temp);

  //*************************luftfeuchte
  humidity.push(
    weather.current.humidity,
    weather.hourly[1].humidity,
    weather.hourly[2].humidity,
    weather.hourly[6].humidity,
    weather.hourly[12].humidity,
    weather.hourly[24].humidity,
    weather.daily[2].humidity,
    weather.daily[3].humidity,
    weather.daily[5].humidity,
    weather.daily[7].humidity
  );
  console.log(humidity);

  //*************************Wind
  wind.push(
    weather.current.wind_speed,
    weather.hourly[1].wind_speed,
    weather.hourly[2].wind_speed,
    weather.hourly[6].wind_speed,
    weather.hourly[12].wind_speed,
    weather.hourly[24].wind_speed,
    weather.daily[2].wind_speed,
    weather.daily[3].wind_speed,
    weather.daily[5].wind_speed,
    weather.daily[7].wind_speed
  );

  console.log(wind);

  //*************************Niederschlag
  nieders.push(
    weather.current.weather[0].description,
    weather.hourly[1].weather[0].description,
    weather.hourly[2].weather[0].description,
    weather.hourly[6].weather[0].description,
    weather.hourly[12].weather[0].description,
    weather.hourly[24].weather[0].description,
    weather.daily[2].weather[0].description,
    weather.daily[3].weather[0].description,
    weather.daily[5].weather[0].description,
    weather.daily[7].weather[0].description
  );
}

function gotDataHH(data){
   weather = data;
  //*************************Temperatur
  temp.push(
    weather.current.temp,
    weather.hourly[1].temp,
    weather.hourly[2].temp,
    weather.hourly[6].temp,
    weather.hourly[12].temp,
    weather.hourly[24].temp,
    weather.daily[1].temp.day,
    weather.daily[3].temp.day,
    weather.daily[5].temp.day,
    weather.daily[7].temp.day
  );
  console.log(temp);

  //*************************luftfeuchte
  humidity.push(
    weather.current.humidity,
    weather.hourly[1].humidity,
    weather.hourly[2].humidity,
    weather.hourly[6].humidity,
    weather.hourly[12].humidity,
    weather.hourly[24].humidity,
    weather.daily[2].humidity,
    weather.daily[3].humidity,
    weather.daily[5].humidity,
    weather.daily[7].humidity
  );
  console.log(humidity);

  //*************************Wind
  wind.push(
    weather.current.wind_speed,
    weather.hourly[1].wind_speed,
    weather.hourly[2].wind_speed,
    weather.hourly[6].wind_speed,
    weather.hourly[12].wind_speed,
    weather.hourly[24].wind_speed,
    weather.daily[2].wind_speed,
    weather.daily[3].wind_speed,
    weather.daily[5].wind_speed,
    weather.daily[7].wind_speed
  );

  console.log(wind);

  //*************************Niederschlag
  nieders.push(
    weather.current.weather[0].description,
    weather.hourly[1].weather[0].description,
    weather.hourly[2].weather[0].description,
    weather.hourly[6].weather[0].description,
    weather.hourly[12].weather[0].description,
    weather.hourly[24].weather[0].description,
    weather.daily[2].weather[0].description,
    weather.daily[3].weather[0].description,
    weather.daily[5].weather[0].description,
    weather.daily[7].weather[0].description
  );
}

function Upload() {
  for(let h = 0; h  < 4; h++){
  firebase.database().ref(Stadt[h] + '/' + 'Temperatur aktuell/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[0]);
  firebase.database().ref(Stadt[h] + '/' + 'Temperatur 1h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[1]);
  firebase.database().ref(Stadt[h] + '/'  + 'Temperatur 2h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[2]);
  firebase.database().ref(Stadt[h] + '/'  + 'Temperatur 6h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[3]);
  firebase.database().ref(Stadt[h] + '/'  + 'Temperatur 12h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[4]);
  firebase.database().ref(Stadt[h] + '/'  + 'Temperatur 24h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[5]);
  firebase.database().ref(Stadt[h] + '/'  + 'Temperatur 2d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[6]);
  firebase.database().ref(Stadt[h] + '/'  + 'Temperatur 3d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[7]);
  firebase.database().ref(Stadt[h] + '/'  + 'Temperatur 5d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[7]);
  firebase.database().ref(Stadt[h] + '/'  + 'Temperatur 7d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + temp[9]);

  firebase.database().ref(Stadt[h] + '/'  + 'Humidity aktuell/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[0]);
  firebase.database().ref(Stadt[h] + '/'  + 'Humidity 1h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[1]);
  firebase.database().ref(Stadt[h] + '/'  + 'Humidity 2h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[2]);
  firebase.database().ref(Stadt[h] + '/'  + 'Humidity 6h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[3]);
  firebase.database().ref(Stadt[h] + '/'  + 'Humidity 12h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[4]);
  firebase.database().ref(Stadt[h] + '/'  + 'Humidity 24h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[5]);
  firebase.database().ref(Stadt[h] + '/'  + 'Humidity 2d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[6]);
  firebase.database().ref(Stadt[h] + '/'  + 'Humidity 3d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[7]);
  firebase.database().ref(Stadt[h] + '/'  + 'Humidity 5d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[8]);
  firebase.database().ref(Stadt[h] + '/'  + 'Humidity 7d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[9]);

  firebase.database().ref(Stadt[h] + '/'  + 'Wind aktuell/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[0]);
  firebase.database().ref(Stadt[h] + '/'  + 'Wind 1h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[1]);
  firebase.database().ref(Stadt[h] + '/'  + 'Wind 2h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[2]);
  firebase.database().ref(Stadt[h] + '/'  + 'Wind 6h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[3]);
  firebase.database().ref(Stadt[h] + '/'  + 'Wind 12h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[4]);
  firebase.database().ref(Stadt[h] + '/'  + 'Wind 24h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[5]);
  firebase.database().ref(Stadt[h] + '/'  + 'Wind 2d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[6]);
  firebase.database().ref(Stadt[h] + '/'  + 'Wind 3d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[7]);
  firebase.database().ref(Stadt[h] + '/'  + 'Wind 5d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[8]);
  firebase.database().ref(Stadt[h] + '/'  + 'Wind 7d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[9]);

  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag aktuell/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[0]);
  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag 1h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[1]);
  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag 2h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[2]);
  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag 6h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[3]);
  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag 12h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[4]);
  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag 24h/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[5]);
  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag 2d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[6]);
  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag 3d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[7]);
  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag 5d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[8]);
  firebase.database().ref(Stadt[h] + '/'  + 'Niederschlag 7d/' + day() + ' ' + month() + ' ' + year() + ' ' + hour() + ':' + minute()).set('' + humidity[9]);
  };
  
 print('Zeit is um');
}

function drawSeite() {
  u = Seite;
  f = (u *10);

  if(Seite != vorSeite){
    Hintergrund();
  }

  console.log('f', f);
  console.log(f + 1);
  //console.log("Temp u + 1", temp[f + 1]);
  console.log("temp20", temp[20]);

  textSize(20);
  rectMode(CENTER);

  //*************************Stadt
  text(Stadt[u], 20, 60);

  //*************************Temperatur
  text(temp[f + 0], 170, 150);
  text(temp[f + 1], 290, 150);
  text(temp[f + 2], 410, 150);
  text(temp[f + 3], 530, 150);
  text(temp[f + 4], 660, 150);
  text(temp[f + 5], 780, 150);
  text(temp[f + 6], 900, 150);
  text(temp[f + 7], 1020, 150);
  text(temp[f + 8], 1140, 150);
  text(temp[f + 9], 1260, 150);
  //console.log(f);

  //*************************luftfeuchte
  text(humidity[f + 0], 170, 250);
  text(humidity[f + 1], 290, 250);
  text(humidity[f + 2], 410, 250);
  text(humidity[f + 3], 530, 250);
  text(humidity[f + 4], 660, 250);
  text(humidity[f + 5], 780, 250);
  text(humidity[f + 6], 900, 250);
  text(humidity[f + 7], 1020, 250);
  text(humidity[f + 8], 1140, 250);
  text(humidity[f + 9], 1260, 250);

  //*************************Wind
  text(wind[f + 0], 170, 350);
  text(wind[f + 1], 290, 350);
  text(wind[f + 2], 410, 350);
  text(wind[f + 3], 530, 350);
  text(wind[f + 4], 660, 350);
  text(wind[f + 5], 780, 350);
  text(wind[f + 6], 900, 350);
  text(wind[f + 7], 1020, 350);
  text(wind[f + 8], 1140, 350);
  text(wind[f + 9], 1260, 350);

  //*************************Niederschlag
  textSize(16)
  text(nieders[f + 0], 145, 430,);
  text(nieders[f + 1], 265, 470);
  text(nieders[f + 2], 385, 430);
  text(nieders[f + 3], 505, 470);
  text(nieders[f + 4], 625, 430);
  text(nieders[f + 5], 745, 470);
  text(nieders[f + 6], 870, 430);
  text(nieders[f + 7], 985, 470);
  text(nieders[f + 8], 1105, 430);
  text(nieders[f + 9], 1225, 470);
}

function Hintergrund(){
  rectMode(CORNER),
  rect(0, 0, 1500, 800)
  line(140, 0, 140, 500)
  line(260, 0, 260, 500)
  line(380, 0, 380, 500)
  line(500, 0, 500, 500)
  line(620, 0, 620, 500)
  line(740, 0, 740, 500)
  line(860, 0, 860, 500)
  line(980, 0, 980, 500)
  line(1100, 0, 1100, 500)
  line(1220, 0, 1220, 500)
  line(1340, 0, 1340, 500)
  line(0, 100, 1340, 100)
  line(0, 200, 1340, 200)
  line(0, 300, 1340, 300)
  line(0, 400, 1340, 400)
  line(0, 500, 1340, 500)
  textSize(20)
  text('Temperatur', 10, 150)
  text('Luftfeuchte', 10, 250)
  text('Wind', 10, 350)
  text('Niederschlag', 10, 450)
  text('Aktuell', 170, 50)
  text('1 Stunde', 280, 50)
  text('2 Stunden', 400, 50)
  text('6 Stunden', 520, 50)
  text('12 Stunden', 630, 50)
  text('24 Stunden', 750, 50)
  text('2 Tage', 870, 50)
  text('3 Tage', 1010, 50)
  text('5 Tage', 1130, 50)
  text('7 Tage', 1250, 50)
}

function einsweiter () {
  Seite++;
  console.log('Weiter', Seite)
  //console.log(Seite);
  if(vorSeite != Seite) {
    drawSeite();
  }
  vorSeite = Seite;
}
function einszurueck () {
  Seite--;
  console.log('Zurück', Seite)
  //console.log(Seite);
  if(Seite != vorSeite) {
    drawSeite();
  }
  vorSeite = Seite;
}


