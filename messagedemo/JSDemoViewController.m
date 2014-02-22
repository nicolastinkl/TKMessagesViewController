//
//  Created by Jesse Squires
//  http://www.hexedbits.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSMessagesViewController
//
//
//  The MIT License
//  Copyright (c) 2013 Jesse Squires
//  http://opensource.org/licenses/MIT
//

#import "JSDemoViewController.h"
#import "FCMessage.h"

#define kSubtitleJobs @"Jobs"
#define kSubtitleWoz @"Steve Wozniak"
#define kSubtitleCook @"Mr. Cook"

@implementation JSDemoViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.delegate = self;
    self.dataSource = self;
    [super viewDidLoad]; 
    
    [[JSBubbleView appearance] setFont:[UIFont systemFontOfSize:16.0f]];
    
    self.title = @"消息";
    self.messageInputView.textView.placeHolder = @"";
    self.sender = @"Jobs";
    
    [self setBackgroundColor:[UIColor whiteColor]];
    
    NSMutableArray * array = [[NSMutableArray alloc] init];
    self.messages = array;
    {
        FCMessage * mesOne = [[FCMessage alloc] init];
        [mesOne setMessageguid:@"6788"];
        [mesOne setMessageId:@"1"];
        [mesOne setMessageSendStatus:@0];
        [mesOne setMessageStatus:@YES];
        [mesOne setMessageType:@(messageType_text)];
        [mesOne setText:@"当初百度收购91的时候说过一句话，战略布局是不能用价钱去衡量的。 190亿美元，贵（小米当初若知道IM如此值钱……脑补ING……）！但却拥有了一个广阔的未来，若不搏，活不过明天，贵与不贵也就都与之无"];
        [mesOne setSentDate:[NSDate distantPast]];
        [mesOne setSender:kSubtitleWoz];
        [mesOne setRead:@NO];
        [self.messages addObject:mesOne];
    }
    {
        FCMessage * mesOne = [[FCMessage alloc] init];
        [mesOne setMessageguid:@""];
        [mesOne setMessageId:@"2"];
        [mesOne setMessageSendStatus:@0];
        [mesOne setMessageStatus:@YES];
        [mesOne setMessageType:@(messageType_text)];
        [mesOne setText:@"2.64个诺基亚。  到了公司，各类相关分析评论铺天盖地。整理了一下，大致是弥补移动社交短板，符合国际化战略，有过成功收购移动应用的经历等等。正好中午和一个做大数据的朋友聊天吃饭，也聊到了这个话题，下午团队会议上，老大也给我们做了一个关于他自己对此次收购的判断，我就二次打磨打磨，在此分享给大家： \n  1、收购是为了获得用户的移动通讯数据  即时通信一直是Facebook的短板，前阶段收购Snapchat失败，就足以证明Facebook在获取移动通讯用户数据上表现的非常焦虑；而自身的Facebook Message一直没有令人惊叹的表现。其实我们可以把Facebook理解成为微信的朋友圈，用户在facebook上发布照片、文字状态、给好友点赞等等，这些数据的流动性和实时性都不如即时通信数据。因此，Facebook急需要一个能够和微信一样的产品，使得原有的数据和通信数据相互流动和打通，这样才能进一步的构建属于自己的移动生态圈，包括现在已经在微信、Line以及KakaoTalk 上已经证明了的游戏、增值服务以及O2O。2012年Facebook收购的Instagram并没有很好的补充Facebook在移动通信世界的数据，因为Instagram的架构和Facebook的架构并没有太大的差别，都属于社交分享网络。 从大数据的价值角度上来说，第一，数据的数量决定了大数据的商业价值的基数是高还是低;第二，数据的维度其实也是非常重要的，阿里巴巴有着大量的用户电商数据，但是它没有社交数据，这也是为什么阿里巴巴一直对社交网络念念不忘，在移动时代力推来往。而同样的道理也在腾讯的身上上演。无论是"];
        [mesOne setSentDate:[NSDate distantPast]];
        [mesOne setSender:kSubtitleWoz];
        [mesOne setRead:@NO];
        [self.messages addObject:mesOne];
    }
    
    {
        FCMessage * mesOne = [[FCMessage alloc] init];
        [mesOne setMessageguid:@""];
        [mesOne setMessageId:@"3"];
        [mesOne setMessageSendStatus:@0];
        [mesOne setMessageStatus:@YES];
        [mesOne setMessageType:@(messageType_image)];
        [mesOne setImageUrl:@"http://e.hiphotos.baidu.com/image/w%3D2048/sign=6ce2e309eb24b899de3c7e385a3e1c95/730e0cf3d7ca7bcb4e9c0e26bc096b63f724a8d0.jpg"];
        [mesOne setText:@""];
        [mesOne setSentDate:[NSDate date]];
        [mesOne setSender:kSubtitleWoz];
        [mesOne setRead:@NO];
        [self.messages addObject:mesOne];
    }
    
    
    /*self.messages = [[NSMutableArray alloc] initWithObjects:
                     [[JSMessage alloc] initWithText:@"JSMessagesViewController is simple and easy to use." sender:@"" date:[NSDate distantPast]],
                     [[JSMessage alloc] initWithText:@"It's highly customizable." sender:@"" date:[NSDate distantPast]],
                     [[JSMessage alloc] initWithText:@"It even has data detectors. You can call me tonight. My cell number is 452-123-4567. \n My website is www.hexedbits.com." sender:@"" date:[NSDate distantPast]],
                     [[JSMessage alloc] initWithText:@"当初百度收购91的时候说过一句话，战略布局是不能用价钱去衡量的。 190亿美元，贵（小米当初若知道IM如此值钱……脑补ING……）！但却拥有了一个广阔的未来，若不搏，活不过明天，贵与不贵也就都与之无关...!asdfas" sender:kSubtitleCook date:[NSDate distantPast]],
                     [[JSMessage alloc] initWithText:@"本来是打算睡个自然醒，但还不到8点，就接连不断地被手机上各大媒体APP推送的消息闹醒，打开一看，WhatsApp居然被Facebook190亿美元收购了，这是什么概念， 这相当于是收购了19个Instagram，5.9个Nest， 32.8个MySpaces，11.5个 YouTube，2.64个诺基亚。  到了公司，各类相关分析评论铺天盖地。整理了一下，大致是弥补移动社交短板，符合国际化战略，有过成功收购移动应用的经历等等。正好中午和一个做大数据的朋友聊天吃饭，也聊到了这个话题，下午团队会议上，老大也给我们做了一个关于他自己对此次收购的判断，我就二次打磨打磨，在此分享给大家： \n  1、收购是为了获得用户的移动通讯数据  即时通信一直是Facebook的短板，前阶段收购Snapchat失败，就足以证明Facebook在获取移动通讯用户数据上表现的非常焦虑；而自身的Facebook Message一直没有令人惊叹的表现。其实我们可以把Facebook理解成为微信的朋友圈，用户在facebook上发布照片、文字状态、给好友点赞等等，这些数据的流动性和实时性都不如即时通信数据。因此，Facebook急需要一个能够和微信一样的产品，使得原有的数据和通信数据相互流动和打通，这样才能进一步的构建属于自己的移动生态圈，包括现在已经在微信、Line以及KakaoTalk 上已经证明了的游戏、增值服务以及O2O。2012年Facebook收购的Instagram并没有很好的补充Facebook在移动通信世界的数据，因为Instagram的架构和Facebook的架构并没有太大的差别，都属于社交分享网络。 从大数据的价值角度上来说，第一，数据的数量决定了大数据的商业价值的基数是高还是低;第二，数据的维度其实也是非常重要的，阿里巴巴有着大量的用户电商数据，但是它没有社交数据，这也是为什么阿里巴巴一直对社交网络念念不忘，在移动时代力推来往。而同样的道理也在腾讯的身上上演。无论是国内的阿里和腾讯，还是国外的谷歌和Facebook，都希望构建一个全方位、多维度的用户数据，如果哪一天Facebook强大到收购eBay或者Amazon，也是不足为奇的。  \n2、收购是为了增加与用户接触的时间  早在2012年，就有一位名叫肯·塞纳的华尔街分析师就指出facebook面临大量年轻人流失的风险和趋势，据美国市场研究公司comScore2012年发布的数据显示，8月份用户花费在Facebook网站的时间同比下滑12%。造成这种下滑的主要原因在于，12岁到17岁之间的用户和18岁到24岁之间的用户使用量下滑，这两个用户人群使用量分别比前一年同期下滑42%和25%。2013年Facebook发布第三季度财报的电话会议上，CFO伊博斯曼亲自确认这一事实： \n“环比来看，美国青少年的Facebook使用量整体呈现稳定，但我们发现日用户量出现了下降，特别是年龄较小的青少年。!" sender:kSubtitleJobs date:[NSDate date]],
                     [[JSMessage alloc] initWithText:@"对即时聊天应用行业的影响 今天在公司内部，也发起了一项关于190亿美元收购WhatsApp将会对全球即时聊天应用行业影响的讨论。从上面那张图，你会看到在拉丁美洲和部分欧洲国家，WhatsApp占据绝对尖峰的份额，微信在中国，Line在日本，KakaoTalk在韩国同样表现了一个尖峰结构。\n 因此，我的观点是，只要现有这几大聊天应用，微信、whatsapp、line以及KakaoTalk不犯错误，市场格局已经基本定了。因为关系链产品几乎是很难相互渗透，唯有的突破就是迅速抢占尚未被开发的处女地或者说各方竞争优势还不是特别明显的国家或者地区。微信在哪里打，首先应该突破的就是东南亚，其次就是美国、加拿大、澳洲，第三就是中东和非洲。\n  欢迎与作者直接沟通并提问，Sam私人微信号是：309518196 size!" sender:kSubtitleWoz date:[NSDate date]],
                     nil];
    */
