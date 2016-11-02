//
//  PuzzleViewController.swift
//  JigsawPuzzle
//
//  Created by CS3714 on 10/31/16.
//  Copyright © 2016 Jesus Fabian. All rights reserved. one day late
//

import UIKit
import AVFoundation

class PuzzleViewController: UIViewController {

    @IBOutlet var topLabel: UILabel!
 
    
    @IBOutlet var playerRatingLabel: UILabel!

    
    @IBOutlet var timerLabel: UILabel!
    
    
    //when game is being played
    
    var timer = Timer()
    var inSession = false;
    var sessionFinished = false;
    var puzzlePiecesInPlace = 0;
    
    //when done
    var congratsImageView : UIImageView!
    
    
    var audioPlayer :AVAudioPlayer?
    
    var hours = 0;
    var mins = 0;
    var seconds = 0;
    var allCounter = 0;
    
    var plist_puzzzlePieces = [String : [Int]]()
    
    
    
    
    var rocket1 : UIImageView!
    var rocket2 : UIImageView!
    
    let animationStart1 : CGPoint = CGPoint(x: 80, y: 500)
    let animationStart2 : CGPoint = CGPoint(x: 930, y: 589)
    let animationDistance: CGFloat = 500.0
    
    let animationEnd1 : CGPoint = CGPoint(x : 48, y: 589 - 500)
    let animationEnd2 : CGPoint = CGPoint(x : 930, y: 589 - 500)

    
    
    var puzzleImage1 : UIImageView!
    var puzzleImage2 : UIImageView!
    var puzzleImage3 : UIImageView!
    var puzzleImage4 : UIImageView!
    var puzzleImage5 : UIImageView!
    var puzzleImage6 : UIImageView!
    var puzzleImage7 : UIImageView!
    var puzzleImage8 : UIImageView!
    var puzzleImage9 : UIImageView!
    var puzzleImage10 : UIImageView!
    var puzzleImage11 : UIImageView!
    var puzzleImage12 : UIImageView!
    
    
    var puzzleImageInPlace1 = false
    var puzzleImageInPlace2 = false
    var puzzleImageInPlace3 = false
    var puzzleImageInPlace4 = false
    var puzzleImageInPlace5 = false
    var puzzleImageInPlace6 = false
    var puzzleImageInPlace7 = false
    var puzzleImageInPlace8 = false
    var puzzleImageInPlace9 = false
    var puzzleImageInPlace10 = false
    var puzzleImageInPlace11 = false
    var puzzleImageInPlace12 = false
    
