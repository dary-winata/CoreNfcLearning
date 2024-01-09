//
//  ViewController.swift
//  LearningCoreNFC
//
//  Created by dary winata nugraha djati on 22/09/23.
//

import UIKit
import CoreNFC

class ViewController: UIViewController, NFCNDEFReaderSessionDelegate {
    
    @IBOutlet weak var textTf: UILabel!
    var session : NFCNDEFReaderSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        DispatchQueue.main.async {
            self.textTf.text = messages.description
            print(messages)
        }
    }
    
    @IBAction func beginScanning(_ sender: Any) {
        guard NFCNDEFReaderSession.readingAvailable else {
            let alertController = UIAlertController(
                title: "Scanning not supported", message: "This device doesn't support tag scanning.", preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session?.alertMessage = "Hold your iPhone near the item to learn more about it."
        session?.begin()

    }
}

