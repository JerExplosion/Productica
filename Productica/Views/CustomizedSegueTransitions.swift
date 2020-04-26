//
//  CustomizedSegueTransitions.swift
//  Productica
//
//  Created by Jerry Ren on 4/23/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class CustomizedSegueTransitions: UIStoryboardSegue {
    override func perform() {
        super.perform()
        destination.transitioningDelegate = self
    }
}

class PresentationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.66
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewController(forKey: .to)!
        let toView = transitionContext.view(forKey: .to)
        
        if let toView = toView {
            transitionContext.containerView.addSubview(toView)
        }
        toView?.frame = .zero
        toView?.layoutIfNeeded()
        
        let duration = transitionDuration(using: transitionContext)
        let lastFrame = transitionContext.finalFrame(for: toViewController)
        
        UIView.animate(withDuration: duration, animations: {
            toView?.frame = lastFrame
            toView?.layoutIfNeeded()
            
        }, completion: {
            done in
            transitionContext.completeTransition(true)
        })
        
    }
}

extension CustomizedSegueTransitions: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentationAnimator()
    }
}


