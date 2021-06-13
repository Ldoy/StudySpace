import UIKit

/*
에러 핸들링

에러를 처리하는 방법에는 4가지가 있다. 첫 번째, 함수내부의 코드를 이용해 콜링 후 에러를 propagate 하는 것. 두 번째, do-catch 구문을이용하기. 세 번째, optional value 이용하기. 네 번째, 에러가 일어나지 않을 것이라고 주장하기(assert)
- top-level에서 에러가 생긴다면 반드시 error-handling 이 존재해야 runtime error 가 생기지 않는다. (do-catch, try등)

1. 함수를 통한 에러 throw
- 함수에서 에러 throw를 하는 경우 에러 발생 코드 위치를 명확히 하는 것이 중요하다.
- 에러가 발생할 수도 있는 코드를 작성하는 경우 try(try! try?) 키워드를 써야한다. 그래야 에러를 throw 할 수 있음.
*/

// 1. 함수를 통한 에러 throw (함수 : function, method, initializer 등) : 에러를 발생할 수 있는 함수를 사용 할 땐 앞에 try 키워드

func canThrwoErrors() throws -> String {
	// 리턴타입이 있는 경우 화살표 이전에 throws 쓰기
	return "a"
}

enum VendingMachineError: Error {
	case invalidSelection
	case insufficientFunds(coinsNeeded: Int)
	case outOfStock
}

struct Item {
	var price: Int
	var count: Int
}

class VendingMachine {
	var inventory = [ "Candy Bar": Item(price: 12, count: 7), "Chips" : Item(price: 10, count: 4), "Pretzels": Item(price: 7, count: 11)]
	
	var coinsDeposited = 0
	
	func vend(itemNamed name: String) throws {
		guard let item = inventory[name] else {
			throw VendingMachineError.invalidSelection
		}
		
		guard item.count > 0 else {
			throw VendingMachineError.outOfStock
		}
		
		guard item.price <= coinsDeposited else {
			throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
		}
		
		coinsDeposited -= item.price
		
		var newItem = item
		newItem.count -= 1
		inventory[name] = newItem
		
		print("Dispensing \(name)")
	}
}

let favoriteSnacks = [ "Alice": "Chips", "Bob": "Licorice", "Eve": "Pretzels" ]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
	let snackName = favoriteSnacks[person] ?? "Candy Bar"
	try vendingMachine.vend(itemNamed: snackName)
	//Because the vend(itemNamed:) method can throw an error, it’s called with the try keyword in front of it.
}

//1.1 initializer

struct PurchasedSnack {
	let name: String
	init(name: String, vendingMachine: VendingMachine) throws {
		try vendingMachine.vend(itemNamed: name)
		self.name = name
	}
}

//2. do-catch : do 구문에서 에러가 생기면 catch 에서 어떤 에러인지 결정, 함수 콜링 후 나오는 에러를 분류하는 역할

var venddingMachine = VendingMachine()
venddingMachine.coinsDeposited = 8

do {
	try buyFavoriteSnack(person: "Alice", vendingMachine: venddingMachine)
	print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
	print("Invalid Selections.")
} catch VendingMachineError.outOfStock {
	print("Out of stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
	print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
	print("Unexpected error: \(error).")
}

// top level error handleling - nourish 같이 top-level에서 함수를 선언 한 경우 try 없이 콜링하는 경우 에러

func nourish(with item: String) throws {
	do {
		try venddingMachine.vend(itemNamed: item)
	} catch is VendingMachineError {
		print("Couldn't buy that from the vending machine")
	}
}


do {
	try nourish(with: "Beet-Flavored Chips")
} catch {
	print("Unexpected non-vending-machine-related error: \(error)")
} // Couldn't buy that from the vending machine 가 프린트 됨


 //3. 옵셔널 이용하기 - try? : 에러가 옵셔널 일 때.(x 와 y 는 동일한 value and behavior, x와 y는 nil 값 혹은 함수의 리턴값을 가질 것. )

func someThrwingFuncion() throws -> Int {
	//...
	return 1
}

let x = try? someThrwingFuncion()

let y: Int?
do {
	y = try someThrwingFuncion()
} catch {
	y = nil
}


// 2.2 try?뒤의 내용이 error 가 아닌 경우 data를 리턴하도록  두 개의 구문을 작성 -> 만약 두 개 중 하나라도 안되는 경우 nil을 리턴하도록 만들 수 있음

//func fetchData() -> Data? {
//	if let data = try? fetchDataFromDisk() { return data }
//	if let data = try? fetchDataFromServer() { return data }
//	return nil
//}


// 4. 에러가 나지 않을 것이라고 주장하는 경우
// try! : throwing function or method 할 때 run time에서 에러가 절대 발생하지 않은 것을 알고 있는 경우 사용 ex : 이미지가 이미 앱 내에 포함 되어 있는 경우 이미지를 load할 때 실패할리가 없음!

//let photo = try! loadImage(atPath: "주소")


//defer: code block을 벗어나기 이전에 실행되는 코드를 의미 1. break, return 과 같이 control을 out of the statements하거나 에러를 throwing 하는 키워드 포함하지 않음 2.

//func getData(completion: (_ result: Result<String>) -> Void) {
//	var result: Result<String?>?
//	defer {
//		guard let result = result else {
//			fatalError("we should always end with a result")
//		}
//		completion(result)
//	}
//	// 함수콜링 -> result 변수 메모리 만들기 -> defer 실행 -> result가 없는 경우 에러 -> 앱 크래쉬, 있는 경우에는 completion안에 result를 변수로 삼아서 getData 함수 실행
//}
//https://www.avanderlee.com/swift/defer-usage-swift/
