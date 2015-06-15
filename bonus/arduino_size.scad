// Модель платы Arduino Mega 2560 R3
// Автор: "Кубъект Лаб", Парфенов Евгений
//	15.10.2014

// modified by Andrew Answer <mail@answe.ru> 2015/01/30

// http://blog.arduino.cc/2011/01/05/nice-drawings-of-the-arduino-uno-and-mega-2560/
// or sibrap/specs/arduino_mega_drawing.svg
// sizes in mils (0.001")
k=25.4/1000;

ArdX=101.6;	   // длина платы
ArdY=53.4; 		// ширина платы
ArdH=2;			// толщина платы
a=0;				// смещение отверстий от краев платы по X
b=0;				// смещение отверстий от краев платы по Y
usbX=(250+375)*k;//16;
usbY=(1725-1275)*k;//13;
usbH=10;
RampX=101.6;	
RampY=60.2;		
RampZ=15;		// Уточнить. Подъем RAMPS над Arduino

ArdPowX = (75+450)*k;
ArdPowY = (475-125)*k;

Arduino1 = [550,100,0]*k;
Arduino2 = [3800,100,0]*k;
Arduino3 = [600,2000,0]*k;
Arduino4 = [3550,2000,0]*k;
echo (Arduino1,Arduino2,Arduino3,Arduino4);

module specnut() {
difference() {
cylinder(10,r=6.6/2,$fn=6);
translate([0,0,-0.1])cylinder(10.2,r=3/2,$fn=16);
}
}

module Arduino (ArdX, ArdY, ArdH, a, b) {
difference () {
	cube ([ArdX,ArdY,ArdH]);
	translate (Arduino1+[a,b,-1]) cylinder (8,r=3/2,$fn=20);
	translate (Arduino2+[a,b,-1]) cylinder (8,r=3/2,$fn=20);
	translate (Arduino3+[a,b,-1]) cylinder (8,r=3/2,$fn=20);
	translate (Arduino4+[a,b,-1]) cylinder (8,r=3/2,$fn=20);

/*	translate ([13.97+a,2.54+b,-1]) cylinder (8,r=3/2,$fn=20);
	translate ([15.24+a,50.8+b,-1]) cylinder (8,r=3/2,$fn=20);
	translate ([96.52+a,2.54+b,-1]) cylinder (8,r=3/2,$fn=20);
	translate ([90.17+a,50.8+b,-1]) cylinder (8,r=3/2,$fn=20);
*/
}}

module arduino_ramps() {
union(){
	// Arduino - стандартный размер и расположение отверстий
	translate ([0,0,0]) Arduino (ArdX,ArdY,ArdH,a,b);
	// USB
	translate ([-250*k,1275*k,ArdH]) cube([usbX,usbY,usbH]);
	// Arduino power
	translate ([-75*k,125*k,ArdH]) cube([ArdPowX,ArdPowY,usbH]);
	// Reset button (here?)
	translate ([20,ArdY-RampY,ArdH+RampZ]) cube([5,5,5]);
}

union(){
	// RAMPS - измененный размер и другое расположение отверстий
	translate ([0,ArdY-RampY,RampZ]) rotate ([0,0,0]) Arduino (RampX,RampY,ArdH,0,RampY-ArdY);
// Закрытие отсутствующего отверстия
	translate ([90.17+a,50.8+b,RampZ]) cylinder (ArdH,r=3/2,$fn=20);

	translate (Arduino1+[a,b,-10])specnut();
	translate (Arduino2+[a,b,-10])specnut();
	translate (Arduino3+[a,b,-10])specnut();
}
}

arduino_ramps();