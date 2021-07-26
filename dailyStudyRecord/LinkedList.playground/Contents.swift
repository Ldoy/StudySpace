import UIKit

//구조체 사용하면 조금 어려워서 스트럭으로 하겠다.
// 헤드로 쓸 노드가 필요.
class LinkedList {
    
    var head: Node?
    
    // 노드를 어떻게 추가할 것인가
    func insert(value: Int) {
        if head == nil {
            head = Node(value: value, next: nil)
            return
        }
        
        var current = head
        
        while current?.next != nil {
            current = current?.next
        }
        
        current?.next =
        
    }
    
    func displayListItems() {
        var current = head
        while current != nil {
            print("현재 노트의 vlaue는 \(current?.value ?? 0)입니다")
            current = current?.next
        }
    }
    
    func setupDummyNodes() {
        let four = Node(value: 4, next: nil)
        let three = Node(value: 3, next: four)
        let two = Node(value: 2, next: three)
        head = Node(value: 1, next: two)
    }
}

class Node {
    // value 와 next 가 구현되어야 한다.
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

let testLinkedList = LinkedList()
// 노트 연결 구성 설정
testLinkedList.setupDummyNodes()
// 노드를 통한 기능 구현(여기선 프린트)
testLinkedList.displayListItems()

//Insertion
