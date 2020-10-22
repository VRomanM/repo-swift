import Foundation

//1. Описать несколько структур - любой легковой автомобиль SportCar и любой грузовик TrunkCar
//2. Описать в каждом наследнике специфичные для него свойства. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема
//4. Добавить в структуры метод с одним аргументом типа перечисление, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия
//6. Вывести значения свойств экземпляров в консоль

enum actionWithCar: String {
    case startOrOffEngine
    case openOrCloseWindows
    case loadOrUnloadCargoTrunc
}

enum brand: String {
    case ford, ferrari, lada, BMW
}

struct SportCar {
    let brand: String
    let yearIssue: Int
    let bodyVolume: Int
    var countCargoTrunc: Int
    var engineStarted: Bool
    var windowsOpen: Bool
    
    mutating func getAction(action: actionWithCar, _ weight: Int = 0) {
        if action == actionWithCar.startOrOffEngine {
            self.engineStarted = !self.engineStarted
        } else if action == actionWithCar.openOrCloseWindows {
            self.windowsOpen = !self.windowsOpen
        } else if action == actionWithCar.loadOrUnloadCargoTrunc {
            if (self.countCargoTrunc + weight) > self.bodyVolume {
                print("Багажник полон. Свободно \(self.bodyVolume - self.countCargoTrunc) литров")
            } else {
                self.countCargoTrunc = self.countCargoTrunc + weight
            }
        } else {
            print("unknow action")
        }
    }
}

struct TrunkCar {
    var brand: String
    let yearIssue: Int
    let trunkVolume: Int
    var countCargoTrunc: Int
    var engineStarted: Bool
    var windowsOpen: Bool
    
    mutating func getAction(action: actionWithCar, _ weight: Int = 0) {
        if action == actionWithCar.startOrOffEngine {
            self.engineStarted = !self.engineStarted
        } else if action == actionWithCar.openOrCloseWindows {
            self.windowsOpen = !self.windowsOpen
        } else if action == actionWithCar.loadOrUnloadCargoTrunc {
            if (self.countCargoTrunc + weight) > self.trunkVolume {
                print("Багажник полон. Свободно \(self.trunkVolume - self.countCargoTrunc) литров")
            } else {
                self.countCargoTrunc = self.countCargoTrunc + weight
            }
        } else {
            print("unknow action")
        }
    }
}

var liteCar = SportCar(brand: brand.BMW.rawValue, yearIssue: 2020, bodyVolume: 200, countCargoTrunc: 0, engineStarted: false, windowsOpen: false)
var hardCar = TrunkCar(brand: brand.ford.rawValue, yearIssue: 2020, trunkVolume: 1000, countCargoTrunc:0, engineStarted: false, windowsOpen: false)
print(hardCar)
hardCar.getAction(action: actionWithCar.startOrOffEngine)
hardCar.getAction(action: actionWithCar.openOrCloseWindows)
print(hardCar)
hardCar.getAction(action: actionWithCar.loadOrUnloadCargoTrunc, 50)
print(hardCar)

print(liteCar)
liteCar.getAction(action: actionWithCar.startOrOffEngine)
liteCar.getAction(action: actionWithCar.openOrCloseWindows)
print(liteCar)
liteCar.getAction(action: actionWithCar.loadOrUnloadCargoTrunc, 50)
print(liteCar)


