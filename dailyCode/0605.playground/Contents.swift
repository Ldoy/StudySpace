import UIKit

enum Test: CaseIterable {
	case one
	case two
	
}

func testReturn () -> Test {
	return Test.allCases.randomElement()!
}

let a: Test = testReturn()
a

func stepForward(to input: Int) -> Int {
	input + 1
}

func stepBackward(to input: Int) -> Int {
	input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
	backward ? stepBackward : stepForward
}

var currentValue = 3
let movenearerToZero = chooseStepFunction(backward:  currentValue > 0)

func showVariadicParameters(_ type: Double...) {
	print("\(type)")
}

showVariadicParameters(1.0, 2.0)

func showInOutParameters(_ int1: inout Int, _ int2: inout Int) {
	let test = int1
	int1 = int2
	int2 = test
}
var int1 = 1
var int2 = 2

var show = showInOutParameters(&int1, &int2)
print(int1)
print(int2)
