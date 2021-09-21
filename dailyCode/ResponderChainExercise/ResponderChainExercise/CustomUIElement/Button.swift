//
//  button.swift
//  ResponderChainExercise
//
//  Created by Do Yi Lee on 2021/09/09.
//

import UIKit

//MARK:- Experiment3
class PurpleButton: UIButton {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("🟪🔘purpleButton hitTest")
        return super.hitTest(point, with: event)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let point = super.point(inside: point, with: event)
        print("🟪🔘purpleButton point, point메소드 반환값: \(point)")
        return point
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("🟪🔘purpleButton의 touchesBegan 인식")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("🟪🔘purpleButton의 touchesMoved 인식")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("🟪🔘purpleButton의 touchesEnded 인식\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("🟪🔘purpleButton의 touchesCancelled 인식\n")
    }
}

//MARK:- Experiment4
class OrageButton: UIButton {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("🟧🔘OrageButton hitTest")
        return super.hitTest(point, with: event)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let point = super.point(inside: point, with: event)
        print("🟧🔘OrageButton point, point메소드 반환값: \(point)")
        return point
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print("🟧🔘OrageButton의 touchesBegan 인식")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        print("🟧🔘OrageButton의 touchesMoved 인식")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        print("🟧🔘OrageButton의 touchesEnded 인식\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        print("🟧🔘OrageButton의 touchesCancelled 인식\n")
    }
}
