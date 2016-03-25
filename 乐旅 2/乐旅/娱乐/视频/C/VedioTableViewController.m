//
//  VedioTableViewController.m
//  乐旅
//
//  Created by 姜鸥人 on 16/3/14.
//  Copyright © 2016年 姜鸥人. All rights reserved.
//

#import "VedioTableViewController.h"
#import "VedioTableViewCell.h"
#import "DateRequest.h"
#import "shared.h"
#import "ModelTitle.h"
#import "RecreationViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface VedioTableViewController ()<DateRequestDelegate>
//请求网络存储数据
@property (nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSNotificationCenter *notificationCenter;
@property (nonatomic,strong)shared *shar1;
@property (nonatomic,strong)NSArray *addarray;
@property (nonatomic,strong) MPMoviePlayerController *moviePlayer;
/** 加载动画*/
@property(nonatomic,strong) UIActivityIndicatorView *loadingAni;
@end

@implementation VedioTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shar1= [shared shared];
    self.shar1.a=1;
    self.shar1.b=10;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    
    
    
    self.loadingAni=[[UIActivityIndicatorView alloc]init];
    self.loadingAni.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    
    
    
}


//实现代理方法
- (void)reloadViewWithData
{
    if (self.shar1.a==1) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
            self.shar1.a=11;
            self.shar1.b=20;
        });
    }
    
    
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            for (int i=1; i<self.addarray.count; i++) {
                
                ModelTitle *title=[[ModelTitle alloc]init];
                title=self.addarray[i];
                [self.array addObject:title];
            }
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
        });
    }
    
}

- (void)loadNewData{
    DateRequest *dateRequest=[DateRequest shareDateRequest];
    
    dateRequest.delegate=self;
    self.shar1.a=1;
    self.array=[dateRequest requestWithDateUrl:kFrameRequestUrl];
    
    
}

-(void)loadMoreData{
    DateRequest *dateRequest=[DateRequest shareDateRequest];
    dateRequest.delegate=self;
    self.addarray=[dateRequest requestWithDateUrl:[NSString stringWithFormat:@"http://c.3g.163.com/nc/video/home/%d-%d.html",self.shar1.a,self.shar1.b]];
    self.shar1.a=self.shar1.a+10;
    self.shar1.b=self.shar1.b+10;
    NSLog(@"%d",self.shar1.a);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell_id1=@"cell_id1";
    VedioTableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:cell_id1];
    if (!cell1) {
        cell1=[[VedioTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id1];
    }
    ModelTitle *model=self.array[indexPath.row];
    cell1.bigLabel.text=model.title;
    cell1.littleLabel.text=model.Description;
    NSInteger length=[model.length integerValue];
    cell1.timeLabel.text=[NSString stringWithFormat:@"%02d:%02ld",(int)length/60,length%60];
    cell1.numberLabel.text=[NSString stringWithFormat:@"%@",model.playCount];
    
    [cell1.VedioView sd_setImageWithURL:[NSURL URLWithString:model.cover]];
    
    cell1.bt.tag=indexPath.row+100;
    [cell1.bt addTarget:self action:@selector(btAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell1;
}


-(void)btAction:(UIButton *)sender{
    
    if (self.moviePlayer.playbackState==MPMoviePlaybackStatePlaying||self.moviePlayer.playbackState==MPMoviePlaybackStatePaused)
    {                    [self.moviePlayer.view removeFromSuperview];
        [self setMoviePlayer:nil];
        
    }
    ModelTitle *model=self.array[sender.tag-100];
    NSString *urlStr= model.mp4_url;
    NSString* UrlStr=[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:UrlStr];
    if (!_moviePlayer) {
        _moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:url];
        _moviePlayer.view.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    }
    self.moviePlayer.view.frame=CGRectMake(10, (93+(self.view.frame.size.width-20)*0.5625) *(sender.tag-100)+58, self.view.frame.size.width-20, (self.view.frame.size.width-20)*0.5625);
    self.loadingAni.frame=CGRectMake(self.moviePlayer.view.bounds.size.width/2-18.5,self.moviePlayer.view.bounds.size.height/2-18.5, 37, 37);
    [self.tableView addSubview:self.moviePlayer.view];
    [self.moviePlayer.view addSubview:self.loadingAni];
    [self addNotification];
    [self.loadingAni startAnimating];
    [self.tableView reloadData];
    
    
    
}
-(void)addNotification{
    
    self.notificationCenter=[NSNotificationCenter defaultCenter];
    
    
    [self.notificationCenter addObserver:self selector:@selector(mediaPlayerPlaybackStateChange:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:self.moviePlayer];
    
    if ([self.moviePlayer respondsToSelector:@selector(loadState)])
    {
        [self.moviePlayer prepareToPlay];
    }
    else
    {
        [self.moviePlayer play];
    }
}



-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.moviePlayer.playbackState==MPMoviePlaybackStatePlaying||self.moviePlayer.playbackState==MPMoviePlaybackStatePaused)
    {
        [self.loadingAni stopAnimating];
        [self.moviePlayer.view removeFromSuperview];
        [self setMoviePlayer:nil];
        
    }
    
}


-(void)mediaPlayerPlaybackStateChange:(NSNotification *)notification{
    [self.loadingAni stopAnimating];
    if ([self.moviePlayer loadState]!=MPMovieLoadStateUnknown)
    {
        
        switch (self.moviePlayer.playbackState) {
            case MPMoviePlaybackStatePlaying:
                
                //  NSLog(@"正在播放...");
                break;
            case MPMoviePlaybackStatePaused:
                // NSLog(@"暂停播放.");
                break;
            case MPMoviePlaybackStateStopped:
                // NSLog(@"停止播放.");
                break;
            default:
                // NSLog(@"播放状态:%li",self.moviePlayer.playbackState);
                break;
        }
    }
}

//切换界面时退出视频
- (void)viewWillDisappear:(BOOL)animated
{
    
//    [self.loadingAni stopAnimating];
//    if (self.moviePlayer.playbackState==MPMoviePlaybackStatePlaying||self.moviePlayer.playbackState==MPMoviePlaybackStatePaused)
//    {
//        
//        [self.moviePlayer.view removeFromSuperview];
//        self.moviePlayer=nil;
//        
//    }
    
    
    
    
}



/**
 *  支持横竖屏显示
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}


//设置tabviewcell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return (93+(self.view.frame.size.width-20)*0.5625);
    
}


@end
