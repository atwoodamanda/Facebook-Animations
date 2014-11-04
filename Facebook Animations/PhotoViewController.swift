//
//  PhotoViewController.swift
//  Facebook Animations
//
//  Created by Amanda Atwood on 10/29/14.
//  Copyright (c) 2014 Amanda Atwood. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var photoActions: UIImageView!
    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        imageView.image = image
        scrollView.contentSize = CGSize(width: 320, height: 620)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var number = 1 - abs(scrollView.contentOffset.y/100)
        println(number)
        photoActions.alpha = number
        doneButton.alpha = 0.0001
        backgroundView.alpha = number
        if
    }
    

}
