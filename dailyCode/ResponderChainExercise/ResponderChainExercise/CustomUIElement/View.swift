//
//  GreenView.swift
//  ResponderChainExercise
//
//  Created by Do Yi Lee on 2021/09/09.
//

import UIKit

//MARK:- Experiment1 화면 전체를 덮고 있는 가장 큰 뷰, Yello View
class YellowView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView: UIView? = super.hitTest(point, with: event)
        print("🟨Yellow View 히트테스트")
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let point = super.point(inside: point, with: event)
        print("🟨Yellow View의 point메소드, point메소드 반환값: \(point)")
        //MARK: 이렇게 하면 grayView의 hitTest가 호출되지 않음
        //if point {
        //    return false
        //}
        return point
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟨Yellow View의 touchesBegan 인식")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟨Yellow View의 touchesMoved 인식")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟨Yellow View의 touchesEnded 인식\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟨Yellow View의 touchesCancelled 인식 \n")
    }
    
}

//MARK:- Evercise1(hitTest, point메서드 테스트를 위해 추가한 View)
class GrayView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView: UIView? = super.hitTest(point, with: event)
        print("◻️GrayView 히트테스트")
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let point = super.point(inside: point, with: event)
        print("◻️GrayView의 point메소드, point메소드 반환값: \(point)")
        return point
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("◻️GrayView의 touchesBegan 인식")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("◻️GrayView의 touchesMoved 인식")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("◻️GrayView의 touchesEnded 인식\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("◻️GrayView의 touchesCancelled 인식 \n")
    }
    
}
//MARK:- Exercise2(Gesture Recognizer 객체의 메서드 호출 확인하기 위한 BlueView)
class GreenView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView: UIView? = super.hitTest(point, with: event)
        print("🟩GreenView 히트테스트")
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let point = super.point(inside: point, with: event)
        print("🟩GreenView의 point메소드, point메소드 반환값: \(point)")
        return point
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟩GreenView의 touchesBegan 인식")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟩GreenView의 touchesMoved 인식")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟩GreenView의 touchesEnded 인식\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟩GreenView의 touchesCancelled 인식 \n")
    }
    
}

//MARK:- Exercise3
class BlueView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView: UIView? = super.hitTest(point, with: event)
        print("🟦BlueView 히트테스트")
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let point = super.point(inside: point, with: event)
        print("🟦BlueView의 point메소드, point메소드 반환값: \(point)")
        return point
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟦BlueView의 touchesBegan 인식")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟦BlueView의 touchesMoved 인식")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟦BlueView의 touchesEnded 인식\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("🟦BlueView의 touchesCancelled 인식 \n")
    }
    
}

//MARK:- Exercise4
class WhiteView: UIView {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView: UIView? = super.hitTest(point, with: event)
        print("⬜️WhiteView 히트테스트")
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let point = super.point(inside: point, with: event)
        print("⬜️WhiteView의 point메소드, point메소드 반환값: \(point)")
        return point
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("⬜️WhiteView의 touchesBegan 인식")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("⬜️WhiteView의 touchesMoved 인식")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("⬜️WhiteView의 touchesEnded 인식\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("⬜️WhiteView의 touchesCancelled 인식 \n")
    }
}
