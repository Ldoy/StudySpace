//
//  GestureRecognizer.swift
//  ResponderChainExercise
//
//  Created by Do Yi Lee on 2021/09/21.
//

import UIKit

//MARK:- Experiment2
class GreenViewGestureRecognizer: UITapGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        print("🟩👆GreenViewGestureRecognizer의 touchesBegan")
    }
        
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        print("🟩👆GreenViewGestureRecognizer의 touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        print("🟩👆GreenViewGestureRecognizer의 touchesEnded\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        print("🟩👆GreenViewGestureRecognizer의  touchesCancelled\n")
    }
}

//MARK:- Experiment3
class BlueViewGestureRecognizer: UITapGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        print("🟦👆BlueViewGestureRecognizer의 touchesBegan")
    }
        
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        print("🟦👆BlueViewGestureRecognizer의 touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        print("🟦👆BlueViewGestureRecognizer의 touchesEnded\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        print("🟦👆BlueViewGestureRecognizer의  touchesCancelled\n")
    }
}

//MARK:- Experiment4
class OrangeButtonGestureRecognizer: UITapGestureRecognizer {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        print("⬜️👆WhiteViewGestureRecognizer의 touchesBegan")
    }
        
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        print("⬜️👆WhiteViewGestureRecognizer의 touchesMoved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        print("⬜️👆WhiteViewGestureRecognizer의 touchesEnded\n")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        print("⬜️👆WhiteViewGestureRecognizer의  touchesCancelled\n")
    }
}
