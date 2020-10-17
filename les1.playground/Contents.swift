import Foundation

//1.1 Решить квадратное уравнение
//ax2 + bx + c = 0
var a:Double = 1, b:Double = 12, c:Double = 36
var x1:Double = 0, x2:Double = 0
//дискриминант = b2 - 4ac
var d:Double = b * b - 4 * a * c
var resultText = ""

if d > 0 {
    //2 корня
    //x1 = (-b + squareRoot(d)) / 2a
    //x2 = (-b - squareRoot(d)) / 2a
    x1 = (-b + d.squareRoot()) / 2 * a
    x2 = (-b - d.squareRoot()) / 2 * a
    resultText = "Дискриминант > 0. D = \(d). Корней 2: x1 = \(x1) x2 = \(x2)"
} else if d == 0 {
    //1 корень
    x1 = (-b + d.squareRoot()) / 2 * a
    resultText = "Дискриминант = 0. Корень 1: x = \(x1)";
} else {
    resultText = "Дискриминант < 0. D = \(d). Корней нет";
}
print(resultText);

//1.2 Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
//a и b - катеты
a = 1
b = 2
// c - гипотенуза
//c = squareRoot(a2 + b2)
c = (a*a + b*b).squareRoot()
//P - периметр
var P:Double = a + b + c
//S - площадь
var S:Double = 0.5 * a * b
print("Гипотенуза = \(c), Периметр = \(P), Площадь = \(S)")

//1.3
var summ = 100000
var percent = 10
var countYears = 5
var profit = 0

repeat {
    profit = summ * percent / 100
    summ = profit + summ
    print("Сумма вклада за \(6 - countYears) год составила \(summ) руб. Прибыль за год равна \(profit) руб.")
    countYears-=1
} while countYears > 0


