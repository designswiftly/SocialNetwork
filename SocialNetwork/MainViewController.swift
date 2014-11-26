//
//  ViewController.swift
//  SocialNetwork
//
//  Created by Pierluigi Cifani on 26/11/14.
//  Copyright (c) 2014 Pierluigi Cifani. All rights reserved.
//

import UIKit
import MediaPlayer
import QuartzCore

class MainViewController: UIViewController {

    var moviePlayer : MPMoviePlayerController!
    var animationCompleted : Bool = false

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Preparar Video
        let videoLocation = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("video", ofType: "mp4")!)
        moviePlayer = MPMoviePlayerController(contentURL: videoLocation)!
        moviePlayer.controlStyle = MPMovieControlStyle.None
        moviePlayer.repeatMode = MPMovieRepeatMode.One
        moviePlayer.scalingMode = MPMovieScalingMode.AspectFill
        moviePlayer.view.frame = CGRectMake(0, 0, 320, 568)
        moviePlayer.play()
        self.view.insertSubview(moviePlayer.view, atIndex:0)
        
        //Preparar Botón
        loginButton.layer.cornerRadius = 15;
        loginButton.clipsToBounds = true;
        loginButton.titleLabel?.font = UIFont(name: "BAUER", size: 24.0);
        loginButton.alpha = 0.0
        
        //Preparar Botón
        nameLabel.font = UIFont(name: "BAUER", size: 40.0);
        nameLabel.textColor = UIColor.whiteColor()
        
        //Añadir Parallax
        let buttonInterpolationX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        buttonInterpolationX.minimumRelativeValue = -10;
        buttonInterpolationX.maximumRelativeValue = 10;
        
        let buttonInterpolationY = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        buttonInterpolationY.minimumRelativeValue = -10;
        buttonInterpolationY.maximumRelativeValue = 10;

        loginButton.addMotionEffect(buttonInterpolationX)
        loginButton.addMotionEffect(buttonInterpolationY)
        nameLabel.addMotionEffect(buttonInterpolationX)
        nameLabel.addMotionEffect(buttonInterpolationY)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if (animationCompleted == false) {
            
            UIView.animateWithDuration(3.0, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                //Animamos el logo para arriba
                let startFrame = self.nameLabel.frame
                let finalFrame = CGRectMake(startFrame.origin.x, startFrame.origin.y - 100, startFrame.size.width, startFrame.size.height)
                
                self.nameLabel.frame = finalFrame
                }, completion: nil)
            
            UIView.animateWithDuration(1.5, delay: 1.5, usingSpringWithDamping: 3.0, initialSpringVelocity: 3.0, options: .CurveEaseInOut, animations: { () -> Void in
                
                //Hacemos que el boton aparezca
                self.loginButton.alpha = 1.0
                }, completion: nil)
            
            animationCompleted = true
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationViewController : UIViewController = segue.destinationViewController as UIViewController
        destinationViewController.modalTransitionStyle = .CrossDissolve
    }
}

