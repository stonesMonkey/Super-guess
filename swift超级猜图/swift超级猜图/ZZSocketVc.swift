//
//  ZZSocketVc.swift
//  swift超级猜图
//
//  Created by WZZ on 16/7/28.
//  Copyright © 2016年 WZZ. All rights reserved.
//

import UIKit

class ZZSocketVc: ZZBaseVc {

    
    @IBOutlet weak var textFiled: UITextField!
    
    @IBOutlet weak var sendBtn: UIButton!
    
    @IBOutlet weak var revcLabel: UILabel!
    
    
    /**
        1. 协议域
        2. socket类型.SOCK_STREAM(TCP)/SOCK_DGRAM(UDP报文)
        3. IPPROTO，协议，如果输入0，可以genuine第二个参数自动选择协议
        
        返回值：
        如果返回值大于0就表示创建成功 ，否则创建失败
     */
    var clientSocket = socket(AF_INET, SOCK_STREAM, 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func creatLink(sender: UIButton) {
        
        // 简历连接
        let result = Utils.cennectWithClientSocket(clientSocket, ip: "127.0.0.1")
        if result == 0 {
            
            print("连接成功")
        } else {
            
            print("连接失败")
        }
    }

    @IBAction func sendBtnClick(sender: UIButton) { // 发送数据
        
         let sendStr = self.textFiled.text
        
        /**
        1、客户端socket
        2、发送内容
        3、发送内容长度、是指字节的长度
        4、发送标志位一般为0
        
        返回值：
        如果成功，则返回发送的字节数，失败则返回SOCKET_ERROR
        */
       let recStr = Utils.recvWithClientSocket(clientSocket,sendStr: sendStr)
        
        revcLabel.text = recStr
        // 在终端输入: nc -lk 12345 相当于在本机上启动一个服务器，ip是本机地址，端口号是12345
    }
  
    

}
