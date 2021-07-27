import UIKit

//구조체 사용하면 조금 어려워서 스트럭으로 하겠다.
// 헤드로 쓸 노드가 필요.
// 왜 사용하는가?
class LinkedList {
    
    var head: Node?
    
    // 노드를 어떻게 추가할 것인가
    func insert(value: Int) {
        if head == nil {
            head = Node(value: value, next: nil)
            return
        } // 헤드가 없는 경우 1 이 헤드가 됨 -> 2노드를 추가하려고 하면 헤드가 있는 상태가 있기 때문에 if 문 실행안함
        
        var current = head // 노드1 -> 현재 head 는 1인상태
        
        while current?.next != nil {
            current = current?.next
        }
        // 현재노트의 next는 nil인 상태 -> while 문 실행 안함,
        // 하지만 현재 커런트의 넥스트가 있는 경우 해당 넥스트 끝까지 간 다음에 아래 코드가 실행 됨
        current?.next = Node(value: value, next: nil)
        
    }
    
    //#2 Delete
    
    func delete(value: Int) {
        // 없애고자 하는 해드의 값을 찾기
        if head?.value == value {
            head = head?.next
        }
        
        // 노드와 노드 사이의 노드를 없앴을 때 연결되도록 하기
        var prev: Node?
        var current = head
        
        // 현재의 헤드 노드가 있고, 없애고자하는 값이 아닐 때 해당 루프가 실행
        while current != nil && current?.value != value {
            //이전 노드를 현재노드로 설정하고 현재 노드는 그 다음노드로 설정
            prev = current
            current = current?.next
        } // 루프가 끝났다는 이야기는 커런트의 벨류가 내가 삭제 원하는 벨류가진 아이라는 뜻
        
        // 내가 없애고자하는 노드의 넥스트를 내가 없애고자하는 노트의 다음 넥스트로 설정
        prev?.next = current?.next
    }
    
    //#3 Sepcial List, (sort insertion)
    // 1->2->4->5->nil  이렇게 추가 원한다면 어떻게 해야하나?, 인터뷰 할 때 많이 물어볼 수 있음
    func insertInOrder(value: Int) {
        
    }
    
    
    // next 가 nil(즉 끝이 될 때까지) 값을 찾음
    func displayListItems() {
        var current = head
        while current != nil {
            print("현재 노드의 vlaue는 \(current?.value ?? 0)입니다")
            current = current?.next
        }
    }
    
//    func setupDummyNodes() {
//        let four = Node(value: 4, next: nil)
//        let three = Node(value: 3, next: four)
//        let two = Node(value: 2, next: three)
//        head = Node(value: 1, next: two)
//    }
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


//Insertion
testLinkedList.insert(value: 1)
testLinkedList.insert(value: 2)
testLinkedList.insert(value: 3)
testLinkedList.delete(value: 1)
testLinkedList.delete(value: 2)
testLinkedList.delete(value: 1)

//testLinkedList.setupDummyNodes()
// 노드를 통한 기능 구현(여기선 프린트)
testLinkedList.displayListItems()

