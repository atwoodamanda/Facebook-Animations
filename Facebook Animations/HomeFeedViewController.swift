//
//  HomeFeedViewController.swift
//  Facebook Animations
//
//  Created by Amanda Atwood on 10/29/14.
//  Copyright (c) 2014 Amanda Atwood. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1548)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onPhotoTap(sender: AnyObject) {
        performSegueWithIdentifier("imageSegue", sender: self)
    }


}
