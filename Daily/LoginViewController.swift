//
//  LoginViewController.swift
//  Daily
//
//  Created by Isaac Albets Ramonet on 01/03/16.
//  Copyright © 2016 IncorexEnterprise. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: LoginState
    
    private enum LoginState {case Init, Idle, LoginWithUserPass, LoginWithFacebook }


    // MARK: Properties
    
    private let facebookClient = FacebookClient.sharedClient()
    
    // MARK: Outlets
    
    @IBOutlet weak var facebookLoginButton: FBSDKLoginButton!
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        facebookClient.logout()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if facebookClient.currentAccessToken() == nil {
            configureUIForState(.Idle)
        }
    }

}

extension LoginViewController {
    
    func loginButtonWillLogin(loginButton: FBSDKLoginButton!) -> Bool {
        if facebookClient.currentAccessToken() == nil {
            configureUIForState(.LoginWithFacebook)
        }
        return true
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!){
    
        func displayError(error: String){
            self.facebookClient.logout()
            self.rejectWithError(error)
        
        }
        
        configureUIForState(.LoginWithFacebook)
        
        if let token = result.token.tokenString{
            myServerClient.loginWithFacebookToken(token) { (userKey, error) in
                dispatch_async(dispatch_get_main_queue()){
                    if let userKey = userKey{
                        // perform entry with userKey
                    }else{
                        displayError(error!.localizedDescription)
                    }
                }
            
            }
        }
        
    }
    

    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!){
        configureUIForState(.Idle)
    }
}