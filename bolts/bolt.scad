use <cross_bolt.scad>

// DIN 7985
// http://www.tdm-neva.ru/screws/din-7985-vint.htm

//sizes=[10,12,16,20,25,30,35,40,50,60];
//metric=[3,4,5,6,8];
sizes=[10,12,16,20,25];
//sizes=[30,35,40,50,60];
metric=[8];
k=0;
l=0;
for(s=sizes) {							
	for(m=metric) {
		translate([(s-10)*10,(m-3)*20,0])cross_bolt(m,s);
	}
}	