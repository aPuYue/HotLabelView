//
//  ViewController.swift
//  热门标签自动换行Swift版本
//
//  Created by 彭盛凇 on 2016/11/3.
//  Copyright © 2016年 huangbaoche. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var dataList: Array<String> = {
        
        let arr = ["医德高尚","非常耐心","回复123131231213非常及时、满意","意见很有帮助","非常认真敬业","非常清楚","回复非常及时、满意","由衷的感谢您老师","非","医德高尚","非常耐心","回、满意","意见很有帮助","非常认真敬业","非常清楚","回复非常及时、满意","由衷的感谢您老师","非常专业","医德高尚","非常耐心","回复123131231213非常及时、满意","意见很有帮助","非常认真敬业","非常清楚","回复非常及时、满意","由衷的感谢您老师","非常专业","医德高尚","非常耐心","回复123131231213非常及时、满意","意见很有帮助","非常认真敬业","非常清楚","回复非常及时、满意","由衷的感谢您老师","非常专业","医德高尚","非常耐心","回复123131231213非常及时、满意","意见很有帮助","非常认真敬业","非常清楚","回复非常及时、满意","由衷的感谢您老师","非常专业","医德高尚","非常耐心","回复123131231213非常及时、满意","意见很有帮助","非常认真敬业","非常清楚","回复非常及时、满意","由衷的感谢您老师","非常专业","医德高尚","非","回复123131231213非常及时、满意","意见很有帮助","非常认真敬业","非常清楚","回复非常及时、满意","由衷的感谢您老师","非常专业","医德高尚","非常耐心","回复123131231213非常及时、满意","意见很有帮助","非常认真敬业","非常清楚","回复非常及时、满意","由衷的感谢您老师","非常专业","德医双好"];
        
        return arr
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        automaticallyAdjustsScrollViewInsets = false
        
        let view1 = HotLabelView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 64))
        
        view1.creatHotLabelView(delegate: self, dataList: dataList, tagBackColor: UIColor.cyan, tagTitleColor: UIColor.black)
        
        view1.backgroundColor = UIColor.orange
        
        view.addSubview(view1)
        
    }
    
}

extension ViewController: HotLabelViewDelegate {
    
    func clickBtnEvent(btnTag: NSInteger) {
        print(btnTag)
    }
    
}
