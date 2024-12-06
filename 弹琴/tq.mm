
//江湖QQ351326543
//仅供学习交流
//菜单 调用[tq tanqin];
//MainViewController.mm里配置信息

//重新获取坐标[tq windownnn];


#import "tq.h"
#import <UIKit/UIKit.h>
#import "PTFakeMetaTouch.h"
#import "MainViewController.h"
#import "MBProgressHUD.h"
@interface tq()<UIGestureRecognizerDelegate>
@end
UIWindow *window;
UIWindow *window1;

UIView *UIViewJianghu;
UISlider *slider;
UISlider *slider2;
UIButton * ButtonZanTing;
UILabel *paotujindu;
UILabel *jinrenjindu;

@implementation tq

static float BS = 1;
static int ZT = 1;
static int JD;
static int ii;
static int JS;
static CGFloat xxx1;
static CGFloat xxx2;
static CGFloat xxx3;
static CGFloat xxx4;
static CGFloat xxx5;
static CGFloat yyy1;
static CGFloat yyy2;
static CGFloat yyy3;

static float time1;
static float time2;
static float time3;
static float time4;
static NSString *puzi;
static NSArray *zuobiao;

static int zuobiaoz = 0;
static BOOL maden = NO;

static void c4(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx1,yyy1) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx1,yyy1) withTouchPhase:UITouchPhaseEnded];
}
static void d4(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx2,yyy1) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx2,yyy1) withTouchPhase:UITouchPhaseEnded];
}
static void e4(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx3,yyy1) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx3,yyy1) withTouchPhase:UITouchPhaseEnded];
}
static void f4(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx4,yyy1) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx4,yyy1) withTouchPhase:UITouchPhaseEnded];
}
static void g4(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx5,yyy1) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx5,yyy1) withTouchPhase:UITouchPhaseEnded];
}

static void a4(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx1,yyy2) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx1,yyy2) withTouchPhase:UITouchPhaseEnded];
}
static void b4(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx2,yyy2) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx2,yyy2) withTouchPhase:UITouchPhaseEnded];
}
static void c5(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx3,yyy2) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx3,yyy2) withTouchPhase:UITouchPhaseEnded];
}
static void d5(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx4,yyy2) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx4,yyy2) withTouchPhase:UITouchPhaseEnded];
}

static void e5(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx5,yyy2) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx5,yyy2) withTouchPhase:UITouchPhaseEnded];
}

static void f5(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx1,yyy3) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx1,yyy3) withTouchPhase:UITouchPhaseEnded];
}
static void g5(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx2,yyy3) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx2,yyy3) withTouchPhase:UITouchPhaseEnded];
}
static void a5(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx3,yyy3) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx3,yyy3) withTouchPhase:UITouchPhaseEnded];
}
static void b5(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx4,yyy3) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx4,yyy3) withTouchPhase:UITouchPhaseEnded];
}
static void c6(){
    NSInteger pointId = [PTFakeMetaTouch fakeTouchId:[PTFakeMetaTouch getAvailablePointId] AtPoint:CGPointMake(xxx5,yyy3) withTouchPhase:UITouchPhaseBegan];
    [PTFakeMetaTouch fakeTouchId:pointId AtPoint:CGPointMake(xxx5,yyy3) withTouchPhase:UITouchPhaseEnded];
}

