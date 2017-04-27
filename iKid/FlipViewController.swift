//
//  ViewController.swift
//  iKid
//
//  Created by Duncan Andrew on 4/26/17.
//  Copyright © 2017 Duncan Andrew. All rights reserved.
//

import UIKit

class FlipViewController: UIViewController {

    var jokeVC: FlippedViewController!
    var punchVC: FlippedViewController!
    
    let joke = JokeController.sharedInstance
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        jokeVC = nil
        punchVC = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        joke.x = Int(self.restorationIdentifier!)!
        // Setting to -1 becuase it will be iterated in switchView
        joke.y = -1
        
        switchView(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchView(_ sender: Any) {
        if joke.y >= joke.jokes[joke.x].count - 1{
            joke.y = 0
        }else{
            joke.y += 1
        }
        
        jokeBuilder()
        punchBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
        
        if jokeVC != nil && jokeVC?.view.superview != nil{
            punchVC.view.frame = view.frame
            switchViewController(jokeVC, to: punchVC)
        } else {
            jokeVC.view.frame = view.frame
            switchViewController(punchVC, to: jokeVC)
        }
        
        UIView.commitAnimations()
    }

    fileprivate func jokeBuilder(){
        if jokeVC == nil{
            jokeVC = storyboard?.instantiateViewController(withIdentifier: "Joke") as! FlippedViewController
        }
    }
    
    fileprivate func punchBuilder(){
        if punchVC == nil{
            punchVC = storyboard?.instantiateViewController(withIdentifier: "Punchline") as! FlippedViewController
        }
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?){
        //to.view.frame = view.frame
        
        if from != nil{
            // Remove view controller and view
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil{
            // Add view controller and view
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }

}
