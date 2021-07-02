import UIKit
import Foundation
class 사장님 {
	var 비서: 비서?
	var 퇴근: Bool = false
}

protocol 비서역할 {
	func 퇴근확인() -> Bool
	func 점심메뉴추천()
} // 프로토콜

class 비서: 비서역할 {
	func 퇴근확인() -> Bool{
		return true
	}
	func 점심메뉴추천() {
	}
	
}

extension 비서 {
	func 테스트() {
		
	}
}

// view컨트롤러..?
let 사장 = 사장님()
사장.비서 = 비서()
사장.비서?.테스트()

if 사장.비서!.퇴근확인() {
	사장.퇴근 = true
}

func dropIncorrectDecimal(from: Double) -> Double {
	// 1. 10으로 나누어서 나눈 자리수가 0이 아닌경우에 빼기 그 외는  String에서 문자 아닌애들 빼주는 메소드 쓰기
	if from - ceil(from) != 0.0 {
		if from < 0{
		let a = from - ceil(from)
		return from + a
		} else if from > 0 {
			let a = from - ceil(from)
			return from - a
		}
	} else {
		return from
	}
	return 0.0
}




// replace,
let number = -1320.30000
var numberString = String(number).reversed()
// 00003.0231-

// 만약에 0이면 제거 0이 아니면 반복문 종료 -> 다시 reversed -> Double




let a = -1320.00000029
let b = Double(ceil(a))

var stringA = String(a) // "-1320.00000029"
let stringB = String(b) // "-1320.0"
//stringA와 stringB가 같은곳 까지만 출력 -> "-1328.0" -> 출력

var result = ""
let startIndex = stringB.count - 1
let endIndex = stringA.count - 1
let loopCount = endIndex - startIndex

for _ in 0..<loopCount {
	stringA.removeLast()
}

print(stringA)

//메서드를 log찍으면서 확인하기! // lldb 명령어 -> po(prind object)


//for stringA in stringA {
//	for i in 0...stringB.count {
//		if stringA == stringB[i].description {
//			result += stringA.description
//		}
//	}
//}
	
print(result)








	
//	var decimal = from.truncatingRemainder(dividingBy: 1).description
//	decimal.removeFirst()
//
//	let zeroCount = decimal.filter { char in return char.description == "0"}.count
//
//	if let firstZeroIndex = decimal.firstIndex(of: "0"), zeroCount >= 2, let incorrectDecimal = Double(decimal) {
//		let index = Double(decimal.distance(from: decimal.startIndex, to: firstZeroIndex))
//		let digits = pow(10.0, index)
//		let correctDecimal = round(incorrectDecimal * digits) / digits
//		let integer = floor(from)
//		let resultNumber = integer > 0 ? integer + correctDecimal : integer - correctDecimal
//
//		return resultNumber.description
//	} else {
//		retrun from.description
//	}
}