+ (void)load{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(13* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UITapGestureRecognizer *theTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(gestureRecognizer:shouldReceiveTouch:)];
        theTapRecognizer.delegate = (id<UIGestureRecognizerDelegate>) self;
        [[UIApplication sharedApplication].keyWindow addGestureRecognizer: theTapRecognizer];
    });
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy11"] && [[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy22"])
    {
        NSArray *pd1 = [[[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy11"] componentsSeparatedByString:@"--"];
        NSArray *pd2 = [[[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy22"] componentsSeparatedByString:@"--"];
        CGFloat x1 = [pd1[0] floatValue];//10 100
        CGFloat y1 = [pd1[1] floatValue];//90 150
        CGFloat x2 = [pd2[0] floatValue];
        CGFloat y2 = [pd2[1] floatValue];
        
        float h1 = x2 - x1;
        float s1 = y2 - y1;
        float ppd1 = h1 / 5;
        float ppd2 = s1 / 3;
        float xxx = ppd1/2;
        float yyy = ppd2/2;
        
        yyy1 = y1;
        yyy2 = y1-yyy+ppd2*2;
        yyy3 = y1-yyy+ppd2*3;
        
        xxx1 = x1;
        xxx2 = x1-xxx+ppd1*2;
        xxx3 = x1-xxx+ppd1*3;
        xxx4 = x1-xxx+ppd1*4;
        xxx5 = x1-xxx+ppd1*5;
    }
}

+ (void)tanqin{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy11"] && [[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy22"])
    {
MainViewController *settingVc = [[MainViewController alloc] init] ;
UIViewController *tabbarVc = UIApplication.sharedApplication.keyWindow.rootViewController;
UINavigationController *hookNavi = [[UINavigationController alloc] initWithRootViewController:settingVc];
[tabbarVc presentViewController:hookNavi animated:YES completion:nil];
    }else{
        //未获取坐标
        UIAlertController *zcdz = [UIAlertController alertControllerWithTitle:@"提示" message:@"当前未获取坐标" preferredStyle:UIAlertControllerStyleAlert];
        
        [zcdz addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [tq windownnn];
        }]];
        
        [zcdz addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:zcdz animated:true completion:nil];
    }
}

+ (void)hideCenterVc{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy11"] && [[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy22"])
        {
            NSArray *pd1 = [[[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy11"] componentsSeparatedByString:@"--"];
            NSArray *pd2 = [[[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy22"] componentsSeparatedByString:@"--"];
            CGFloat x1 = [pd1[0] floatValue];
            CGFloat y1 = [pd1[1] floatValue];
            CGFloat x2 = [pd2[0] floatValue];
            CGFloat y2 = [pd2[1] floatValue];
            
            float h1 = x2 - x1;
            float s1 = y2 - y1;
            float ppd1 = h1 / 5;
            float ppd2 = s1 / 3;
            float xxx = ppd1/2;
            float yyy = ppd2/2;
            
            yyy1 = y1;
            yyy2 = y1-yyy+ppd2*2;
            yyy3 = y1-yyy+ppd2*3;
            
            xxx1 = x1;
            xxx2 = x1-xxx+ppd1*2;
            xxx3 = x1-xxx+ppd1*3;
            xxx4 = x1-xxx+ppd1*4;
            xxx5 = x1-xxx+ppd1*5;
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                for(int aa = 0;aa<6;aa++){
                    usleep(300000);
                    if(aa == 0){
                        c4();
                        a4();
                        f5();
                    }
                    if(aa == 1){
                        d4();
                        b4();
                        g5();
                    }
                    if(aa == 2){
                        e4();
                        c5();
                        a5();
                    }
                    if(aa == 3){
                        f4();
                        d5();
                        b5();
                    }
                    if(aa == 4){
                        g4();
                        e5();
                        c6();
                    }
                    
                    if(aa == 5){
                        dispatch_async(dispatch_get_main_queue(), ^{
                            UIAlertController *zcdz = [UIAlertController alertControllerWithTitle:@"提示" message:@"所有按键是否都依次被点击？" preferredStyle:UIAlertControllerStyleAlert];
                            
                            [zcdz addAction:[UIAlertAction actionWithTitle:@"没有 我要重新获取坐标" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                UIAlertController *zcdz11 = [UIAlertController alertControllerWithTitle:@"提示" message:@"请确保已经打开-弹琴-界面\n点击确定后\n请点击第一个键和最后一个键" preferredStyle:UIAlertControllerStyleAlert];
                                
                                [zcdz11 addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                    
                                    zuobiaoz = 0;
                                    maden = YES;
                                    
                                }]];
                                
                                [zcdz11 addAction:[UIAlertAction actionWithTitle:@"可以了！" style:UIAlertActionStyleDefault handler:nil]];
                                
                                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:zcdz11 animated:true completion:nil];
                                
                            }]];
                            
                            [zcdz addAction:[UIAlertAction actionWithTitle:@"是的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                
                                UIAlertController *zcdz11 = [UIAlertController alertControllerWithTitle:nil message:@"开始演奏吧！" preferredStyle:UIAlertControllerStyleAlert];
                                
                                [zcdz11 addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
                                
                                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:zcdz11 animated:true completion:nil];
                            }]];
                            
                            
                            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:zcdz animated:true completion:nil];
                        });
                    }
                    
                }
            });
        }
    });
    
}

