import UIKit

//Generics

func swapTwoValues<A>(_ a: inout A, _ b: inout A) {
	let temporaryA = a
	a = b
	b = temporaryA
	print("\(a), \(b)")
}

var someint = 1
var anotherint = 2

var someInt = swapTwoValues(&someint, &anotherint)


struct IntStack {
	var items: [Int] = []
	mutating func push(_ item: Int) {
		items.append(item)
	}
	mutating func pop() -> Int {
		return items.removeLast()
	}
}

struct Stack<Element> {
	var items: [Element] = []
	mutating func push(_ item: Element)  {
		items.append(item)
	}
	
	mutating func pop() -> Element {
		return items.removeLast()
	}
}

var a = Stack(items: [3])
a.pop()
a.push(3)
a.push(4)
a.pop()

var b = Stack<String>()
b.items
b.push("a")
b.items
b.push("b")
b.pop()

//Extention Generic type
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

extension Stack {
	var topItem: Element? {
		return items.isEmpty ? nil : items[items.count - 1]
	}
}
//The topItem property returns an optional value of type Element. If the stack is empty, topItem returns nil; if the stack isn’t empty, topItem returns the final item in the items array.

if let topItem = stackOfStrings.topItem {
	print("The top item on the stack is \(topItem).")
}

// Key-Value Observing 연습

class User1 {
	var name = String()
	var age = 0
	var nicknames = ["BigSexy", "Hey"]
}
// 원래는 위와 같이 만들었을 테지만 KVO형태로 코딩하고 싶은 경우 아래와 같이 한다

/*1. 지켜볼 클래스타입이 NSObject를 상속하도록 한다.
2. 해당 클래스의 프로퍼티 안에 @objc를 prefix 한다
3. willChangeValue는 forKey에 해당하는 age를 변경하겠다
	didChangeValue는 for 에 해당하는 age를 \(User.age)로 변경하겠다
willSet is called just before the value is stored.
didSet is called immediately after the new value is stored.
*/
class User: NSObject {
	@objc private var name = String()
	@objc var age = 0 {
		willSet { willChangeValue(forKey: #keyPath(age)) }
		didSet { didChangeValue(for: \User.age)}
	}
	@objc var nicknames = ["Bigsexy"]
	// observer 를
}
//
//let user = User()
//user.name = "kyle" 대신에

let user = User()
//1. user.setValue("kyle", forKey: "name")

//2. user.setValue("kilo", forKey: #keyPath(User.name))
//#keyPath(User.name) 자체가 스트링, User.속성

//3. user.setValuesForKeys(["name" : "Mr Loco", "age" : 21])
// 다이렉트 엑세스가 어려운 경우(접근제어자 등) 접가능할 수 있도록 해 줌

// print(user.name) // 에러, 접제어자 때문에

extension User {
	var nameValue: String {
		let name = value(forKey: "name") as? String ?? ""
		return name
	}
} // 접근제어자가 있지만 extension으로 값 가져오기

user.setValue("kyle", forKey: "name")
print(user.age)
print(user.nameValue)

let immutable = user.mutableArrayValue(forKey:  #keyPath(User.nicknames))