/*    self.avatars = [[NSDictionary alloc] initWithObjectsAndKeys:
                    [JSAvatarImageFactory avatarImageNamed:@"demo-avatar-jobs" croppedToCircle:YES], kSubtitleJobs,
                    [JSAvatarImageFactory avatarImageNamed:@"demo-avatar-woz" croppedToCircle:YES], kSubtitleWoz,
                    [JSAvatarImageFactory avatarImageNamed:@"demo-avatar-cook" croppedToCircle:YES], kSubtitleCook,
                    nil];*/
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                                           target:self
                                                                                           action:@selector(buttonPressed:)];
}

- (void)buttonPressed:(UIButton *)sender
{
    // Testing pushing/popping messages view
    JSDemoViewController *vc = [[JSDemoViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}

#pragma mark - Messages view delegate: REQUIRED

- (void)didSendText:(NSString *)text fromSender:(NSString *)sender onDate:(NSDate *)date
{
    if ((self.messages.count - 1) % 2) {
        [JSMessageSoundEffect playMessageSentSound];
    }
    else {
        // for demo purposes only, mimicing received messages
        [JSMessageSoundEffect playMessageReceivedSound];
        sender = arc4random_uniform(10) % 2 ? kSubtitleCook : kSubtitleWoz;
    }
    
//    [self.messages addObject:[[FCMessage alloc] initWithText:text sender:sender date:date]];
    
    [self finishSend];
    [self scrollToBottomAnimated:YES];
}

- (JSBubbleMessageType)messageTypeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JSBubbleMessageType  type;
    FCMessage* message = [self.dataSource messageForRowAtIndexPath:indexPath];
    if ([message.messageStatus boolValue])
        type = JSBubbleMessageTypeIncoming;
    else
        type = JSBubbleMessageTypeOutgoing;
    
    return type;
}

- (UIImageView *)bubbleImageViewWithType:(JSBubbleMessageType)type
                       forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(type != JSBubbleMessageTypeOutgoing){
        return [JSBubbleImageViewFactory bubbleImageViewForType:type
                                                          color:[UIColor js_bubbleLightGrayColor]];
    }
    return [JSBubbleImageViewFactory bubbleImageViewForType:type
                                                      color:[UIColor js_bubbleBlueColor]];
}

