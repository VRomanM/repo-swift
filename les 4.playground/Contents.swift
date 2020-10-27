import Foundation

/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
 */

enum Action {
    case switchEngine
    case switchWindows
    case loadOrUnloadCargoTrunc
    case switchSportMode
}

class Car {
    let hp: Int
    let mass: Int
    let countWheels: Int
    var engineOn: Bool = false
    var windowsOpened: Bool = false
    
    init(hp: Int, mass: Int, countWheels: Int) {
        self.hp = hp
        self.mass = mass
        self.countWheels = countWheels
    }
    
    func action(_ action: Action) {}
}

class TrunkCar: Car {
    var haveTrailer: Bool = false
    
    override func action(_ action: Action) {
        switch action {
        case .switchEngine:
            engineOn = !self.engineOn
        case .switchWindows:
            windowsOpened = !self.windowsOpened
        case .switchSportMode:
            print("У грузовых авто нет спорт режима")
        case .loadOrUnloadCargoTrunc:
            break
        }
    }
}

class SportCar: Car {
    let haveSpoiler: Bool = true
    var SportMode: Bool = false
    
    override func action(_ action: Action) {
        switch action {
        case .switchEngine:
            engineOn = !self.engineOn
        case .switchWindows:
            windowsOpened = !self.windowsOpened
        case .switchSportMode:
            self.SportMode = !self.SportMode
        case .loadOrUnloadCargoTrunc:
            print("У спорткаров нет прицепов")
        }
    }
}

let car = Car(hp: 100, mass: 1000, countWheels: 4)
let trunkCar = TrunkCar(hp: 500, mass: 5000, countWheels: 8)
let sportCar = SportCar(hp: 1000, mass: 1000, countWheels: 4)

trunkCar.action(.switchSportMode)
trunkCar.action(.switchEngine)
sportCar.action(.loadOrUnloadCargoTrunc)
sportCar.action(.switchEngine)
sportCar.action(.switchSportMode)

print("Статус двигателя: \(trunkCar.engineOn), Наличие прицепа: \(trunkCar.haveTrailer)")
print("Статус двигателя: \(sportCar.engineOn), Статус спорт режима: \(sportCar.SportMode)")

