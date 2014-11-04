//
//  HomeFeedViewController.swift
//  Facebook Animations
//
//  Created by Amanda Atwood on 10/29/14.
//  Copyright (c) 2014 Amanda Atwood. All rights reserved.
//

import UIKit

class HomeFeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    var photoInitialCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1548)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var toViewController = segue.destinationViewController as PhotoViewController
        toViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        toViewController.transitioningDelegate = self
        toViewController.image = self.imageView.image
        
    }

    @IBAction func onPhotoTap(sender: AnyObject) {
        
        
        performSegueWithIdentifier("imageSegue", sender: self)
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            
            var photoVC = toViewController as PhotoViewController
            photoVC.imageView.hidden = true
            toViewController.view.alpha = 0
            
            var window = UIApplication.sharedApplication().keyWindow
            var bigPhoto = UIImageView(frame: imageView.frame)
            bigPhoto.image = imageView.image
            bigPhoto.contentMode = imageView.contentMode
            window.addSubview(bigPhoto)

            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                bigPhoto.frame = photoVC.imageView.frame
                toViewController.view.alpha = 1
                }, completion: { (finished: Bool) -> Void in
                bigPhoto.removeFromSuperview()
                photoVC.imageView.hidden = false
                transitionContext.completeTransition(true)
            })
            
            
        } else {
            println(toViewController)
            var photoVC = fromViewController as PhotoViewController
            //var feedVC = toViewController as HomeFeedViewController
            var window = UIApplication.sharedApplication().keyWindow
            //imageView.hidden = true
            //feedVC.imageView.hidden = true
            
            var smallPhoto = UIImageView(frame: photoVC.imageView.frame)
            smallPhoto.image = photoVC.imageView.image
            smallPhoto.contentMode = photoVC.imageView.contentMode
            window.addSubview(smallPhoto)
            smallPhoto.hidden = false
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                smallPhoto.frame = self.imageView.frame
                fromViewController.view.alpha = 0
                
                
                }) { (finished: Bool) -> Void in
                    smallPhoto.removeFromSuperview()
                   // feedVC.imageView.hidden = false
                    fromViewController.view.removeFromSuperview()
                    transitionContext.completeTransition(true)
            }
        }
    }

}