+ (void)windownnn{
    UIAlertController *zcdz = [UIAlertController alertControllerWithTitle:@"提示" message:@"请确保已经打开-弹琴-界面\n点击确定后\n请点击第一个键和最后一个键" preferredStyle:UIAlertControllerStyleAlert];
    
    [zcdz addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        zuobiaoz = 0;
        maden = YES;
        
    }]];
    
    [zcdz addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:zcdz animated:true completion:nil];
}

+ (void)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if(maden == YES){
    CGPoint touchPoint = [touch locationInView:[UIApplication sharedApplication].keyWindow];
    CGFloat x = touchPoint.x;
    CGFloat y = touchPoint.y;
    if(zuobiaoz == 0){
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%f--%f",x,y] forKey:@"JiangHuXy11"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        zuobiaoz = 1;
    }else if(zuobiaoz == 1){
        [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%f--%f",x,y] forKey:@"JiangHuXy22"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        zuobiaoz = 2;
        
        UIAlertController *zcdz = [UIAlertController alertControllerWithTitle:@"提示" message:@"坐标获取完毕\n点击确定后将会自动从左到右点击三排五个键\n如果有一个按键没被点击 请选择重新获取坐标" preferredStyle:UIAlertControllerStyleAlert];
        
        [zcdz addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [tq hideCenterVc];
            maden = NO;
        }]];
        
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:zcdz animated:true completion:nil];
        
    }
    }
}

