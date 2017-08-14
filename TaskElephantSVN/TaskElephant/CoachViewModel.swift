//
//  CoachViewModel.swift
//  SportsProduct
//
//  Created by apple on 17/1/17.
//  Copyright © 2017年 xiangguohe. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class CoachViewModel: NSObject {

    var isMJRefresh : Bool = true  //刷新
    

    func request(_ type : RequestType,urlstring : String,paramete : [String : AnyObject]) -> Observable <[SectionModel<String,CoachModel>]> {

        return Observable.create({ (observe) -> Disposable in
            
            let dataTask : URLSessionDataTask = NetWorking.netWorking(type, urlString: urlstring, parameters: paramete, successNetWorkingBlock: { (resultObject) in
                
                var dataSource = [CoachModel]()
                //printLog(message: "搜索教练数据 --- \(resultObject)")
                    dataSource.removeAll()
                if resultObject["resultFlg"]!.isEqual(to: "1"){
                    let resultArray : Array = resultObject["resultData"] as! [AnyObject]
                    
                    for dataDic in resultArray{
                        let model = CoachModel.init(resultDic: dataDic as! [String : AnyObject])
                        dataSource.append(model)
                    }
                    
                }
                
                let section = SectionModel(model: "", items: dataSource)
                observe.onNext([section])
                observe.onCompleted()
                
            }, failueNetWorkingBlock: { (error) in
                
                printLog(message: error)
                
            }) as! URLSessionDataTask
            
            return Disposables.create(with: {
                dataTask.cancel()
            })//释放资源
            
        })
    }

    
}











