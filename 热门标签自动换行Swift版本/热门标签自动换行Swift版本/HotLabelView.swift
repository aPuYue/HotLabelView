//
//  HotLabelView.swift
//  热门标签自动换行Swift版本
//
//  Created by 彭盛凇 on 2016/11/3.
//  Copyright © 2016年 huangbaoche. All rights reserved.
//

import UIKit


protocol HotLabelViewDelegate {
    func clickBtnEvent(btnTag: NSInteger)
}

class HotLabelView: UIView {
    
    var hotDelegate:    HotLabelViewDelegate?
    
    let kMargin:        CGFloat         = 10    //上下左右边距
    
    var totalWidth:     CGFloat         = 0     //总宽度（用来判断是否需要折行）,默认为边距10
    
    var realWidth:      CGFloat         = 0     //真实宽度，记录的宽度
    
    var numberOfRow:    CGFloat         = 0     //当前行数，默认为0，即第一行
    
    var count:          CGFloat         = 0     //同行的btn的数量，默认为0，即第一个

    var btnTag:         NSInteger       = 0     //btn的tag，用来建立对应的点击事件

    func creatHotLabelView(delegate: HotLabelViewDelegate,dataList: Array<String>, tagBackColor: UIColor, tagTitleColor: UIColor) {
        
        hotDelegate = delegate
        
        for string in dataList {
            
            let btn = UIButton(type: .custom)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 3
            btn.backgroundColor = tagBackColor
            btn.setTitleColor(tagTitleColor, for: .normal)
            btn.setTitle(string, for: .normal)
            btn.tag = btnTag
            btn.addTarget(self, action: #selector(clickBtnAction(btn:)), for: .touchUpInside)
            btnTag += 1
            addSubview(btn)
            
            let stringSize = NSString(string: string).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 15), options: NSStringDrawingOptions.truncatesLastVisibleLine, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)], context: nil).size
            
            //将字符串长度给总宽度，并且需要加 右 kMargin
            totalWidth += stringSize.width + kMargin
            
            if kMargin + (numberOfRow * (20 + kMargin)) + 20 > frame.size.height {  //超出范围高度
                
                print("“\(string)”此字符已超出范围高度，被忽略")
                
                continue
                
            }
            
            //判断是否需要折行，条件为totalWidth是否大于屏幕宽度(加左边距)
            if totalWidth + kMargin > frame.size.width {//当总宽度大于屏幕宽度时
                
                totalWidth = stringSize.width
                
                realWidth = stringSize.width
                
                numberOfRow += 1//增加当前行数，以便加高度和Kmargin
                
                count = 1   //默认为0，重置为1，eg：第二行，折行之后，则为第二行第二个，则需要加kMargin来实现统一边距
                
                btn.frame = CGRect(x: kMargin , y: kMargin + (numberOfRow * (20 + kMargin)), width: stringSize.width, height: 20)
                
            }else {//当总宽度不大于屏幕宽度时
                
                btn.frame = CGRect(x: realWidth + kMargin + count * kMargin, y: kMargin + (numberOfRow * (20 + kMargin)), width: stringSize.width, height: 20)
                
                realWidth += stringSize.width
                
                count += 1 //当没有换行时，记录同行btn的个数，以便加kMargin
                
            }
            
        }
    }
    
    func clickBtnAction(btn: UIButton) {

        if hotDelegate != nil {
            hotDelegate?.clickBtnEvent(btnTag: btn.tag)
        }
    }
    
}
