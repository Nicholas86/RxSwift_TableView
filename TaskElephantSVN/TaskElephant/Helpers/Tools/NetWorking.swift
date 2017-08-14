//
//  NetWorking.swift
//  SportsProduct
//
//  Created by apple on 16/10/10.
//  Copyright © 2016年 xiangguohe. All rights reserved.
//

import UIKit
/// 成功回调
typealias SuccessNetWorkingBlock = ([String : AnyObject]) ->Void
/// 失败回调
typealias FailueNetWorkingBlock = (NSError) ->Void

class NetWorking: NSObject {

    /**
     创建XGHHTTPNetworkingTool单例对象
     - author: tangweijie
     - date: 16-10-10 11:10:05
     
     - parameter type:                   GET,POST
     - parameter urlString:              网址接口
     - parameter parameters:             参数
     - parameter successNetWorkingBlock: 成功回调
     - parameter failueNetWorkingBlock:  失败回调
     */
  
    class func netWorking(_ type : RequestType,urlString : String,parameters : [String : AnyObject],successNetWorkingBlock : @escaping SuccessNetWorkingBlock,failueNetWorkingBlock : @escaping FailueNetWorkingBlock) -> URLSessionTask {
        //初始化单例对象
        let xghHTTPNetworkingTool = XGHHTTPNetworkingTool.shareXGHHTTPNetworkingTool
       
        if type == .requestTypeGET { //GET
            let dataTask : URLSessionTask = xghHTTPNetworkingTool.request(type, UrlString: urlString, Parameter: parameters, successBlock: { (resultObject) in
                //成功将数据发送出去
                successNetWorkingBlock(resultObject )
            }) { (error) in
                //失败发送出去
                failueNetWorkingBlock(error)
            }
            return dataTask
        }else if type == .requestTypePOST {//POST
            let dataTask : URLSessionTask = xghHTTPNetworkingTool.request(type, UrlString: urlString, Parameter: parameters, successBlock: { (resultObject) in
                        //成功将数据发送出去
                        successNetWorkingBlock(resultObject )
            }) { (error) in
                        //失败发送出去
                        failueNetWorkingBlock(error)
                    }
            return dataTask
        }else { //DELEGATE
            let dataTask : URLSessionTask = xghHTTPNetworkingTool.request(type, UrlString: urlString, Parameter: parameters, successBlock: { (resultObject) in
                //成功将数据发送出去
               // successNetWorkingBlock(resultObject)
            }) { (error) in
                //失败发送出去
                //failueNetWorkingBlock(error)
            }
            return dataTask
        }
        
    }
    
}


