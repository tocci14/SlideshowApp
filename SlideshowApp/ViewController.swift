//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Hisashi Sugimoto on 2017/04/25.
//  Copyright © 2017年 tocci14. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var mainImage: UIImageView!

    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    // 画像を読み込み
    let imageNameArray = [
        "01.JPG",
        "02.JPG",
        "03.JPG",
        "04.JPG",
        "05.JPG",
        "06.JPG"]
    
    var timer: Timer!
    var timer_sec: Float = 0
   
    
    @IBAction func back(_ sender: Any) {
        
        // 表示している画像の番号を1減らす
        if(dispImageNo > 0){
            dispImageNo -= 1
        }else{
            dispImageNo = imageNameArray.count - 1
        }
        
        displayImage()
        
    }

    @IBAction func next(_ sender: Any) {
        
        // 表示している画像の番号を1増やす
        if(dispImageNo < imageNameArray.count-1 ){
            dispImageNo += 1
        }else{
            dispImageNo = 0
        }
        
        displayImage()
        
    }
   
    @IBAction func play(_ sender: Any) {
        
        
        //タイマー処理
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer),userInfo: nil, repeats: true)
            
            playButton.setTitle( "停止", for: .normal)
            
            backButton.isEnabled = false
            nextButton.isEnabled = false
            
            
        }else{// タイマーを破棄
           self.timer.invalidate() // 現在のタイマーを破棄する
           self.timer = nil        // startTimer()のtimer == nil で判断するために、 timer = nil としておく
            playButton.setTitle( "再生", for: .normal)
            
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
        
    }
    
    
    func updateTimer(timer: Timer) {
        
        // この時は、画像を次々と切り換えて行きます.
        if(dispImageNo < imageNameArray.count-1 ){
            dispImageNo += 1
        }else{
            dispImageNo = 0
        }
        // 表示している画像の番号を1増やす
        
        displayImage()
        
    }
    
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        mainImage.image = image
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayImage()
        
        // 画像をタップ
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didClickImageView))
        mainImage.addGestureRecognizer(gesture)
        mainImage.isUserInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func didClickImageView(recognizer: UIGestureRecognizer){
        
        performSegue(withIdentifier: "NextViewController", sender: nil)
        
        if timer != nil {
            timer.invalidate()
            self.timer = nil
            playButton.setTitle( "再生", for: .normal)
            
            backButton.isEnabled = true
            nextButton.isEnabled = true
            
        }
        
    }

    // 遷移した際に呼ばれるメソッド。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController:NextViewController = segue.destination as! NextViewController
        viewController.selectedImageName = imageNameArray[dispImageNo]
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
}
