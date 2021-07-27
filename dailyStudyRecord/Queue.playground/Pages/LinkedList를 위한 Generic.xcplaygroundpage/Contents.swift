//: [Previous](@previous)

import Foundation

func swapValue<T>(lhs: inout T, rhs: inout T) {
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

var a = 1
var b = 2

swapValue(lhs: &a, rhs: &b)
a
b

var c = 1.1
var d = 1.2

swapValue(lhs: &c, rhs: &d)


func swapValue2<T: Comparable>(lhs: inout T, rhs: inout T) {
    
    if lhs == rhs { return }
    
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

// 특수화

func swapValue(lhs: inout String, rhs: inout String) {
    print("특수화 버전")
    
    if lhs.caseInsensitiveCompare(rhs) == .orderedSame {
        return
    }
    let tmp = lhs
    lhs = rhs
    rhs = tmp
}

var e = "1"
var f = "2"
swapValue(lhs: &e, rhs: &f)
e
f

var h = 1
var j = 2
swapValue(lhs: &h, rhs: &j)
// 특수화 함수라는 것은 Generic으로만든 함수를 오버라이딩하여 해당 타입의 인자를 받는 것 -> String일 때 받을 수 있도록 하는 특별한 경우 추가 가능


//Generic Type
// 스위프트에서 컬렉션은 모두 구조체로 구현되어있고 그것은 제네릭 타입
// 기존 형식에 제네릭 타입을 추가하면 제니릭 타입이 된다!!

struct Color<T> {
    var red: T
    var green: T
    var blue: T
}

let color = Color(red: 13, green: 343, blue: 2)
color  // Color<Int> 라는 형식을 가지게 됨 왜 Int가 될까?, 생성자 호출하면서 Int 전달했기 때문에 해당 Color의 타입을 Int 로 추론
// 하지만 이렇게 제네릭 타입인스턴스 생성하고 나서 다른 형식을 할당할 수 없음. 왜..? 구조체면 복사가 이루어지기 때문에 다른 스택에 할당되는것 아님?

let color2 = Color(red: 192.3, green: 3.3, blue: 4.4)

//초기화 전에 타입만 선언하는 경우 타입을 명시해야함, 추론 안됨
let noInit: Color<Int>

//

let arr: Array<Int> // 이거...다 제네릭?! 와우...
// 어레이에는 다양한 형식을 처리할 수 있도록 제네릭으로 구현되어ㅣㅇㅆ고 컴파ㅣㅇㄹ러가 이 코드를 보고 Int 처리하는 코드를 자동으로 생성

let dic: Dictionary<String, Double>
//와우

//Extension을 통한 확장

//확장할 형식이름과 파라미터의 위치를 보자. 익스텐션을 할 때는 제네릭의 타입파라미터를 추가하지 않는다. 따라서 타입파라미터 형식 이름 변경하는 것을 불가능 (T를 다른 것으로 바꾸는 것은 안됨)

//extension Color {
//    func getComponents() -> [T] {
//        return [red, green, blue]
//    }
//}

let intcolor = Color(red: 1, green: 3, blue: 4)

//intcolor.getComponents()
let doubleCollor = Color(red: 1.2, green: 2.2, blue: 3.3)
// 익스텐션에서 확장 대상 제한하는 것 가능 where 추가
// Int는 가능하지만 Double인 경우는 해당 메소드가 가능하지 않아짐.
// 프로토콜을 채택하거나 T 자체의 타입을 명시하는 경우 두 가지가 있음
// where T: FixedWidthInteger OR T == Int
// 핵심 포인트! Extension의 확장 대상을 정할 수 있다!!!!!

//extension Color: FixedWidthInteger {
//    func getComponents() -> [T] {
//        return [red, green, blue]
//    }
//}


// Associated Types
//제네릭 프로토콜 선언해 보자

//protocol QueueCompatible<T> {
//    func enqueue(value: T)
//    func dequeue() -> T?
//}
// 위처럼 하면 안됨 Associated Types 이 필요, 프로토콜에서 사용하는 플레이스 홀더. 프로토콜 사용한 곳에서 다시 연관형식을 선언할 필요 없음 -> 연관형식은 채용된 곳의 타입에 따라 달라짐
// 프로토콜의 제네릭타입을 제약하고 싶다면 익스텐션과 동일, 연관형식 이름 뒤에 채택하면됨 

protocol QueueCompatible {
    associatedtype Element
    func enqueue(value: Element)
    func dequeue() -> Element?
}

//class IntegerQueue: QueueCompatible {
//    typealias Element = Int
//
//    //enqueue 의 element Int 로 선언해 주어야 함
//}
//
//
//class DoubleQueue: QueueCompatible {
//    // 바로 메소드 구현도 가능, 타입알리아스 생략
//}

//: [Next](@next)
