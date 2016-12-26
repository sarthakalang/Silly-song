//
//  ViewController.swift
//  Silly Song
//
//  Created by Sarthak on 12/26/16.
//  Copyright © 2016 Sarthak. All rights reserved.
//

import UIKit



func shortname(_ name:String)->String{
    var name=name
    name.remove(at: name.startIndex)
    return name
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")
var s="fhgggvh"


func lyricsResult(_ name:String,temp:String)->String{
    let shortName=shortname(name)
    let a=temp.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    let b=a.replacingOccurrences(of: "<FULL_NAME>", with: name)
    return(b)
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {
    

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(_ sender: Any) {
        nameField.text=""
        lyricsView.text=""
        nameField.autocapitalizationType=UITextAutocapitalizationType.words
        nameField.returnKeyType=UIReturnKeyType.done
        
        
    }

    @IBAction func displayLyrics(_ sender: Any) {
        var lyrics:String
        let n:String=nameField.text!
        lyrics=lyricsResult(n, temp: bananaFanaTemplate)
        lyricsView.text=lyrics
        
    }

}

