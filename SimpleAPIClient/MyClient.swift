//
//  MyClient.swift
//  SimpleAPIClient
//
//  Created by Kouki Saito on 2014/10/19.
//  Copyright (c) 2014年 Kouki. All rights reserved.
//

import UIKit



class MyClientRequestSerializer: AFHTTPRequestSerializer{
    override func requestWithMethod(method: String!, URLString: String!, parameters: AnyObject!, error:NSErrorPointer) -> NSMutableURLRequest! {
        var path:NSString = URLString + "?"
        
        var dictParameters:Dictionary<String, String>
        if (parameters != nil){
            dictParameters = parameters as Dictionary<String, String>
        }
        else{
            dictParameters = Dictionary<String, String>()
        }
        
        for key in dictParameters.keys{
            let value = dictParameters[key]
            
            path = path.stringByAppendingFormat("&%@=%@", key, value!)
        }
        
        let req = super.requestWithMethod(method, URLString: path, parameters: nil, error: error)
        
        return req
    }
    
}

class MyClient: AFHTTPSessionManager {
    
    class var sharedInstance : MyClient {
    struct Static {
        static var instance : MyClient = MyClient(baseURL:NSURL(string:"https://api.github.com/"))
        }
        return Static.instance
    }
    
    override init(baseURL url: NSURL!, sessionConfiguration configuration: NSURLSessionConfiguration!) {
        super.init(baseURL: url, sessionConfiguration: nil)
    }
    
    override init(baseURL url: NSURL!) {
        super.init(baseURL: url)
        let requestSerializer = MyClientRequestSerializer()
        self.requestSerializer = requestSerializer
        // If you need a responseSerializer, you can write it
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func yourAPI(){
        self.GET("users/kouki-dan/repos",
            parameters: ["none":"none"],
            success: { (task, response) in
                println(response)
            },
            failure: { (error) in
                println("error")
        })
        
    }
    func yourAPI2(id:NSString){
        //...
    }
    //.......
    
    func fetchGithubReposFromUser(userId:String, success:(dataTask:NSURLSessionDataTask!, response:AnyObject!)->()){
        self.GET("users/kouki-dan/repos",
            parameters: ["none":"none"],
            success: success,
            failure: { (error) in
                println("error")
        })
    }
}
