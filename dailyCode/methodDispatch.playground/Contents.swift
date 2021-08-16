import UIKit

class Drawbal { func draw() {
    
} }

class Point : Drawbal {
    var x = 0.0, y : Double = 0.0
    override func draw() {
         print("Point의 draw")
    }
}


class Line : Drawbal {
    var x1 = 0.0, y1 = 0.0, x2 = 0.0, y2 = 0.0
    override func draw() {
         print("Line의 draw")
    }
}

var drawbles: [Drawbal] = [Line(), Point()]
for d in drawbles {
    d.draw()
}
// 컴파일 타임에 어떤메소드를 실행할지 결정할 수 없음! 구조체의 경우 값을 그대로 복사하기 때문에 해당 하는 타입 인스턴스들의 메소드를 그대로 실행하면 되지만 클래스의 경우 참조! 따라서 메소드가 오버라이드된 상태일수도 있고 아닌상태일 수도 있고.
//Line의 메소드 draw를 실행
