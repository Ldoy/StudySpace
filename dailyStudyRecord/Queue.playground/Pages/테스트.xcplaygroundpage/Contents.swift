//: [Previous](@previous)

import Foundation

//class a {}
//
//var one: a? = a()
//var two: a? = a()
//
//print(CFGetRetainCount(one)) // 1
//
//one = two
//
//print(CFGetRetainCount(two)) // 2
//print(CFGetRetainCount(one)) // 2
//
//one = nil
//print(CFGetRetainCount(two)) // 1
//two = nil
// nil의 정의 : stack  에 있다?


class A {
    
}

class B {
    var classA = A()
    var classB = A()
    var classC = A()
}

var test = B()




//: [Next](@next)
