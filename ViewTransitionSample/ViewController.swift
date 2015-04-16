//
//  ViewController.swift
//  ViewTransitionSample
//
//  Created by lostin1 on 2015. 4. 16..
//  Copyright (c) 2015년 lostin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var view1:UIView?
    var view2:UIView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupView() {
        view1 = UIView(frame:self.view.frame)
        view1!.backgroundColor = UIColor.lightTextColor()
        view2 = UIView(frame:self.view.frame)
        view2!.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(view1!)
        self.view.sendSubviewToBack(view1!)
    }
    
    func doTransitionWithType(animationType:UIViewAnimationOptions) {
        let subViews:NSArray = NSArray(array: self.view.subviews)
        if  subViews.containsObject(view2!) == true {
            UIView.transitionFromView(view2!, toView: view1!, duration: 2, options: animationType, completion: { finished in
                self.view2!.removeFromSuperview()
            })
            self.view.addSubview(view1!)
            self.view.sendSubviewToBack(view1!)
        }
        else {
            UIView.transitionFromView(view1!, toView: view2!, duration: 2, options: animationType, completion: { finished in
                self.view1!.removeFromSuperview()
            })
            self.view.addSubview(view2!)
            self.view.sendSubviewToBack(view2!)
        }
    }
    
    @IBAction func flipFromTop(sender: AnyObject) {
        self.doTransitionWithType(UIViewAnimationOptions.TransitionFlipFromTop)
    }
    @IBAction func flipFromBottom(sender: AnyObject) {
        self.doTransitionWithType(UIViewAnimationOptions.TransitionFlipFromBottom)
    }

    @IBAction func flipFromLeft(sender: AnyObject) {
        self.doTransitionWithType(UIViewAnimationOptions.TransitionFlipFromLeft)
    }
    @IBAction func flipFromRight(sender: AnyObject) {
        self.doTransitionWithType(UIViewAnimationOptions.TransitionFlipFromRight)
    }
    @IBAction func curlDown(sender: AnyObject) {
        self.doTransitionWithType(UIViewAnimationOptions.TransitionCurlDown)
    }
    @IBAction func curlUp(sender: AnyObject) {
        self.doTransitionWithType(UIViewAnimationOptions.TransitionCurlUp)
    }
    @IBAction func dissolve(sender: AnyObject) {
        self.doTransitionWithType(UIViewAnimationOptions.TransitionCrossDissolve)
    }
    @IBAction func noTransition(sender: AnyObject) {
        self.doTransitionWithType(UIViewAnimationOptions.TransitionNone)
    }
    
}

