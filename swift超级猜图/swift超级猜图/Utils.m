//
//  Utils.m
//  swift超级猜图
//
//  Created by WZZ on 16/7/13.
//  Copyright © 2016年 WZZ. All rights reserved.
//

#import "Utils.h"
#import <sys/socket.h>
// 网络开发
#import <arpa/inet.h>

#import <netinet/in.h>

@implementation Utils

+ (NSStringDrawingOptions)combine {
    return NSStringDrawingTruncatesLastVisibleLine |
    NSStringDrawingUsesLineFragmentOrigin |
    NSStringDrawingUsesFontLeading;
}

+ (NSIndexPath *)indexPathFor:(NSInteger)row inSection: (NSInteger)section {
    
    return [NSIndexPath indexPathForRow:row inSection:section];
}

+ (void)GCDWithTimer:(CGFloat)timer Block:(void(^)())blcok {
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(timer * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        blcok();
    });
}

+ (NSKeyValueObservingOptions)newAndOldOptions {
    
    return NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
}

// 简历连接
+ (int)cennectWithClientSocket:(int)clientSocket ip:(NSString *)ip {
    
    // 建立连接
    /**
     参数>
     1)客户端socket
     2)指向数据结构sockaddr的指针，其中包括目的端口和IP地址，即服务器的结构体地址
     3）结构体数据长度
     返回值
     0 成功/其他 错误代号 ，非0即真
     */
    struct sockaddr_in serverAddress;
    // 设置 IP --> 通过ip找主机  127.0.0.1机器都有一个这个地址,如果ping不通这个地址说明网卡不工作
    // 如果本机ip地址ping不通，说明网线坏了
    // ip 138可以查到域名
    // ip地址也会字节翻转（高地位呼唤）
    serverAddress.sin_addr.s_addr = inet_addr("127.0.0.1");
    // 设置端口号
    // 有效端口号： 0~65535 其中0~1024由系统使用或者保留，开发中不要使用1024以下的端口。通过ip地址找主机，通过端口号找服务。通过协议确定传输协议请求数据
    // UDP，就像地下党发电脑
    // TCP: 三次握手
    // htones 会对传入的整数进行字节翻转
    serverAddress.sin_port = htons(12345);
    // 设置协议 --> 通过协议确定如何传输数据
    // 端口号会翻转
    // 不同的CPU有不同的字节顺序，这些字节顺序类型指的是整数在内存中保存的顺序，即主机字节顺序，常见的有两种，所以要将主机字节顺序转变为网络字节顺序，就是整数在地址空间的存储方式变为：高位字节顺序存在在内存的低地址处
    serverAddress.sin_family = AF_INET;
    
    // C语言传参数，需要传结构体的地址，一般都需要传结构体的长度进去
    /**
     参数>
     1)客户端socket 2
     2)指向数据结构sockaddr的指针，其中包括目的端口和IP地址，即服务器的结构体地址
     3）结构体数据长度
     返回值
     0 成功/其他 错误代号 ，非0即真
     */
    int result = connect(clientSocket, (const struct sockaddr *)&serverAddress, sizeof(serverAddress));
    
    return result;
}

+ (NSString *)recvWithClientSocket:(int)clientSocket sendStr:(NSString *)str {
    
    
    // 发送
    /**
     1、客户端socket
     2、发送内容地址 void * = id
     3、发送内容长度、是指字节的长度
     4、发送标志位一般为0
     
     返回值：
     如果成功，则返回发送的字节数，失败则返回SOCKET_ERROR
     */
    long sendLength = send(clientSocket, str.UTF8String, strlen(str.UTF8String), 0);
    
    NSLog(@"发送了 %ld长度字节",sendLength);
    /**
     1、客户端socket
     2、接受内容socket
     3、接受内容的长度,告诉服务器一次只能接受多少字节
     4、接受标志位，一般是0
     */
    unsigned char buffer[1024];
    ssize_t recvLength = recv(clientSocket, buffer, sizeof(buffer), 0);
    NSLog(@"接收了%ld长度的字节",recvLength);
    // 将buffer转换成二进制数据
    NSData *dataBuffer = [NSData dataWithBytes:buffer length:recvLength];
    //
    NSString *strBuffer = [[NSString alloc] initWithData:dataBuffer encoding:NSUTF8StringEncoding];
    
    return strBuffer;
}

@end
