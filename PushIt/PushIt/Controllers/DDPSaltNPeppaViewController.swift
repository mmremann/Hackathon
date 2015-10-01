//
//  DDPSaltNPeppaViewController.swift
//  PushIt
//
//  Created by Mann, Josh (US - Denver) on 9/25/15.
//  Copyright © 2015 Mann, Josh (US - Denver). All rights reserved.
//

import UIKit

class DDPSaltNPeppaViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        <iframe webkit-playsinline width="200" height="200" src="https://www.youtube.com/embed/GOiIxqcbzyM?feature=player_detailpage&playsinline=1" frameborder="0"></iframe>
        let url = NSURL (string: "http://www.vevo.com/watch/salt-n-pepa/push-it/USIV30400109?playsinline=1");
        let requestObj = NSURLRequest(URL: url!);
        webView.allowsInlineMediaPlayback = true
        webView.loadRequest(requestObj);

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
