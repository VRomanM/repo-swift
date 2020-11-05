import UIKit

/*
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */

enum Brand: String {
    case Ford = "Форд"
    case lada = "Жига"
    case Ferrari = "Фера"
}

enum PutErrors: String, Error {
    case noTrunk = "Нет багажника"
    case fullTrunk = "Багажник полон"
}

class SportCar {
    let brand: Brand
    var haveTrunk = false
    let volumeTrunk: Int
    var weight: Int = 0
    
    init(brand: Brand, volumeTrunk: Int) {
        self.brand = brand
        self.volumeTrunk = volumeTrunk
    }
    
    func putInTrunk (_ weight: Int) throws {
        if !self.haveTrunk {
            throw PutErrors.noTrunk
        } else if (weight + self.weight) > volumeTrunk {
            throw PutErrors.fullTrunk
        }
        self.weight += weight
    }
}

let ferrari = SportCar(brand: .Ferrari, volumeTrunk: 150)
ferrari.haveTrunk = true

do {
    try ferrari.putInTrunk(200)
    print("Загруженность багажника \(ferrari.weight)")
} catch {
    // Если обрабатывать конструкцией Guard let, как передать условие что error'а нет?
    if error is PutErrors {
        let error = error as! PutErrors
        
        print(error.rawValue)
    }
    //print((error as! PutErrors).rawValue)
}

/*
// Поясни пожалуйста данную конструкцию из методички.
// Здесь создается массив, в массив помещается строка некий класс Item, который мы успешно описываем,
// а что означает запись "Candy Bar": и подобные?
// это такое название элементу массива мы присваиваем или что?
// Хранилище
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7, product: Product(name: "Candy Bar")),
        "Chips": Item(price: 10, count: 4, product: Product(name: "Chips")),
        "Pretzels": Item(price: 0, count: 11, product: Product(name: "Pretzels"))
    ]
*/