    var lastTranslation1 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation2 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation3 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation4 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation5 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation6 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation7 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation8 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation9 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation10 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation11 = CGPoint(x: 0.0, y: 0.0)
    var lastTranslation12 = CGPoint(x: 0.0, y: 0.0)
    
    
    var currPuzzImgXLoc: CGFloat!
    var currPuzzImgYLoc : CGFloat!
    
    
    @IBAction func newGameTapped(_ sender: AnyObject) {
        print("hello")
        if (sessionFinished){

            allCounter = 0
            seconds = -1
            mins = 0
            hours = 0
            sessionFinished = false
            inSession = true
            puzzleImageInPlace1 = false
            puzzleImageInPlace2 = false
            puzzleImageInPlace3 = false
            puzzleImageInPlace4 = false
            puzzleImageInPlace5 = false
            puzzleImageInPlace6 = false
            puzzleImageInPlace7 = false
            puzzleImageInPlace8 = false
            puzzleImageInPlace9 = false
            puzzleImageInPlace10 = false
            puzzleImageInPlace11 = false
            puzzleImageInPlace12 = false
            playerRatingLabel.text = ""
            topLabel.text = "Tap New Game to Play!"
            
//            congratsImageView.removeFromSuperview()
            congratsImageView.isHidden = true;
            
            lastTranslation1 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation2 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation3 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation4 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation5 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation6 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation7 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation8 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation9 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation10 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation11 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation12 = CGPoint(x: 0.0, y: 0.0)
            
            drawRectangle()
            loadPieces()
            
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(labelTimer), userInfo: nil, repeats: true)
            
            
            
        }
        else{
            
            if (puzzleImage1 != nil && puzzleImage2 != nil && puzzleImage3 != nil && puzzleImage4 != nil && puzzleImage5 != nil && puzzleImage6 != nil && puzzleImage7 != nil && puzzleImage8 != nil && puzzleImage9 != nil && puzzleImage10 != nil && puzzleImage11 != nil && puzzleImage12 != nil) {
                puzzleImage1.removeFromSuperview()
                puzzleImage2.removeFromSuperview()
                puzzleImage3.removeFromSuperview()
                puzzleImage4.removeFromSuperview()
                puzzleImage5.removeFromSuperview()
                puzzleImage6.removeFromSuperview()
                puzzleImage7.removeFromSuperview()
                puzzleImage8.removeFromSuperview()
                puzzleImage9.removeFromSuperview()
                puzzleImage10.removeFromSuperview()
                puzzleImage11.removeFromSuperview()
                puzzleImage12.removeFromSuperview()
                
            }
            
            lastTranslation1 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation2 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation3 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation4 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation5 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation6 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation7 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation8 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation9 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation10 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation11 = CGPoint(x: 0.0, y: 0.0)
            lastTranslation12 = CGPoint(x: 0.0, y: 0.0)
            
            allCounter = 0
            seconds = -1
            mins = 0
            hours = 0
            
            
            drawRectangle()
            loadPieces()
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(labelTimer), userInfo: nil, repeats: true)

        
        }
        
        sessionFinished = false;
        inSession = true;
       
        
    }
    
    func loadPieces(){
        if (inSession){
            puzzleImage1.removeFromSuperview()
            puzzleImage2.removeFromSuperview()
            puzzleImage3.removeFromSuperview()
            puzzleImage4.removeFromSuperview()
            puzzleImage5.removeFromSuperview()
            puzzleImage6.removeFromSuperview()
            puzzleImage7.removeFromSuperview()
            puzzleImage8.removeFromSuperview()
            puzzleImage9.removeFromSuperview()
            puzzleImage10.removeFromSuperview()
            puzzleImage11.removeFromSuperview()
            puzzleImage12.removeFromSuperview()
        }
        let congratsPic = UIImage(named: "Congratulations.png")
        congratsImageView = UIImageView(image: congratsPic!)
        congratsImageView.frame = CGRect(x: 297, y: 307.5, width: 430, height: 153)
        view.addSubview(congratsImageView)
        congratsImageView.isHidden = true
        randomizePuzzlePieces()
        
    }
    
    func randomizePuzzlePieces(){
        puzzleImage1 = UIImageView(frame: CGRect(x: generateRandomXLoc() , y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage1.image = UIImage(named: "PuzzleImage1.png")
        puzzleImage1.contentMode = UIViewContentMode.center
        puzzleImage1.isUserInteractionEnabled = true
        
        let panRecognizer1 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning1(_:)))
        puzzleImage1.addGestureRecognizer(panRecognizer1)
        self.view.addSubview(puzzleImage1)
        
        ////second puzzle image and more 
        
        puzzleImage2 = UIImageView(frame: CGRect(x: generateRandomXLoc(), y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage2.image = UIImage(named: "PuzzleImage2.png")
        puzzleImage2.contentMode = UIViewContentMode.center
        puzzleImage2.isUserInteractionEnabled = true
        let panRecognizer2 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning2(_:)))
        puzzleImage2.addGestureRecognizer(panRecognizer2)
        self.view.addSubview(puzzleImage2)
        
       //
        puzzleImage3 = UIImageView(frame: CGRect(x: generateRandomXLoc() , y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage3.image = UIImage(named: "PuzzleImage3.png")
        puzzleImage3.contentMode = UIViewContentMode.center
        puzzleImage3.isUserInteractionEnabled = true
        
        let panRecognizer3 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning3(_:)))
        puzzleImage3.addGestureRecognizer(panRecognizer3)
        self.view.addSubview(puzzleImage3)
//

        puzzleImage4 = UIImageView(frame: CGRect(x: generateRandomXLoc() , y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage4.image = UIImage(named: "PuzzleImage4.png")
        puzzleImage4.contentMode = UIViewContentMode.center
        puzzleImage4.isUserInteractionEnabled = true
        let panRecognizer4 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning4(_:)))
        puzzleImage4.addGestureRecognizer(panRecognizer4)
        self.view.addSubview(puzzleImage4)
//
//        

        puzzleImage5 = UIImageView(frame: CGRect(x: generateRandomXLoc(), y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage5.image = UIImage(named: "PuzzleImage5.png")
        puzzleImage5.contentMode = UIViewContentMode.center
        puzzleImage5.isUserInteractionEnabled = true
        let panRecognizer5 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning5(_:)))
        puzzleImage5.addGestureRecognizer(panRecognizer5)
        self.view.addSubview(puzzleImage5)
//

        
        puzzleImage6 = UIImageView(frame: CGRect(x: generateRandomXLoc(), y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage6.image = UIImage(named: "PuzzleImage6.png")
        puzzleImage6.contentMode = UIViewContentMode.center
        puzzleImage6.isUserInteractionEnabled = true
        let panRecognizer6 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning6(_:)))
        puzzleImage6.addGestureRecognizer(panRecognizer6)
        self.view.addSubview(puzzleImage6)
//

        
        puzzleImage7 = UIImageView(frame: CGRect(x: generateRandomXLoc(), y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage7.image = UIImage(named: "PuzzleImage7.png")
        puzzleImage7.contentMode = UIViewContentMode.center
        puzzleImage7.isUserInteractionEnabled = true
        let panRecognizer7 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning7(_:)))
        puzzleImage7.addGestureRecognizer(panRecognizer7)
        self.view.addSubview(puzzleImage7)

        
        puzzleImage8 = UIImageView(frame: CGRect(x: generateRandomXLoc(), y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage8.image = UIImage(named: "PuzzleImage8.png")
        puzzleImage8.contentMode = UIViewContentMode.center
        puzzleImage8.isUserInteractionEnabled = true
        let panRecognizer8 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning8(_:)))
        puzzleImage8.addGestureRecognizer(panRecognizer8)
        self.view.addSubview(puzzleImage8)

        
        puzzleImage9 = UIImageView(frame: CGRect(x: generateRandomXLoc() , y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage9.image = UIImage(named: "PuzzleImage9.png")
        puzzleImage9.contentMode = UIViewContentMode.center
        puzzleImage9.isUserInteractionEnabled = true
        let panRecognizer9 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning9(_:)))
        puzzleImage9.addGestureRecognizer(panRecognizer9)
        self.view.addSubview(puzzleImage9)

        
        puzzleImage10 = UIImageView(frame: CGRect(x: generateRandomXLoc(), y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage10.image = UIImage(named: "PuzzleImage10.png")
        puzzleImage10.contentMode = UIViewContentMode.center
        puzzleImage10.isUserInteractionEnabled = true
        let panRecognizer10 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning10(_:)))
        puzzleImage10.addGestureRecognizer(panRecognizer10)
        self.view.addSubview(puzzleImage10)

        
        puzzleImage11 = UIImageView(frame: CGRect(x: generateRandomXLoc() , y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage11.image = UIImage(named: "PuzzleImage11.png")
        puzzleImage11.contentMode = UIViewContentMode.center
        puzzleImage11.isUserInteractionEnabled = true
        let panRecognizer11 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning11(_:)))
        puzzleImage11.addGestureRecognizer(panRecognizer11)
        self.view.addSubview(puzzleImage11)
      
        
        puzzleImage12 = UIImageView(frame: CGRect(x: generateRandomXLoc(), y: generateRandomYLoc(), width: 603 / 4, height: 453 / 3))
        puzzleImage12.image = UIImage(named: "PuzzleImage12.png")
        puzzleImage12.contentMode = UIViewContentMode.center
        puzzleImage12.isUserInteractionEnabled = true
        let panRecognizer12 = UIPanGestureRecognizer(target: self, action: #selector(PuzzleViewController.puzzleImagePanning12(_:)))
        puzzleImage12.addGestureRecognizer(panRecognizer12)
        self.view.addSubview(puzzleImage12)
        
    }
    
    
    func puzzleImagePanning1(_ recognizer: UIPanGestureRecognizer) {
        
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage1)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation1.x + newTranslation.x, y: lastTranslation1.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation1.x += newTranslation.x
            lastTranslation1.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage1)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage1)
        }
    }
    
    
    func puzzleImagePanning2(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage2)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation2.x + newTranslation.x, y: lastTranslation2.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation2.x += newTranslation.x
            lastTranslation2.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage2)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage2)
        }
        
    }
    
    
    func puzzleImagePanning3(_ recognizer: UIPanGestureRecognizer){
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage3)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation3.x + newTranslation.x, y: lastTranslation3.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation3.x += newTranslation.x
            lastTranslation3.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage3)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage3)
        }
        
    }
    
    func puzzleImagePanning4(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage4)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation4.x + newTranslation.x, y: lastTranslation4.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation4.x += newTranslation.x
            lastTranslation4.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage4)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage4)
        }
        
    }
    
    func puzzleImagePanning5(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage5)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation5.x + newTranslation.x, y: lastTranslation5.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation5.x += newTranslation.x
            lastTranslation5.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage5)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage5)
        }
        
    }
    
    func puzzleImagePanning6(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage6)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation6.x + newTranslation.x, y: lastTranslation6.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation6.x += newTranslation.x
            lastTranslation6.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage6)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage6)
        }
        
    }
    
    func puzzleImagePanning7(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage7)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation7.x + newTranslation.x, y: lastTranslation7.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation7.x += newTranslation.x
            lastTranslation7.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage7)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage7)
        }
        
    }
    func puzzleImagePanning8(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage8)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation8.x + newTranslation.x, y: lastTranslation8.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation8.x += newTranslation.x
            lastTranslation8.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage8)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage8)
        }
        
    }
    func puzzleImagePanning9(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage9)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation9.x + newTranslation.x, y: lastTranslation9.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation9.x += newTranslation.x
            lastTranslation9.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage9)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage9)
        }
        
    }
    func puzzleImagePanning10(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage10)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation10.x + newTranslation.x, y: lastTranslation10.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation10.x += newTranslation.x
            lastTranslation10.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage10)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage10)
        }
        
    }
    func puzzleImagePanning11(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage11)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation11.x + newTranslation.x, y: lastTranslation11.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation11.x += newTranslation.x
            lastTranslation11.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage11)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage11)
        }
        
    }
    func puzzleImagePanning12(_ recognizer: UIPanGestureRecognizer) {
        let newTranslation: CGPoint = recognizer.translation(in: puzzleImage12)
        
        recognizer.view?.transform = CGAffineTransform(translationX: lastTranslation12.x + newTranslation.x, y: lastTranslation12.y + newTranslation.y)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            lastTranslation12.x += newTranslation.x
            lastTranslation12.y += newTranslation.y
            
            let tempCenterLoc = updateCenter(pic: puzzleImage12)
            currPuzzImgXLoc = tempCenterLoc.x
            currPuzzImgYLoc = tempCenterLoc.y
            ///is it close to actually being where it's suppose to be?
            snapImageInIfClose(pic: puzzleImage12)
        }
        
    }
    
    
    
    
    
    //TRY TO CHAGE TO SWITCH STATEMENT
    
    func snapImageInIfClose(pic : UIImageView) {
        
        // X Coordinate of the Top Left Corner of the Canvas rectangle
        let canvasTopLeftCornerX = (UIScreen.main.bounds.width - 603)/2
        
        // Y Coordinate of the Top Left Corner of the Canvas rectangle
        let canvasTopLeftCornerY = (UIScreen.main.bounds.height - 453)/2
        
    
        
        if pic == puzzleImage1 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage1"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage1.frame.width / 2)
                let restY = CGFloat(puzzleImage1.frame.height / 2)
                puzzleImage1.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace1 = true
                 pieceFitsSound() //for sound
                  isGameOver()  //checks
                
            } else {
                puzzleImageInPlace1 = false
            }
        }
        
        
        if pic == puzzleImage2 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage2"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage2.frame.width / 2)
                let restY = CGFloat(puzzleImage2.frame.height / 2)
                puzzleImage2.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace2 = true
                 pieceFitsSound()
                
     isGameOver()
                
                
            } else {
                puzzleImageInPlace2 = false
            }
            
        }
