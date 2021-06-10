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

