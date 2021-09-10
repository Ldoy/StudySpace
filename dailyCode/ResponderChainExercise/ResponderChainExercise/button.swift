//
//  button.swift
//  ResponderChainExercise
//
//  Created by Do Yi Lee on 2021/09/09.
//

import UIKit

class button: UIButton {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
            print("버튼의 hitTest호출 - point: \(point) / event: \(event.debugDescription)")
            return super.hitTest(point, with: event)
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesBegan(touches, with: event)
            print("버튼의 touchesBegan 인식")
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesMoved(touches, with: event)
            print("버튼의 touchesMoved 인식")
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesEnded(touches, with: event)
            print("버튼의 touchesEnded 인식\n")
        }
        
        override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            super.touchesCancelled(touches, with: event)
            print("버튼의 touchesCancelled 인식\n")
        }

}
