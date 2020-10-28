import Foundation

/*
1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести сами объекты в консоль.
 */

enum Color {
    case Red, Yellow, Blue, Green
}

enum Action {
    case openWindows
}

enum Brand{
    case Ford, Kamaz, Ferrari
}

protocol Car: AnyObject {
    var colorCar: Color { get set }
    var weight: Int { get }
    var windowsOpened: Bool { get set }
    var engineOn: Bool { get set }
    var brand: Brand { get set }
}

extension Car {
    func switchWindows() {
        windowsOpened = !self.windowsOpened
    }
    func swtchEngine() {
        engineOn = !self.engineOn
    }
}

class TrunkCar:Car {
    var colorCar: Color
    var weight: Int
    var windowsOpened: Bool = false
    var engineOn: Bool = false
    var haveTrailer: Bool = false
    var brand: Brand
    
    init(colorCar: Color, weight: Int, brand: Brand) {
        self.colorCar = colorCar
        self.weight = weight
        self.brand = brand
    }
}

class SportCar:Car {
    var colorCar: Color
    var weight: Int
    var windowsOpened: Bool = false
    var engineOn: Bool = false
    var hp: Int
    var brand: Brand
    
    init(colorCar: Color, weight: Int, hp: Int, brand: Brand) {
        self.colorCar = colorCar
        self.weight = weight
        self.hp = hp
        self.brand = brand
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        get {
            return "\(brand): Это супер мега крутой грузовик"
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        get {
            return "\(brand): Это супер мега быстрый спорткар"
        }
    }
}

let Ferrari = SportCar(colorCar: .Blue, weight: 1000, hp: 1000, brand: .Ferrari)
Ferrari.switchWindows()
Ferrari.swtchEngine()
print("\(Ferrari.description), Цвет: \(Ferrari.colorCar), Окна открыты: \(Ferrari.windowsOpened), Двигатель запущен: \(Ferrari.engineOn)")

let Kamaz = TrunkCar(colorCar: .Yellow, weight: 3500, brand: .Kamaz)
Kamaz.switchWindows()
Kamaz.swtchEngine()
print("\(Kamaz.description), Цвет: \(Kamaz.colorCar), Окна открыты: \(Kamaz.windowsOpened), Двигатель запущен: \(Kamaz.engineOn)")