+ (void)t1:(float)t11 t2:(float)t22 t3:(float)t33 t4:(float)t44 tz:(NSString *)tiaozhuan pz:(NSString *)puzi1{
    zuobiao = [tiaozhuan componentsSeparatedByString:@";"];
    
    time1 = t11;//t1
    time2 = t22;//t2
    time3 = t33;//t3
    time4 = t44;
    
    puzi = puzi1;
    NSArray *pd11 = [puzi componentsSeparatedByString:@";"];
    
    UIWindow*mainWindow1;
    mainWindow1 = [UIApplication sharedApplication].keyWindow;
    
    CGFloat w = [UIScreen mainScreen].bounds.size.width/15;
    CGFloat ww = [UIScreen mainScreen].bounds.size.width - [UIScreen mainScreen].bounds.size.width/15*2;
    
    UIViewJianghu = [[UIView alloc]
                     initWithFrame:CGRectMake(w,2, ww, 35)];
    UIViewJianghu.backgroundColor=[UIColor whiteColor];
    UIViewJianghu.layer.borderColor = [[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f] CGColor];
    UIViewJianghu.layer.borderWidth = 1.0f;
    UIViewJianghu.layer.cornerRadius = 5;
    UIViewJianghu.hidden=NO;
    // UIViewJianghu.center = mainWindow1.center;
    [mainWindow1 addSubview:UIViewJianghu];
    
    UILabel *juren = [[UILabel alloc] initWithFrame:CGRectMake(10, 0,90, 35)];
    juren.numberOfLines = 0;
    juren.lineBreakMode = NSLineBreakByCharWrapping;
    juren.text = @"播放倍数：";
    //juren.textAlignment = NSTextAlignmentCenter;
    juren.font = [UIFont boldSystemFontOfSize:15];
    juren.textColor = [UIColor redColor];
    [UIViewJianghu addSubview:juren];
    
    NSArray *array = [NSArray arrayWithObjects:@"-0.5",@"-0.25",@"还原",@"+0.5",@"+1", nil];
    //初始化UISegmentedControl
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
    //设置frame
    segment.frame = CGRectMake(90, 5, 225, 25);
    segment.selectedSegmentIndex = 2;
    // segment.tintColor = [UIColor redColor];
    segment.apportionsSegmentWidthsByContent = NO;
    //添加到视图
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    [UIViewJianghu addSubview:segment];
    
    ButtonZanTing = [[UIButton alloc] initWithFrame:CGRectMake(180+145, 5, 70, 25)];
    [ButtonZanTing setTitle:@"暂停播放" forState:UIControlStateNormal];
    [ButtonZanTing setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ButtonZanTing.backgroundColor = [UIColor blueColor];
    [ButtonZanTing.titleLabel setFont:[UIFont systemFontOfSize:15]];
    ButtonZanTing.layer.cornerRadius = 5;
    [ButtonZanTing addTarget:self action:@selector(zanting) forControlEvents:UIControlEventTouchUpInside];
    [UIViewJianghu addSubview:ButtonZanTing];
    
    UILabel *juren1 = [[UILabel alloc] initWithFrame:CGRectMake(340+65, 0,60, 35)];
    juren1.numberOfLines = 0;
    juren1.lineBreakMode = NSLineBreakByCharWrapping;
    juren1.text = @"进度：";
    //juren.textAlignment = NSTextAlignmentCenter;
    juren1.font = [UIFont boldSystemFontOfSize:15];
    juren1.textColor = [UIColor redColor];
    [UIViewJianghu addSubview:juren1];
    
    slider2 = [[UISlider alloc] initWithFrame:CGRectMake(445, 0, UIViewJianghu.frame.size.width-500, 35)];
    /// 属性配置
    // minimumValue  : 当值可以改变时，滑块可以滑动到最小位置的值，默认为0.0
    slider2.minimumValue = 0;
    // maximumValue : 当值可以改变时，滑块可以滑动到最大位置的值，默认为1.0
    slider2.maximumValue = pd11.count;
    // 当前值，这个值是介于滑块的最大值和最小值之间的，如果没有设置边界值，默认为0-1；
    slider2.value = 0;
    // continuous : 如果设置YES，在拖动滑块的任何时候，滑块的值都会改变。默认设置为YES
    [slider2 setContinuous:YES];
    [slider2 addTarget:self action:@selector(beishu:) forControlEvents:UIControlEventValueChanged];
    [UIViewJianghu addSubview:slider2];
    // slider2.vd_trackHeight = 5.0f;
    
    UIButton * chucao2 = [[UIButton alloc] initWithFrame:CGRectMake(UIViewJianghu.frame.size.width-45, 5, 35, 25)];
    [chucao2 setTitle:@"结束" forState:UIControlStateNormal];
    [chucao2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    chucao2.backgroundColor = [UIColor blueColor];
    [chucao2.titleLabel setFont:[UIFont systemFontOfSize:15]];
    chucao2.layer.cornerRadius = 5;
    [chucao2 addTarget:self action:@selector(jiesu) forControlEvents:UIControlEventTouchUpInside];
    [UIViewJianghu addSubview:chucao2];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *pd1 = [puzi componentsSeparatedByString:@";"];
        for(ii = 0; ii <pd1.count; ii ++){
            if(JS == 1){
                JS = 0;
                break;
            }
            
            if([pd1[ii] containsString:zuobiao[0]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    c4();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[1]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    d4();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[2]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    e4();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[3]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    f4();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[4]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    g4();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[5]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    a4();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[6]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    b4();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[7]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    c5();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[8]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    d5();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[9]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    e5();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[10]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    f5();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[11]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    g5();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[12]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    a5();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[13]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    b5();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:zuobiao[14]]){
                dispatch_async(dispatch_get_main_queue(), ^{
                    c6();
                });
                usleep(200/BS);
            }
            if([pd1[ii] containsString:@"t1"]){
                usleep(time1*1000/BS);
                //t1时间
            }
            if([pd1[ii] containsString:@"t2"]){
                usleep(time2*1000/BS);
                //t2时间
            }
            if([pd1[ii] containsString:@"t3"]){
                usleep(time3*1000/BS);
                //t3时间
            }
            if([pd1[ii] containsString:@"t4"]){
                usleep(time4/BS);
                //t4时间
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                slider2.value = ii;
            });
            if(ii == pd1.count-1){
                ZT = 1;
                JS = 0;
                BS = 1;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [UIView animateWithDuration:1 animations:^{
                        UIViewJianghu.alpha = 0;
                    } completion:^(BOOL finished) {
                        [UIViewJianghu removeFromSuperview];
                    }];
                });
            }
        }
    });
    
}

