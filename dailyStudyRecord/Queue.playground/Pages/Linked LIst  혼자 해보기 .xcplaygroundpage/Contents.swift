//: [Previous](@previous)

import Foundation

// 목표 : 고객이 임시로 대기할 대기열(큐, Queue) 만들기
//1. node 만들기 -> 왜 클래스 사용?
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

//2. Node에서 enqueue, dequeue, isempty, Clear, Peek 구현하기
class LinkedList {
    
    var head: Node?
    
    // 2.1
    func enqueue(value: Int) {
        // head가 nil인 경우
        if head == nil {
            // head?.value = value , 바보인가
            head = Node(value: value, next: nil)
            return
        }
        
        // head가 nil이 아닌 경우, 헤드의 가장 끝에 value를 추가해야함
        var current = head
        
        // head의 끝 노드를 current로 설정
        while current?.next != nil {
            current =  head?.next
        }
        
        // 현재의 current는 가장 마지막 node
        current?.next = Node(value: value, next: nil)
    }
    
    //2.2.1 - static으로 구현해야함? 아니면 Node 클래스에 구현? 둘다 아닌 것 같음
    func isEmpty() -> Bool {
        // node가 있는지 확인하려면 먼저 head 가 있는지 확인해야함 -> 인큐 디큐할 때 무언가 문제가 생기ㅣ나?
        if head == nil  {
            return true
        }
        
        return false
    }
    
    //2.2 앞에서만 사라지도록 구현해야하는지 아니면 중간의 노드도 삭제되도록 구현해야 하는지?/ isEmpty재사용가능한 방법은 없을까?. 함수 내부에서 사용가능하도록 하려면,.. 근데 인스턴스로 만들고 사용해야하니까 어려울것 같다. -> 걍 함수 호출하면됨 바부...
    func dequeue() -> Int? {
       // 만약 해드가 없다면
        if isEmpty() {
            print("헤드가 없으요")
            return nil
        }
        
        // 해드 다음게 해드가 되도록 해야한다
        defer { head = head?.next }
//        defer { print("defer1")}
//        defer { print("defer2") }
        
        return head?.value ?? .zero
//        print(CFGetRetainCount(head))
//        head = nil
    }
    
    //2.3
    func clear() {
//        while head != nil {
//            dequeue()
//        }
        head = nil
    }
    
    //2.4
    func peek() -> Int {
        head?.value ?? .zero
    }
    
    func displayListItems() {
        var current = head
        while current != nil {
            print("현재 노드의 vlaue는 \(current?.value ?? 0)입니다")
            current = current?.next
        }
    }
}

let linkedList = LinkedList()
CFGetRetainCount(linkedList) // 1

linkedList.enqueue(value: 1)
linkedList.enqueue(value: 2)
linkedList.enqueue(value: 3)

CFGetRetainCount(linkedList.head?.next) // 1

linkedList.clear()

//CFGetRetainCount(linkedList.) // 1


//: [Next](@next)
