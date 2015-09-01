// библиотечная функция - прямоугольная призма
/*
 * a - вектор [x,y,z] - куб, в который вписана призма
 * orient - строка "x"/"y"/"z" - ориентация треугольной грани призмы
 * center - логическое true/false - позиционирование относительно центра или с угла
 *
 * Автор - Andrew Answer (Андрей Нуждов): http://answe.ru
 * Сделано для проекта SibRap: http://reprap.org/wiki/SibRap
 * GitHub: https://github.com/andrewanswer/sibrap
 */
module halfcube(a, orient, center) {
	translate(center==true?-a/2:0) {
		if (orient=="x")
			polyhedron (points = [[a[0],0,a[2]], [0,0,a[2]], [0,a[1],0], [0,0,0], [a[0],0,0], [a[0],a[1],0]], faces = [[1,3,2], [4,0,5], [3,1,4], [1,2,5], [1,0,4], [0,1,5],  [5,2,4], [4,2,3]]);
		if (orient=="y")
			polyhedron (points = [[0,a[1],a[2]], [0,0,a[2]], [0,a[1],0], [0,0,0], [a[0],0,0], [a[0],a[1],0]], faces = [[1,3,2], [1,2,0], [3,1,4], [0,2,5], [1,5,4], [1,0,5],  [5,2,4], [4,2,3]]);
		if (orient=="z")
			polyhedron (points = [[0,a[1],a[2]], [0,0,a[2]], [0,a[1],0], [0,0,0], [a[0],0,0], [a[0],0,a[2]]], faces = [[1,3,2], [1,2,0], [3,1,4], [0,2,5], [1,5,4], [1,0,5],  [5,2,4], [4,2,3]]);
	}
}

// test
/*
halfcube([10,20,30],"x",true);
halfcube([10,20,30],"y",true);
halfcube([10,20,30],"z",false);
*/