+ (void)beishu:(UISlider *)slider2{
    if(slider2.value > slider2.maximumValue-10)
        ii= slider2.maximumValue-10;
    else
        ii= slider2.value;
}
+ (void)change:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex == 0) {
        BS = 0.5;
    }else if (sender.selectedSegmentIndex == 1) {
        BS = 0.75;
    }else if (sender.selectedSegmentIndex == 2){
        BS = 1;
    }else if (sender.selectedSegmentIndex == 3){
        BS = 1.25;
    }else if (sender.selectedSegmentIndex == 4){
        BS = 1.5;
    }
}

+ (void)jiesu{
    ZT = 1;
    JS = 1;
    BS = 1;
    [UIView animateWithDuration:1 animations:^{
        UIViewJianghu.alpha = 0;
    } completion:^(BOOL finished) {
        [UIViewJianghu removeFromSuperview];
        JS = 0;
    }];
}

+ (void)zanting{
    if(ZT == 1){
        dispatch_async(dispatch_get_main_queue(), ^{
        ZT = 0;
        [ButtonZanTing setTitle:@"继续播放" forState:UIControlStateNormal];
        JD = ii;
        JS = 1;
        });
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
        ZT = 1;
        [ButtonZanTing setTitle:@"暂停播放" forState:UIControlStateNormal];
        });
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSArray *pd1 = [puzi componentsSeparatedByString:@";"];
            for(ii = JD; ii <pd1.count; ii ++){
                if(JS == 1){
                    JS = 0;
                    break;
                }
                
                if([pd1[ii] containsString:zuobiao[0]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        c4();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[1]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        d4();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[2]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        e4();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[3]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        f4();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[4]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        g4();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[5]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        a4();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[6]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        b4();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[7]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        c5();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[8]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        d5();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[9]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        e5();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[10]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        f5();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[11]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        g5();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[12]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        a5();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[13]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        b5();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:zuobiao[14]]){
                    dispatch_async(dispatch_get_main_queue(), ^{
                        c6();
                    });
                    usleep(200/BS);
                }
                if([pd1[ii] containsString:@"t1"]){
                    usleep(time1*1000/BS);
                    //t1时间
                }
                if([pd1[ii] containsString:@"t2"]){
                    usleep(time2*1000/BS);
                    //t2时间
                }
                if([pd1[ii] containsString:@"t3"]){
                    usleep(time3*1000/BS);
                    //t3时间
                }
                if([pd1[ii] containsString:@"t4"]){
                    usleep(time4/BS);
                    //t4时间
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    slider2.value = ii;
                });
                if(ii == pd1.count-1){
                    ZT = 1;
                    JS = 0;
                    BS = 1;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [UIView animateWithDuration:1 animations:^{
                            UIViewJianghu.alpha = 0;
                        } completion:^(BOOL finished) {
                            [UIViewJianghu removeFromSuperview];
                        }];
                    });
                }
            }
        });
    }
}

@end