//        //////
        if pic == puzzleImage3 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage3"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage3.frame.width / 2)
                let restY = CGFloat(puzzleImage3.frame.height / 2)
                puzzleImage3.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace3 = true
                pieceFitsSound()
               isGameOver()
                
            } else {
                puzzleImageInPlace1 = false
            }
        }
        ///
        if pic == puzzleImage4 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage4"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage4.frame.width / 2)
                let restY = CGFloat(puzzleImage4.frame.height / 2)
                puzzleImage4.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace4 = true
                pieceFitsSound()
                isGameOver()
                
                
            } else {
                puzzleImageInPlace4 = false
            }
        }
        ////
        if pic == puzzleImage5 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage5"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage5.frame.width / 2)
                let restY = CGFloat(puzzleImage5.frame.height / 2)
                puzzleImage5.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace5 = true
                pieceFitsSound()
                isGameOver()
                
            } else {
                puzzleImageInPlace5 = false
            }
            
        }
//        ////
        if pic == puzzleImage6 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage6"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage6.frame.width / 2)
                let restY = CGFloat(puzzleImage6.frame.height / 2)
                puzzleImage6.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace6 = true
                pieceFitsSound()
                isGameOver()
                
            } else {
                puzzleImageInPlace6 = false
            }
            
        }
        //
        
        if pic == puzzleImage7 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage7"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage7.frame.width / 2)
                let restY = CGFloat(puzzleImage7.frame.height / 2)
                puzzleImage7.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace7 = true
                pieceFitsSound()
