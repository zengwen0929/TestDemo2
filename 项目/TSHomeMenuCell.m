//
//  TSHomeMenuCell.m
//  项目
//
//  Created by 唐硕 on 16/2/26.
//  Copyright © 2016年 唐硕. All rights reserved.
//
#define TAG 1000

#import "TSHomeMenuCell.h"
#import "TSMenuBtnView.h"

@interface TSHomeMenuCell()<UIScrollViewDelegate>
{
    UIView *_backView1;
    UIView *_backView2;
    UIPageControl *_pageControl;
}

@end

@implementation TSHomeMenuCell

+(instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSMutableArray *)menuArray {
    static NSString *cellID = @"tangshuoqweqwqeqeqe";
    TSHomeMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil) {
        cell = [[TSHomeMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID menuArray:menuArray];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuArray:(NSArray *)menuArray{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        _backView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 160)];
        _backView2 = [[UIView alloc]initWithFrame:CGRectMake(screen_width, 0, screen_width, 160)];
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 180)];
        //
        scrollView.contentSize = CGSizeMake(screen_width*2, 180);
        //
       // scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        //
      //  scrollView.showsHorizontalScrollIndicator = NO;
        [scrollView addSubview:_backView1];
        [scrollView addSubview:_backView2];
        [self addSubview:scrollView];
        
        //
        for(int i = 0; i < 16; i++) {
            if(i < 4) {
                
                CGRect frame = CGRectMake(i*screen_width/4, 0, screen_width/4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imagestr = [menuArray[i] objectForKey:@"image"];
                TSMenuBtnView *btnView = [[TSMenuBtnView alloc]initWithFrame:frame title:title imagestr:imagestr];
                btnView.tag = TAG + i;
                [_backView1 addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Clicktap:)];
                [btnView addGestureRecognizer:tap];
                
            } else if (i < 8) {
                
                CGRect frame = CGRectMake((i-4)*screen_width/4, 80, screen_width/4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imagestr = [menuArray[i] objectForKey:@"image"];
                TSMenuBtnView *btnView = [[TSMenuBtnView alloc]initWithFrame:frame title:title imagestr:imagestr];
                btnView.tag = TAG + i;
                [_backView1 addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Clicktap:)];
                [btnView addGestureRecognizer:tap];
                
            }else if (i < 12) {
                CGRect frame = CGRectMake((i-8)*screen_width/4, 0, screen_width/4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imagestr = [menuArray[i] objectForKey:@"image"];
                TSMenuBtnView *btnView = [[TSMenuBtnView alloc]initWithFrame:frame title:title imagestr:imagestr];
                btnView.tag = TAG + i;
                [_backView2 addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Clicktap:)];
                [btnView addGestureRecognizer:tap];
            } else {
                CGRect frame = CGRectMake((i-12)*screen_width/4, 80, screen_width/4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imagestr = [menuArray[i] objectForKey:@"image"];
                TSMenuBtnView *btnView = [[TSMenuBtnView alloc]initWithFrame:frame title:title imagestr:imagestr];
                btnView.tag = TAG + i;
                [_backView2 addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Clicktap:)];
                [btnView addGestureRecognizer:tap];
            }
        }
        
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(screen_width/2-10, 160, 0, 20)];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = 2;
        //        self.backgroundColor = [UIColor redColor];
        [self addSubview:_pageControl];
        [_pageControl setCurrentPageIndicatorTintColor:navigationBarColor];
        [_pageControl setPageIndicatorTintColor:[UIColor grayColor]];
        
    }
    return self;
}






#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2)/scrollViewW;
    _pageControl.currentPage = page;
}













-(void)Clicktap:(UITapGestureRecognizer *)sender{
     NSLog(@"tag:%ld",sender.view.tag);
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
