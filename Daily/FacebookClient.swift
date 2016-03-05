//
//  FacebookClient.swift
//  Daily
//
//  Created by Isaac Albets Ramonet on 01/03/16.
//  Copyright © 2016 IncorexEnterprise. All rights reserved.
//

import Foundation

class FacebookClient{

    // MARK: Properties
    
    private let loginManager = FBSDKLoginManager()
    
    // MARK: Singleton Instances
    
    private static var sharedInstance = FacebookClient()
    
    class func sharedClient() -> FacebookClient {
        return sharedInstance
    }
    
    // MARK: Class functions
    
    class func activeApp(){
        // Notifies the Facebook SDK events system that the ap has launched and, when appropiate, logs an "activated app" event
        FBSDKAppEvents.activateApp()
    }
    
    class func setupWithOptions(application: UIApplication, launchOptions: [NSObject: AnyObject]?) -> Bool{
        // Ensures proper use of the Facebook SDK
        FBSDKSettings.setAppURLSchemeSuffix(FacebookClient.Common.URLSuffix)
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    class func processURL(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        // Handle interaction with native FAcebook App or Safari as part of the SSO authorization flow or Facebook Dialogs
        
        if url.scheme == FacebookClient.Common.URLScheme{
            return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        } else{
            return true
        }
    }
    
    // MARK: Access Token
    
    func currentAccessToken() -> FBSDKAccessToken! {
        return FBSDKAccessToken.currentAccessToken()
    }
    
    // MARK: Logout
    
    func logout(){
        loginManager.logOut()
    }
}