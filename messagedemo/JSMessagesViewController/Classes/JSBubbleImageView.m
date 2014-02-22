//
//  JSBubbleImageView.m
//  messagedemo
//
//  Created by apple on 2/21/14.
//  Copyright (c) 2014 jijia. All rights reserved.
//

#import "JSBubbleImageView.h"


#import "JSMessageInputView.h"
#import "JSAvatarImageFactory.h"
#import "NSString+JSMessagesView.h"

#define kMarginTop 8.0f
#define kMarginBottom 4.0f
#define kPaddingTop 4.0f
#define kPaddingBottom 8.0f
#define kBubblePaddingRight 35.0f


@interface JSBubbleImageView()

- (void)setup;

+ (CGFloat)neededHeightForImageview;

@end


@implementation JSBubbleImageView

#pragma mark - Setup

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame
                   bubbleType:(JSBubbleMessageType)bubleType
              bubbleImageView:(UIImageView *)bubbleImageView
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
        
        _type = bubleType;
        
        bubbleImageView.userInteractionEnabled = YES;
        [self addSubview:bubbleImageView];
        _bubbleImageView = bubbleImageView;
        
        UIButton *textView = [UIButton buttonWithType:UIButtonTypeCustom];
        textView.layer.cornerRadius = 10;
        textView.layer.masksToBounds = YES;
        textView.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:textView];
        _imageView = textView;
    }
    return self;
}


#pragma mark - Getters

- (CGRect)bubbleFrame
{
    CGSize bubbleSize = CGSizeMake(150, 150);
    
    return CGRectIntegral(CGRectMake((self.type == JSBubbleMessageTypeOutgoing ? self.frame.size.width - bubbleSize.width : 0.0f),
                                     kMarginTop,
                                     bubbleSize.width,
                                     bubbleSize.height + kMarginTop));
}

#pragma mark - Layout

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.bubbleImageView.frame = [self bubbleFrame];
    
    CGFloat textX = self.bubbleImageView.frame.origin.x;
    
    if (self.type == JSBubbleMessageTypeIncoming) {
        textX += (self.bubbleImageView.image.capInsets.left / 2.0f);
    }
    
    CGRect textFrame = CGRectMake(textX,
                                  self.bubbleImageView.frame.origin.y + 6,
                                  self.bubbleImageView.frame.size.width - (self.bubbleImageView.image.capInsets.right / 2.0f) -6,
                                  self.bubbleImageView.frame.size.height - kMarginTop-4);
    
    self.imageView.frame = CGRectIntegral(textFrame);
}


+ (CGFloat)neededHeightForImageview
{
    return 150 + kMarginTop + kMarginBottom;
}
- (void)dealloc
{
    _bubbleImageView = nil;
    _imageView = nil;
}


@end
