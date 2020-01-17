// ==================================================================
// Created by:  GW Rodriguez
// Date:        1/17/20
// Swift:       5.0
// Copyright:   Copyright © 2020 GW Rodriguez. All rights reserved.
// ==================================================================

import Cocoa
import SwiftOSC


class ViewController: NSViewController, OSCServerDelegate {
    
    var server: OSCServer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override var representedObject: Any? {
        didSet {
            
        }
    }


    @IBAction func connectClicked(_ sender: Any) {
        server = OSCServer(address: "localhost", port: 8080)
        server.delegate = self
        server.start()
    }
    
    
    @IBAction func queryClicked(_ sender: Any) {
        print("Address: \(server.address)")
        print("Port: \(server.port)")
        print("Running: \(server.running)")
        print("Delegate: \(String(describing: server.delegate))")
        print("Self: \(String(describing: self))\n")
    }
    
    
    func didReceive(_ message: OSCMessage) {
        print(message)
    }
    
    
    func didReceive(_ bundle: OSCBundle) {
        print("Bundle:\n\(bundle)")
    }
    
    
    func didReceive(_ data: Data) {
        print("Data:\n\(data)")
    }
}