isGameOver()
                
            } else {
                puzzleImageInPlace7 = false
            }
            
        }
        /////
        
        if pic == puzzleImage8 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage8"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage8.frame.width / 2)
                let restY = CGFloat(puzzleImage8.frame.height / 2)
                puzzleImage8.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace8 = true
                pieceFitsSound()
                isGameOver()
                
            } else {
                puzzleImageInPlace8 = false
            }
            
        }
        
        /////
        
        if pic == puzzleImage9 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage9"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage9.frame.width / 2)
                let restY = CGFloat(puzzleImage9.frame.height / 2)
                puzzleImage9.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace9 = true
                pieceFitsSound()
                isGameOver()
                
            } else {
                puzzleImageInPlace9 = false
            }
            
        }
        
        
        ////
        
        
        if pic == puzzleImage10 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage10"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage10.frame.width / 2)
                let restY = CGFloat(puzzleImage10.frame.height / 2)
                puzzleImage10.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace10 = true
                pieceFitsSound()
                isGameOver()
                
            } else {
                puzzleImageInPlace10 = false
            }
            
        }
        
  
        /////
        
        
        if pic == puzzleImage11 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage11"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage11.frame.width / 2)
                let restY = CGFloat(puzzleImage11.frame.height / 2)
                puzzleImage11.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace11 = true
                pieceFitsSound()
                isGameOver()
                
            } else {
                puzzleImageInPlace11 = false
            }
            
        }
        ////
        
        if pic == puzzleImage12 {
            let centerX = currPuzzImgXLoc
            let centerY = currPuzzImgYLoc
            let correctCoordinates : [Int] = plist_puzzzlePieces["PuzzleImage12"]!
            let coordinate = CGPoint(x: CGFloat(canvasTopLeftCornerX) + CGFloat(correctCoordinates[0]), y: CGFloat(canvasTopLeftCornerY) + CGFloat(correctCoordinates[1]))
            if (((coordinate.x - 20)...(coordinate.x + 20) ~= centerX!) && ((coordinate.y - 20)...(coordinate.y + 20) ~= centerY!)) {
                
                let restX = CGFloat(puzzleImage12.frame.width / 2)
                let restY = CGFloat(puzzleImage12.frame.height / 2)
                puzzleImage12.frame.origin = CGPoint(x: (coordinate.x - restX), y: (coordinate.y - restY))
                puzzleImageInPlace12 = true
                pieceFitsSound()
                isGameOver()
                
            } else {
                puzzleImageInPlace12 = false
            }
            
        }
    
    }
    
    
    
    
    
    //generates random locations
    func generateRandomXLoc() -> CGFloat {
        let randomX : UInt32 = 0 + arc4random_uniform(UInt32(UIScreen.main.bounds.width - 100))
        return CGFloat(randomX)
    }
    func generateRandomYLoc() -> CGFloat {
        let randomX : UInt32 = 0 + arc4random_uniform(UInt32(UIScreen.main.bounds.height - 100))
        return CGFloat(randomX)
    }
    
    
    
    func pieceFitsSound(){
    if let audioFileAsset = NSDataAsset(name: "clickSound") {
     do {
    try audioPlayer = AVAudioPlayer(data: audioFileAsset.data, fileTypeHint: "wav")
      audioPlayer!.play()
     } catch let error as NSError {
      print("error: \(error.localizedDescription)")
       }
    }

    
    }
    func applauseSound(){
    if let audioFileAsset = NSDataAsset(name: "applaudSound") {
    do {
    try audioPlayer = AVAudioPlayer(data: audioFileAsset.data, fileTypeHint: "wav")
    audioPlayer!.play()
    } catch let error as NSError {
    print("error: \(error.localizedDescription)")
    }
    }
    
    }

    
    ////CHANGE NAME
    
    func updateCenter (pic : UIImageView) -> CGPoint {
        
        let addedX = (pic.frame.width / 2)
        let addedY = (pic.frame.height / 2)
        
        let xNewCenter :  CGFloat = CGFloat(pic.frame.origin.x) + CGFloat(addedX)
        let yNewCenter : CGFloat = CGFloat(pic.frame.origin.y) + CGFloat(addedY)
        let newCGpointCenter : CGPoint = CGPoint(x: xNewCenter, y: yNewCenter)
        return newCGpointCenter
        
    }

    
    
    
    @IBOutlet var backgroundRect: UIImageView!
    
    //when game is being played
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let plistUrl : URL? = Bundle.main.url(forResource: "puzzlePieceCenterCoordinates", withExtension: "plist")
        
        let dictionaryFromFile : NSDictionary? = NSDictionary(contentsOf: plistUrl!)
        if let dictFromFile = dictionaryFromFile {
           plist_puzzzlePieces = dictFromFile as! Dictionary

    }

    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    }
    
    /*
     
     ---------------------
     
     MARK: - Create Canvas
     
     ---------------------
     
     */
    
    
    
    // This method creates a rectangular canvas centered on the screen to hold the puzzle
    
    // pieces when they are all put together (i.e., when the puzzle is solved).
    
    
    
    func drawRectangle() {
        
        
        
        // Set the size of the canvas to be created to width=603 and height=453
        
        let canvasSize = CGSize(width: 603, height: 453)
        
        
        
        // Set the properties of the graphics context to be created
        
        let bounds = CGRect(origin: CGPoint.zero, size: canvasSize)
        
        let opaque = false
        
        let scale: CGFloat = 0
        
        
        
        // Create a bitmap-based graphics context with the specified properties
        
        UIGraphicsBeginImageContextWithOptions(canvasSize, opaque, scale)
        
        
        
        // Set the current graphics context returned to context
        
        let context = UIGraphicsGetCurrentContext()
        
        
        
        // Set the current stroke color in the graphics context, using a Quartz color
        
        context?.setStrokeColor(UIColor.black.cgColor)
        
        
        
        // Set the line width for the graphics context to 3 points
        
        context?.setLineWidth(3.0)
        
        
        
        // Paint a rectangular path
        
        context?.stroke(bounds)
        
        
        
        context?.beginPath()
        
        context?.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
        
        context?.move(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        
        context?.strokePath()
        
        
        
        // Return an image based on the contents of the current bitmap-based graphics context
        
        let contextImage = UIGraphicsGetImageFromCurrentImageContext()
        
        
        
        // Remove the current bitmap-based graphics context from the top of the stack
        
        UIGraphicsEndImageContext()
        
        
        
        /*
         
         Create a UIImageView object in Storyboard with x=210, y=158, width=603, height=453
         
         Create an outlet for it as: @IBOutlet var backgroundRect: UIImageView!
         
         
         
         Set the UIImageView object's image to the image created based on the contents of
         
         the current bitmap-based graphics context.
         
         */
        
        backgroundRect.image = contextImage
        
    }
    
    
    
    
    
    func isGameOver() {
        
        if (puzzleImageInPlace1 && puzzleImageInPlace2 && puzzleImageInPlace3 && puzzleImageInPlace4 && puzzleImageInPlace5 && puzzleImageInPlace6 && puzzleImageInPlace7 && puzzleImageInPlace8 && puzzleImageInPlace9 && puzzleImageInPlace10 && puzzleImageInPlace11 && puzzleImageInPlace12) {
            
            puzzleImage1.removeFromSuperview()
            puzzleImage2.removeFromSuperview()
            puzzleImage3.removeFromSuperview()
            puzzleImage4.removeFromSuperview()
            puzzleImage5.removeFromSuperview()
            puzzleImage6.removeFromSuperview()
            puzzleImage7.removeFromSuperview()
            puzzleImage8.removeFromSuperview()
            puzzleImage9.removeFromSuperview()
            puzzleImage10.removeFromSuperview()
            puzzleImage11.removeFromSuperview()
            puzzleImage12.removeFromSuperview()
            backgroundRect.image = UIImage(named: "JigsawPuzzlePhoto.png")
            
        
            let congratsPic = UIImage(named: "Congratulations.png")
            congratsImageView = UIImageView(image: congratsPic!)
            congratsImageView.frame = CGRect(x: 297, y: 307.5, width: 430, height: 153)
            view.addSubview(congratsImageView)
            topLabel.text = "Tap New Game to Play Again!"
            applauseSound()
            placeRocketsOnScreen()
            
            
            if allCounter < 20 {
                playerRatingLabel.text = "You did Outstanding"
            }
            else if allCounter <= 40 {
                playerRatingLabel.text = "You did Excellent"
            }
            else if allCounter <= 120 {
                playerRatingLabel.text = "You did Good"
            }
            else if allCounter <= 180 {
                playerRatingLabel.text = "You did Satisfactory"
            }
            else {
                playerRatingLabel.text = "You did Slow"
            }
            
            sessionFinished = true;
            inSession = false;
            
        }
    }
    
    
    func placeRocketsOnScreen () {
        //    var imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0))
        rocket1 = UIImageView(frame: CGRect(x: 48, y: 589, width: 100, height: 100))
        rocket2 = UIImageView(frame: CGRect(x: 862, y: 589, width: 100, height: 100))
        rocket1.image = UIImage(named: "RocketFlyingUp.png")
        rocket2.image = UIImage(named: "RocketFlyingUp.png")
        self.view.addSubview(rocket1)
        self.view.addSubview(rocket2)
        
        rocket1.center = animationStart1
        rocket2.center = animationStart2
        
        rocket1.alpha = 1.0
        rocket2.alpha = 1.0
        
        UIView.beginAnimations("", context: nil)
        UIView.setAnimationDuration(2)
        
        rocket1.center = animationEnd1
        rocket2.center = animationEnd2
        
        rocket1.alpha = 0.0
        rocket2.alpha = 0.0
        
        UIView.commitAnimations()
        
        
    }
    
    
    
    
    func labelTimer() {
        
        if (puzzleImageInPlace1 && puzzleImageInPlace2 && puzzleImageInPlace3 && puzzleImageInPlace4 && puzzleImageInPlace5 && puzzleImageInPlace6 && puzzleImageInPlace7 && puzzleImageInPlace8 && puzzleImageInPlace9 && puzzleImageInPlace10 && puzzleImageInPlace11 && puzzleImageInPlace12) {
            timer.invalidate()
            
        }
        
        
        seconds += 1
        allCounter += 1
        if (seconds == 60) {
            mins += 1
            seconds = 0
        }
        if mins == 60 {
            hours += 1
            mins = 0
            seconds = 0
        }
        if seconds < 10 && mins < 10 {
            timerLabel.text = "Timer: \(hours):0\(mins):0\(seconds)"
        }
        else if (seconds < 10 && mins > 10) {
            timerLabel.text = "Timer: \(hours):\(mins):0\(seconds)"
            
        }
        else if (seconds > 10 && mins < 10) {
            timerLabel.text = "Timer: \(hours):0\(mins):\(seconds)"
        }
        else {
            
            timerLabel.text = "Timer: \(hours):\(mins):\(seconds)"
        }
        
    }

}
