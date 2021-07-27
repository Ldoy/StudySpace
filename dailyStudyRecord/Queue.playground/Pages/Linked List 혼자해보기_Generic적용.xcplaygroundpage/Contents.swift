//: [Previous](@previous)

import Foundation

//protocol Nodable {
//    associatedtype Elemnt
//    var value: Elemnt { get set }
//    var next: Nodable? { get set }
//}

class Node<Elemnt> {
    var value: Elemnt
    var next: Node?
    
    init(value: Elemnt, next: Node?) {
        self.value = value
        self.next = next
    }
}
// 클래스에 T, U; Node<T>로 구현하는게 좋은지 아니면 Node 클래스에 프로토콜 채택하는 형태가 좋을지

class LinkedList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    
    func enqueue(value: T) {
        if head == nil {
            head = Node(value: value, next: nil)
            return
        }
        
        var current = head
        
        while current?.next != nil {
            current =  head?.next
        }
        
        current?.next = Node(value: value, next: nil)
    }
    
    func isEmpty() -> Bool {
        if head == nil  {
            return true
        }
        
        return false
    }
    
    
    func dequeue() {
        if isEmpty() {
            print("헤드가 없으요")
            return
        }
        
//        head = head?.next
        head = nil
    }
    
    func clear() {
        while head != nil {
            dequeue()
        }
    }
    
    func peek() -> T? {
        head?.value
    }
    
    func displayListItems() {
        var current = head
        while current != nil {
            print("현재 노드의 vlaue는 \(String(describing: current?.value))입니다")
            current = current?.next
        }
    }
}

func address(o: UnsafeRawPointer) -> Int {
    return Int(bitPattern: o)
}

func address<T: AnyObject>(o: T) -> Int {
    return unsafeBitCast(o, to: Int.self)
}

func addressString(_ value: Int) -> String {
    return String(format: "%d", value)
}

let linkedList = LinkedList<Int>()
linkedList.enqueue(value: 1)
linkedList.displayListItems()
print(CFGetRetainCount(linkedList)) // 1

print(addressString(address(o: linkedList)))


linkedList.enqueue(value: 2)
print(CFGetRetainCount(linkedList)) //1
print(linkedList.head?.next?.value ?? 0)
