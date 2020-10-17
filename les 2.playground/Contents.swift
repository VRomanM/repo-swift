import Foundation

//1. Написаить функцию, которая определяет четное число или нет

func numberHaveRemainderDivider(_ number: Int, _ divider: Int = 2) -> Bool{
    /*print(number % divider == 0 ?
            (divider == 2 ? "Четное: " : "") + "Делится без остатка" :
            (divider == 2 ? "Нечетное: " : "") + "Есть остаток от деления")
    Решил переписать, чтобы по максимуму использовать все функции между задачами
    */
    return number % divider != 0
 }

print(numberHaveRemainderDivider(6) ? "Нечетное" : "Четное")

//2. Написать функцию, которая определяет делится ли число без остатка на 3
print(numberHaveRemainderDivider(8, 3) ? "Есть остаток от деления" : "Нет остатка от деления")

//3. Создать возрастающий массив из 100 чисел
func createArrayIncrease() ->[Int] {
    var arr = [Int]()
    for n in 1...100 {
        arr.append(n)
    }
    return arr
}

var arr = createArrayIncrease()
print("Возрастающий массив из 100 чисел")
print(arr)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3
func delNumberHaveRemainderDivivsion(arr: [Int]){
    // При попытке удалить элементы из массива arr получаю ошибку
    // Cannot use mutating member on immutable value: 'arr' is a 'let' constant
    // погуглил, понял что массив приходит неизменной константой, сделал копию
    // вопрос, как сделать так, чтобы входящий параметр в функцию приходил не let, а var?
    // чтобы его можно было изменять
    
    var n = arr.count
    var ar = arr
    repeat {
        if numberHaveRemainderDivider(ar[n - 1])
            && numberHaveRemainderDivider(ar[n - 1], 3){
            ar.remove(at: n - 1)
        }
        
        n -= 1
    } while n > 0
    print("Четные числа и числа, которые делятся на 3")
    print(ar)
}
delNumberHaveRemainderDivivsion(arr: arr)

//5. Написать функцию, которая добавляет в массив новое число Фибоначчи при помощи нее 50 элементов
func createFibonachchiArray(_ length: Int){
    var arr = [Int]()

    for n in 0 ... (length - 1) {
        if n == 0 || n == 1 {
            arr.append(n)
        } else {
            arr.append(arr[n-1] + arr[n-2])
        }
    }
    print("Числа Фибоначчи")
    print(arr)
}
createFibonachchiArray(50)

/*6. Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно

 Очень сложно сформулирована задача. Удалось вкурить суть "решета" метода Эратосфена только с помощью гугла
 */

func naturalNumbers(_ length: Int) -> [Int]{
    var arr = [Int]()
    for n in 2 ... (length + 1) {
        arr.append(n)
    }
    return arr
}

var n = 100
arr = naturalNumbers(n)
var p = 2
var i = 2
var arrPrimeNumbers = [Int]()

while i <= (arr.count + 1) {
    if arr[i - 2] == 0 {
        i += 1
        continue
    }
    arrPrimeNumbers.append(arr[i - 2])
    p = i + i
    while p <= n {
        arr[p - 2] = 0
        p = p + i
    }
    i += 1
}
print("Простые числа")
print(arrPrimeNumbers)
