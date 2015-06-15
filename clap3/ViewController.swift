//
//  ViewController.swift
//  clap3
//
//  Created by 澤井聖也 on 2015/06/15.
//  Copyright (c) 2015年 澤井聖也. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, UIPickerViewDelegate, AVAudioPlayerDelegate {
    
    
    @IBOutlet var clapPickerView: UIPickerView!
    var soundCount:Int = 0
    var audioplayer: AVAudioPlayer!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")!
        let fileURL : NSURL = NSURL(fileURLWithPath : soundFilePath as String)!
        
        
        audioplayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
        -> String!{
            return "\(row+1)回"
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        soundCount = row
    }
    
    @IBAction func plusBotton (){
        audioplayer.numberOfLoops = soundCount
        audioplayer.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

