import UIKit

var greeting = "Hello, playground"

/* 콘솔로그를 확인할 수 있는 함수: print, dump
print : output을 콘솔에 프린트
dump //인스턴스의 자용한 설명까지 출력(description property)
문자역 보간법 \()
*/

let age = 5

print("\n##\(age)##\n")

class Person {
	var name: String
	var age: Int
	
	init(name: String, age: Int) {
		self.age = age
		self.name = name
	}
}


let doy: Person = Person(name: "doyi", age: 10)

dump(doy)
	//swift language guide 내용
	/*
	1. 튜플 타입 제공(옵젝씨와는 다름)
	2. 옵셔널
	3. 타입 세이프 언어=타입을 확실히 선언해야 코드가 작동한다는 의미 = 타입이 다른 데이터는 assign불가능 -> 이진법 형태로 메모리에 저장되는데 타입이 다른 경우 저장 형태가 다르기 때문
	*/
	
// 상수, 변수
/*
내가 어떤 데이터를 저장하느냐에 따라 변하지 않는 상수로 저장할 지 변할 수 있는 변수로 저장할지가 나뉜다. 또한 type anotation 을 통해 변수 혹은 상수 옆에 콜론 후 데이터 타입을 선언한다. 이 때 타입은 스위프트 라이브러리에서 기본적으로 제공하는 fundamental data type 외에 사용자가 직접 커스텀한 타입이 될 수 있다. (class, struct enum 등)

상수와 변수의 이름이 되기 어려운 것은 (공백, 수학적 기호, 화살표, 개인용 유니코드 스칼라 값, line-and box-drawing, 숫자로 시작하는 이름)
-> 스위프트에서 쓰는 키워드를 사용해야하는경우(다른 선택지가 없는 경우) ' 를 이용
*/



let constant: String = "상수"
var vraiable: String = "변수"
let later: String
later = "a"

struct name {
	let name: String
}
let b = name(name: "d")
b.name
//b.name = "c" 에러!

//Integers
/*
UInt : 양수만(UInt32, UInt64), Unassigned integer type 이라곻 ㅏㅁ
Int : 음수,0,양수(Int8,16,32,64) Assigned Integer type

*/

let minValue = UInt8.min 
let maxValue = UInt8.max

let minValueInt = Int.min
let maxvalueInt = Int.max

let minValueInt8 = Int8.min
let minValueInt16 = Int16.min
let minValueInt32 = Int32.min
let minValueInt64 = Int64.min

