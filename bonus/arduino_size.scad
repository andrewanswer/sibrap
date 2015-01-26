
// Модель платы Arduino Mega 2560 R3
// Автор: "Кубъект Лаб", Парфенов Евгений
//	15.10.2014

ArdX=101.6;	// длина платы
ArdY=53.4; 		// ширина платы
ArdH=2;			// толщина платы
a=0;				// смещение отверстий от краев платы по X
b=0;				// смещение отверстий от краев платы по Y
usbX=16;
usbY=13;
usbH=10;
RampX=101.6;	
RampY=60.2;		
RampZ=15;		// Уточнить. Подъем RAMPS над Arduino

module Arduino (ArdX, ArdY, ArdH, a, b) {
difference () {
cube ([ArdX,ArdY,ArdH]);
	translate ([13.97+a,2.54+b,-1]) cylinder (8,r=3/2,$fn=20);
	#translate ([15.24+a,50.8+b,-1]) cylinder (8,r=3/2,$fn=20);
	translate ([96.52+a,2.54+b,-1]) cylinder (8,r=3/2,$fn=20);
	#translate ([90.17+a,50.8+b,-1]) cylinder (8,r=3/2,$fn=20);
}}

module USB (usbX, usbY, usbH) {
	// разъем USB - приблизительно
 cube ([usbX,usbY,usbH]);
}
union(){
	// Arduino - стандартный размер и расположение отверстий
	translate ([0,0,0]) 
Arduino (ArdX,ArdY,ArdH,a,b);
	translate ([-7,30,ArdH]) 
USB(usbX,usbY,usbH);
}

union(){
	// RAMPS - измененный размер и другое расположение отверстий
	translate ([0,ArdY-RampY,RampZ]) rotate ([0,0,0]) Arduino (RampX,RampY,ArdH,0,RampY-ArdY);
// Закрытие отсутствующего отверстия
	translate ([90.17+a,50.8+b,RampZ]) cylinder (ArdH,r=3/2,$fn=20);
}

//cube([10,20,30]);
echo("x1=",90.17-15.24);
echo("x2=",96.52-13.97);
echo("y=",50.8-2.54);