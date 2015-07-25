include <dimlines.scad>

// параметры размеров
// толщина линии
DIM_LINE_WIDTH=1;
// расстояние между размерами
DIM_SPACE=12;
// высота размерной плоскости над основанием
DOC_HEIGHT=0;

// размеры - библиотечная функция
/* x - длина измеряемой линии и отображаемый размер, 
 *   при <0 отсчет в отрицательную сторону
 * y - отступ измеряемой линии от основной оси (X/Y), параллельной данной линии
 *   при <0 отсчет в отрицательную сторону
 * space - расстояние от линии размера до измеряемой линии (длина выносок)
 *   в интервалах DIM_SPACE, для горизонтальных размеров >0 сверху, <0 снизу
 * orientation - [-90,0,90,180] = [слева,вверху,справа,внизу перевернуто]
 *
 * Автор - Andrew Answer (Андрей Нуждов): http://answe.ru
 * Сделано для проекта SibRap: http://reprap.org/wiki/SibRap
 * GitHub: https://github.com/andrewanswer/sibrap
 */
module dim(x, y, space, orientation) {
    yy = DIM_SPACE*space;
    x1 = orientation==90 ? -y : 0;
    y1 = orientation==-90 ? abs(x) : 0;
    x2 = x>0 ? 0 : x;
    
    rotate([0, 0, orientation])
    translate([x2, y+yy, 0])
    dimensions(abs(x), DIM_LINE_WIDTH);
    rotate([0, 0, orientation+90])
    {
    translate([y, -x2, DIM_HEIGHT])
        line(length=yy, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);
    translate([y, -abs(x)-x2, DIM_HEIGHT])
        line(length=yy, width=DIM_LINE_WIDTH, height=.01,
            left_arrow=false, right_arrow=false);
    }
}
