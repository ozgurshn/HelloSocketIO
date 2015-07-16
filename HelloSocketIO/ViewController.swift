//
//  ViewController.swift
//  HelloSocketIO
//
//  Created by özgür on 16.07.2015.
//  Copyright (c) 2015 ozgur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var textView: UITextView!
    
    let socket = SocketIOClient(socketURL: "localhost:3000")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addHandlers()
        self.socket.connect()
        
    }


    @IBAction func sendMessage(sender: AnyObject) {
        
        self.socket.emit("chatMessage", textField.text)
        self.textView.text! +=  "Sent: \(textField.text)\n"
    }
    
    func addHandlers() {
        //catches every event
        self.socket.onAny {
            println("Got event: \($0.event), with items: \($0.items)")
            self.textView.text! += "Event: \($0.event)\n"
        }
        
        self.socket.on("chatMessage") {[weak self] data, ack in
            if let message = data?[0] as? String {
                self!.textView.text! +=  "Received: \(message)\n"
                
            }
            return
        }
    }



}

