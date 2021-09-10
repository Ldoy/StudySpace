//
//  GreenView.swift
//  ResponderChainExercise
//
//  Created by Do Yi Lee on 2021/09/09.
//

import UIKit

class GreenView: UIView {
//
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView: UIView? = super.hitTest(point, with: event)
        print("그린뷰 히트테스트🌟")

        if (self == hitView) { return nil }
        return hitView
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("GreenView의 touchesBegan 인식")
}

override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("GreenView의 touchesMoved 인식")
}

override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("GreenView의 touchesEnded 인식")
}

override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("GreenView의 touchesCancelled 인식")
}

    
}
