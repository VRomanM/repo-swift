import Foundation
import UIKit

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

protocol Vehicle: AnyObject {
    var color: UIColor { get set }
}

enum Brand{
    case ford, ferrari, lada, UAZ
}

class SportCar: Vehicle {
    var color: UIColor
    var brand: Brand
    
    init(color: UIColor, brand: Brand) {
        self.color = color
        self.brand = brand
    }
}

class TrunkCar: Vehicle {
    var color: UIColor
    var brand: Brand
    var trailer: Bool = false
    
    init(color: UIColor, brand: Brand) {
        self.color = color
        self.brand = brand
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        get {
            return "Грузовик: \(brand) \(color.accessibilityName)"
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        get {
            return "Спорткар: \(brand) \(color.accessibilityName)"
        }
    }
}

struct Queue<T: Vehicle> {
    private var array: [T] = []
    mutating func push(_ row: T){
        array.append(row)
    }
    mutating func firstOut() {
        if array.count > 0 {
            array.remove(at: 0)
        }
    }
    
    subscript (indices: UInt ...) -> String? {
        var text: String?
        for index in indices {
            if index > self.array.count {
                text = nil
            } else{
                //text = text + self.array[index].description
                text = "Здесь должно быть описание"
            }
        }
        return text
    }
}

var sportCars = Queue<SportCar>()
var trunkCars = Queue<TrunkCar>()

sportCars.push(SportCar(color: .black, brand: .UAZ))
sportCars.push(SportCar(color: .red, brand: .ferrari))
sportCars.push(SportCar(color: .black, brand: .ford))
sportCars.push(SportCar(color: .gray, brand: .lada))

trunkCars.push(TrunkCar(color: .black, brand: .UAZ))
trunkCars.push(TrunkCar(color: .red, brand: .ferrari))
trunkCars.push(TrunkCar(color: .black, brand: .ford))
trunkCars.push(TrunkCar(color: .gray, brand: .lada))

sportCars.firstOut()
trunkCars.firstOut()
// Удалим везде первую запись (УАЗ)
print(sportCars)
print(trunkCars)

/* Не получилось:
1. Вывести описание структуры в сабскрипшене
2. При обращении по индексу 3 в моем понимании должен был вернуться nil, т.к. я удалил первый элемент методом firstOut(). Либо я что-то не допонимаю, либо что-то делаю не так
*/
print(trunkCars[3])
print(trunkCars[4])






