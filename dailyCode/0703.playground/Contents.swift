import UIKit
import Foundation

var testArray = ["A", "B"].makeIterator()
while let test = testArray.next() {
	print(test)
}


var array = ["A", "B", "C"]

if array.contains("B") {
	print("YES")
} else {
	print("No")
}

var intArray = [1, 2, 3]
//extension Sequence {
//	func doublingAll() -> [Element] {
//		return map { $0 + 10 }
//	}
//}

// Binary operator '+' cannot be applied to operands of type 'Self.Element' and 'Int' 즉 타입을 명시해 주어야 한다는 얘기
//intArray.doublingAll()

extension Sequence where Element: Numeric {
	func plus<T> (lhs: T, rhs: T) -> T {
		return lhs + rhs
	}
}



protocol Calculable {
	func add<T>(lhs: T, rhs: T) -> T where T: Numeric
	func subtract<T>(lhs: T, rhs: T) -> T where T: Numeric
	func multiply<T>(lhs: T, rhs: T) -> T where T: Numeric
	func divide<T>(lhs: T, rhs: T) throws -> T where T: FloatingPoint
}

extension Calculable {
	func add<T>(lhs: T, rhs: T) -> T where T: Numeric {
		return lhs + rhs
	}
	func subtract<T>(lhs: T, rhs: T) -> T where T: Numeric {
		return lhs - rhs

	}
	func multiply<T>(lhs: T, rhs: T) -> T where T: Numeric {
		return lhs * rhs
	}
	func divide<T>(lhs: T, rhs: T) throws -> T where T: FloatingPoint {
		return lhs / rhs
	}
}

struct Calculate: Calculable {
}

let test = Calculate()
test.add(lhs: 2, rhs: 3)