- (JSMessageInputViewStyle)inputViewStyle
{
    return JSMessageInputViewStyleFlat;
}

#pragma mark - Messages view delegate: OPTIONAL

- (BOOL)shouldDisplayTimestampForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;

    if (indexPath.row % 3 == 0) {
        return YES;
    }
    return NO;
}

//
//  *** Implement to customize cell further
//
- (void)configureCell:(JSBubbleMessageCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if ([cell messageType] == JSBubbleMessageTypeOutgoing) {
        cell.bubbleView.textView.textColor = [UIColor whiteColor];
    
        if ([cell.bubbleView.textView respondsToSelector:@selector(linkTextAttributes)]) {
            NSMutableDictionary *attrs = [cell.bubbleView.textView.linkTextAttributes mutableCopy];
            [attrs setValue:[UIColor blueColor] forKey:UITextAttributeTextColor];            
            cell.bubbleView.textView.linkTextAttributes = attrs;
        }
    }
    
    if (cell.timestampLabel) {
        cell.timestampLabel.textColor = [UIColor lightGrayColor];
        cell.timestampLabel.shadowOffset = CGSizeZero;
    }
    
    if (cell.subtitleLabel) {
        cell.subtitleLabel.textColor = [UIColor lightGrayColor];
    }
}

//  *** Implement to use a custom send button
//
//  The button's frame is set automatically for you
//
//  - (UIButton *)sendButtonForInputView
//

//  *** Implement to prevent auto-scrolling when message is added
//
- (BOOL)shouldPreventScrollToBottomWhileUserScrolling
{
    return YES;
}

// *** Implemnt to enable/disable pan/tap todismiss keyboard
//
- (BOOL)allowsPanToDismissKeyboard
{
    return NO;
}

#pragma mark - Messages view data source: REQUIRED

- (FCMessage *)messageForRowAtIndexPath:(NSIndexPath *)indexPath
{

    FCMessage * message = [self.messages objectAtIndex:indexPath.row];
    return message;
}

- (UIImageView *)avatarImageViewForRowAtIndexPath:(NSIndexPath *)indexPath sender:(NSString *)sender
{
    return nil;
//    UIImage *image = [self.avatars objectForKey:sender];
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"demo-avatar-woz"]];
}

@end
