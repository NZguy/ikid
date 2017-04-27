//
//  FlippedViewController.swift
//  iKid
//
//  Created by Duncan Andrew on 4/26/17.
//  Copyright © 2017 Duncan Andrew. All rights reserved.
//

import UIKit

class FlippedViewController: UIViewController {

    let joke = JokeController.sharedInstance
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textLabel.text = joke.jokes[joke.x][joke.y]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
