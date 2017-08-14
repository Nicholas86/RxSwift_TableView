//
//  UIViewMacros.swift
//  SportsProduct
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 xiangguohe. All rights reserved.
//

import UIKit
//简化UIView相对布局(x,y,width,height)
func x(_ view : UIView) -> CGFloat {
    return view.frame.origin.x
}
func y(_ view : UIView) -> CGFloat {
    return view.frame.origin.y
}
func width(_ view : UIView) -> CGFloat {
    return view.frame.size.width
}
func height(_ view : UIView) -> CGFloat {
    return view.frame.size.height
}
