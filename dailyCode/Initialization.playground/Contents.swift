import UIKit

enum Student {
    case elementary, middle, high
    case none

    init() {
        self = .none
        print("\(self)")
    }

    init(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
            print("\(self)")
        case 14...16:
            self = .middle
            print("\(self)")
        case 17...19:
            self = .high
            print("\(self)")
        default:
            self = .none
            print("\(self)")
        }
    }

    init(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}


let student1 = Student(koreanAge: 10)
let student2 = Student()
let student3 = Student(bornAt: 2021, currentYear: 2030)

class Person {
    let name: String
    var age: Int?

    init?(name: String) {
        if name.isEmpty == true {
            return nil
        }
        self.name = name
    }

    init?(name: String, age: Int) {
        if name.isEmpty ==  true || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}

let person1: Person? = Person(name: "")
let person2: Person? = Person(name: "j", age: -20)
if let person = person1 {
    print(person.name)
} else {
    print("No person")
}

if let person2 = person2 {
    print(person2.age ?? 0)
} else {
    print("d")
}


enum Student2: String {
    case elemantary = "초등", middle = "중등"

    init?(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elemantary
        case 14...16:
            self = .middle
        default:
            return nil
        }
    }
}

let 학생 = Student2(koreanAge: 50)


struct SomeClass {
    let classNumber: Int?

    var studentNumber: Int?

    init(studentNumber: Int) {
        self.studentNumber = studentNumber
        classNumber = studentNumber * 10
    }
}

let a = SomeClass(studentNumber: 5)
a.classNumber
