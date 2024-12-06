//
//  mainViewController.m
//  PersonCenter
//
//  Created by abel on 15/9/17.
//  Copyright © 2015年 abel. All rights reserved.
//



#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MainViewController.h"
#import "MBProgressHUD.h"
#import "tq.h"
#import "MainViewController.h"
#import <AudioToolbox/AudioToolbox.h>

#define KEY_WINDOW1 [UIApplication sharedApplication].keyWindow

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    UITableView *personalTableView;
    NSArray *dataSource;
    NSArray *bbbb;
    int jmm;
    UITextField *textField;
}

@end
static MBProgressHUD *hudd = nil;
#define CurrentViewSize self.view.frame.size
#define 歌曲遍历地址 @"https://tanqing.1ying.site/tanqing.1ying.site/jianghu.php" //写服务器文件里 php文件地址
#define 歌曲接口地址 @"https://tanqing.1ying.site/tanqing.1ying.site/" //写服务器文件里 php文件地址


@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:239 / 255.0 green:238 / 255.0 blue:245 / 255.0 alpha:1];
    CGFloat a;
    CGFloat b;
    if([UIScreen mainScreen].bounds.size.width > [UIScreen mainScreen].bounds.size.height){
        a = 40;
        b = 80;
    }else{
        a = 15;
        b = 30;
    }
    personalTableView = [[UITableView alloc]initWithFrame:CGRectMake(a, 0, self.navigationController.navigationBar.frame.size.width-b, CurrentViewSize.height) style:UITableViewStyleGrouped];
    personalTableView.backgroundColor = [UIColor colorWithRed:239 / 255.0 green:238 / 255.0 blue:245 / 255.0 alpha:1];
    [self.view addSubview:personalTableView];
    personalTableView.dataSource = self;
    personalTableView.delegate = self;
    personalTableView.bounces = NO;//yes，就是滚动超过边界会反弹有反弹回来的效果; NO，那么滚动到达边界会立刻停止。
    personalTableView.showsVerticalScrollIndicator = NO;//不显示右侧滑块
    personalTableView.separatorStyle = UITableViewCellSeparatorStyleNone;//分割线
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"< 返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBackAction:)];
    leftItem.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.navigationItem.rightBarButtonItems = @[
                                                [[UIBarButtonItem alloc] initWithTitle:@"坐标" style:UIBarButtonItemStylePlain target:self action:@selector(btnDidClicked)]
                                                ];

    
    NSArray *array = [NSArray arrayWithObjects:@"主页",@"收藏", nil];
    //初始化UISegmentedControl
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
    //根据内容定分段宽度
    segment.apportionsSegmentWidthsByContent = YES;
    //开始时默认选中下标(第一个下标默认是0)
    segment.selectedSegmentIndex = 0;
    //控件渲染色(也就是外观字体颜色)
    segment.tintColor = [UIColor whiteColor];
    // 设置指定索引选项的宽度(设置下标为2的分段宽度)
    [segment setWidth:100.0 forSegmentAtIndex:0];
    [segment setWidth:100.0 forSegmentAtIndex:1];
    //添加事件
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    //添加到视图
    self.navigationItem.titleView = segment;
    jmm = 0;
    hudd = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    hudd.mode = MBProgressHUDModeIndeterminate;
    hudd.label.text = @"载入中";
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSString *txturl = [NSString stringWithContentsOfURL:[NSURL URLWithString:歌曲遍历地址] encoding:NSUTF8StringEncoding error:nil];
        if(txturl){
            //NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[txturl dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
            dispatch_async(dispatch_get_main_queue(), ^{
                [hudd hideAnimated:YES];
                hudd = nil;
                NSArray *Pd = [歌曲遍历地址 componentsSeparatedByString:@"/"];
                NSString *string=[txturl stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@=====",Pd[Pd.count - 1]]withString:@""];
                self->dataSource = [string componentsSeparatedByString:@"====="];//主功能
                [self->personalTableView reloadData];
                self->bbbb = self->dataSource;
            });
        }
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hudd hideAnimated:YES];
        hudd = nil;
    });
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(a, self.navigationController.navigationBar.frame.size.height+10, self.navigationController.navigationBar.frame.size.width-b, 30)];
    textField.placeholder = @"请输入要查找到歌曲";
    // 数字键盘
    //textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.textAlignment = NSTextAlignmentCenter;
    textField.delegate = self;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (personalTableView.contentOffset.y <= 0)
    {
        [self.view addSubview:textField];
    }
    else
    {
        [textField removeFromSuperview];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField  {

    if(textField.text.length == 0){
        
        self->dataSource = self->bbbb;
        [self->personalTableView reloadData];
       
    }else{
        NSString *lala = nil;
        for(int shuzu = 0; shuzu<self->bbbb.count;shuzu++){
            if ([self->bbbb[shuzu] localizedCaseInsensitiveContainsString:textField.text]) {
                if(lala){
                    lala = [NSString stringWithFormat:@"%@=====%@",lala,self->bbbb[shuzu]];
                }else{
                    lala = self->bbbb[shuzu];
                }
                self->dataSource = [lala componentsSeparatedByString:@"====="];//主功能
                [self->personalTableView reloadData];
            }
        }
        
    }
    
}


//回车收起键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
    
}

- (void)change:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex == 0) {
        jmm = 0;
        hudd = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hudd.mode = MBProgressHUDModeIndeterminate;
        hudd.label.text = @"载入中";
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSString *txturl = [NSString stringWithContentsOfURL:[NSURL URLWithString:歌曲遍历地址] encoding:NSUTF8StringEncoding error:nil];
            if(txturl){
                //NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[txturl dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [hudd hideAnimated:YES];
                    hudd = nil;
                    NSArray *Pd = [歌曲遍历地址 componentsSeparatedByString:@"/"];
                    NSString *string=[txturl stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@=====",Pd[Pd.count - 1]]withString:@""];
                    self->dataSource = [string componentsSeparatedByString:@"====="];//主功能
                    [self->personalTableView reloadData];
                    self->bbbb = self->dataSource;
                });
            }
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hudd hideAnimated:YES];
            hudd = nil;
        });
    }else if(sender.selectedSegmentIndex == 1) {
        jmm = 1;
        self->dataSource = [[[NSUserDefaults standardUserDefaults] objectForKey:@"江湖收藏谱ya"] componentsSeparatedByString:@"\n"];//主功能
        [self->personalTableView reloadData];
        self->bbbb = self->dataSource;
    }
}

- (void)goBackAction:(UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)JiangHu{

}

- (void)btnDidClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [tq windownnn];
    });
}

#pragma mark - TbaleView的数据源代理方法实现
//返回组数的代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//返回行数的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0){
        return dataSource.count;
    }
    return 1;
}
//每个分组上边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *headerLabel;

    if (section == 0){
        if(jmm == 0){
        headerLabel = @"请选择要加载的琴谱 「左滑可以收藏」 首次使用请点击右上角坐标";
        }else if(jmm == 1){
         headerLabel = @"这里是您已收藏的琴谱 「左滑可以删除」";
        }
    }
    
    return headerLabel;
}

 - (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
 {
     return nil;
 }

//每个分组下边预留的空白高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 25;
}
//每个分组下对应的tableView高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

//返回每一行Cell的代理方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1 初始化Cell
    // 1.1 设置Cell的重用标识
    static NSString *ID = @"cell";
    // 1.2 去缓存池中取Cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    // 1.3 若取不到便创建一个带重用标识的Cell
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        //UITableViewCellStyleSubtitle // 带小标题
        //UITableViewCellStyleDefault
    }else//当页面拉动的时候 当cell存在并且最后一个存在 把它进行删除就出来一个独特的cell我们在进行数据配置即可避免
    {
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.textLabel.textColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:13];
    if (indexPath.section==0){
        if(jmm == 0){
            NSString *string=[dataSource[indexPath.row] stringByReplacingOccurrencesOfString:@"江湖弹你小鸡鸡" withString:@""];
        cell.textLabel.text = string;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",indexPath.row + 1];
        }else{
            NSString *string=[dataSource[indexPath.row] stringByReplacingOccurrencesOfString:@"江湖弹你小鸡鸡" withString:@""];
            cell.textLabel.text = string;
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",indexPath.row + 1];
        }
    }
    
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        if(indexPath.section == 0){
            UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
            [generator impactOccurred];
            
            NSString *edit = self->dataSource[indexPath.row];
            NSString *sc = [[NSUserDefaults standardUserDefaults] objectForKey:@"江湖收藏谱ya"];
            if ([sc containsString:[NSString stringWithFormat:@"%@\n",edit]]) {
                NSString *zzzzzzz= [sc stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@\n",edit] withString:@""];
                [[NSUserDefaults standardUserDefaults] setValue:zzzzzzz forKey:@"江湖收藏谱ya"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                self->dataSource = [zzzzzzz componentsSeparatedByString:@"\n"];
                [self->personalTableView reloadData];
                
            } else if([sc containsString:[NSString stringWithFormat:@"\n%@",edit]]) {
                NSString *zzzzzzz= [sc stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"\n%@",edit] withString:@""];
                [[NSUserDefaults standardUserDefaults] setValue:zzzzzzz forKey:@"江湖收藏谱ya"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                self->dataSource = [zzzzzzz componentsSeparatedByString:@"\n"];
                [self->personalTableView reloadData];
            }else{
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"江湖收藏谱ya"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                self->dataSource = [[[NSUserDefaults standardUserDefaults] objectForKey:@"江湖收藏谱ya"] componentsSeparatedByString:@"\n"];
                [self->personalTableView reloadData];
            }

        }
        }];
    
    UITableViewRowAction *deleteActio2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"收藏" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        if(indexPath.section == 0){
            UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
            [generator impactOccurred];
            
            NSString *sc = [[NSUserDefaults standardUserDefaults] objectForKey:@"江湖收藏谱ya"];
            if(!sc){
                [[NSUserDefaults standardUserDefaults] setValue:self->dataSource[indexPath.row] forKey:@"江湖收藏谱ya"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }else{
                [[NSUserDefaults standardUserDefaults] setValue:[NSString stringWithFormat:@"%@\n%@",sc,self->dataSource[indexPath.row]] forKey:@"江湖收藏谱ya"];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
            
        }
    }];
    
    deleteActio2.backgroundColor = [UIColor grayColor];
    if(jmm == 0){
        return @[deleteActio2];
    }else{
        return @[deleteAction];
    }
}

- (NSString *)getUTF8EncodeStringWithURLString:(NSString *)urlString
{
    if (urlString && urlString.length > 0)
    {
        NSString *encodedString = (NSString *)
        CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                  (CFStringRef)urlString,
                                                                  (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
                                                                  NULL,
                                                                  kCFStringEncodingUTF8));
        return encodedString;
    }
    else
    {
        return @"";
    }
}

    
    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        [personalTableView deselectRowAtIndexPath:[personalTableView indexPathForSelectedRow] animated:YES];
        
        UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
        [generator impactOccurred];
        
        if (![[NSUserDefaults standardUserDefaults] objectForKey:@"JiangHuXy11"])
        {
            UIAlertController *zcdz11 = [UIAlertController alertControllerWithTitle:@"提示" message:@"检测到您还未获取坐标\n是否前往获取" preferredStyle:UIAlertControllerStyleAlert];
            
            [zcdz11 addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [self dismissViewControllerAnimated:YES completion:nil];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [tq windownnn];
                });
                
            }]];
            
            [zcdz11 addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
            
            [self presentViewController:zcdz11 animated:true completion:nil];
        }else{
        
        if (indexPath.section==0){
            if(jmm == 0){
                NSString *string=[dataSource[indexPath.row] stringByReplacingOccurrencesOfString:@"江湖弹你小鸡鸡" withString:@""];
                NSString *谱子地址 =[NSString stringWithFormat:@"%@%@",歌曲接口地址,[self getUTF8EncodeStringWithURLString:string]];
        hudd = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
        hudd.mode = MBProgressHUDModeIndeterminate;
        hudd.label.text = @"加载中";
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSError *error;
            NSString *txturl = [NSString stringWithContentsOfURL:[NSURL URLWithString:谱子地址] encoding:NSUTF8StringEncoding error:nil];
            if(txturl){
                NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[txturl dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [hudd hideAnimated:YES];
                    hudd = nil;
                    NSString *time= [json objectForKey:@"时间"];
                    NSString *zbz= [json objectForKey:@"坐标"];
                    NSString *puzi= [json objectForKey:@"谱曲"];
                    NSArray *p1 = [time componentsSeparatedByString:@";"];
                    NSArray *p2 = [zbz componentsSeparatedByString:@";"];
                    if(p1.count == 4 && p2.count == 15){
                        [self dismissViewControllerAnimated:YES completion:nil];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [tq t1:[p1[0] floatValue] t2:[p1[1] floatValue] t3:[p1[2] floatValue] t4:[p1[3] floatValue] tz:zbz pz:puzi];
                        });
                    }else{
                        UIAlertController *zcdz11 = [UIAlertController alertControllerWithTitle:@"提示" message:@"此歌曲文件损坏\n请联系管理员" preferredStyle:UIAlertControllerStyleAlert];
                        
                        [zcdz11 addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
                        
                        [self presentViewController:zcdz11 animated:true completion:nil];
                    }
                    
                });
            }
        });
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hudd hideAnimated:YES];
                    hudd = nil;
                });
            }else{
                NSString *string=[dataSource[indexPath.row] stringByReplacingOccurrencesOfString:@"江湖弹你小鸡鸡" withString:@""];
                NSString *谱子地址 =[NSString stringWithFormat:@"%@%@",歌曲接口地址,[self getUTF8EncodeStringWithURLString:string]];
                hudd = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
                hudd.mode = MBProgressHUDModeIndeterminate;
                hudd.label.text = @"加载中";
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    NSError *error;
                    NSString *txturl = [NSString stringWithContentsOfURL:[NSURL URLWithString:谱子地址] encoding:NSUTF8StringEncoding error:nil];
                    if(txturl){
                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[txturl dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [hudd hideAnimated:YES];
                            hudd = nil;
                            NSString *time= [json objectForKey:@"时间"];
                            NSString *zbz= [json objectForKey:@"坐标"];
                            NSString *puzi= [json objectForKey:@"谱曲"];
                            NSArray *p1 = [time componentsSeparatedByString:@";"];
                            NSArray *p2 = [zbz componentsSeparatedByString:@";"];
                            if(p1.count == 4 && p2.count == 15){
                            [self dismissViewControllerAnimated:YES completion:nil];
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                [tq t1:[p1[0] floatValue] t2:[p1[1] floatValue] t3:[p1[2] floatValue] t4:[p1[3] floatValue] tz:zbz pz:puzi];
                            });
                            }else{
                                UIAlertController *zcdz11 = [UIAlertController alertControllerWithTitle:@"提示" message:@"此歌曲文件损坏\n请联系管理员" preferredStyle:UIAlertControllerStyleAlert];

                                [zcdz11 addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil]];
                                
                                [self presentViewController:zcdz11 animated:true completion:nil];
                            }
                        });
                    }
                });
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4* NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hudd hideAnimated:YES];
                    hudd = nil;
                });
            }
        }
        }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
    cell.backgroundColor = UIColor.clearColor;
    
    // 圆角弧度半径
    CGFloat cornerRadius = 10.0f;
    
    // 创建一个shapeLayer
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    // 显示选中
    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init];
    //   创建一个可变的图像Path句柄，该路径用于保存绘图信息
    CGMutablePathRef pathRef = CGPathCreateMutable();
    //   获取cell的size
    //    第一个参数,是整个 cell 的 bounds, 第二个参数是距左右两端的距离,第三个参数是距上下两端的距离
    CGRect bounds = CGRectInset(cell.bounds, 0, 0);
    
    //      CGRectGetMinY：返回对象顶点坐标
    //      CGRectGetMaxY：返回对象底点坐标
    //      CGRectGetMinX：返回对象左边缘坐标
    //      CGRectGetMaxX：返回对象右边缘坐标
    //      CGRectGetMidX: 返回对象中心点的X坐标
    //      CGRectGetMidY: 返回对象中心点的Y坐标
    //      这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行
    NSInteger rows = [tableView numberOfRowsInSection:indexPath.section];
    BOOL addLine = NO;
    if (rows == 1) {
        // 初始起点为cell的左侧中间坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMidY(bounds));
        // 起始坐标为左下角，设为p，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMinX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMinX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMidY(bounds));
    } else if (indexPath.row == 0) {
        // 初始起点为cell的左下角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        // 起始坐标为左下角，设为p，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
        addLine = YES;
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section] - 1) {
        // 初始起点为cell的左上角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
    } else {
        // 添加cell的rectangle信息到path中（不包括圆角）
        CGPathAddRect(pathRef, nil, bounds);
        addLine = YES;
    }
    
    // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
    layer.path = pathRef;
    backgroundLayer.path = pathRef;
    
    // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CFRelease(pathRef);
    
    // 按照shape layer的path填充颜色，类似于渲染render
    layer.fillColor = [UIColor whiteColor].CGColor;
    
    // view大小与cell一致
    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    
    // 添加自定义圆角后的图层到roundView中
    [roundView.layer insertSublayer:layer atIndex:0];
    roundView.backgroundColor = UIColor.clearColor;
    
    // cell的背景view
    cell.backgroundView = roundView;
    
    // 添加分割线
    if (addLine == YES) {
        CALayer *lineLayer = [[CALayer alloc] init];
        
        CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
        
        lineLayer.frame = CGRectMake(18, bounds.size.height-lineHeight, bounds.size.width, lineHeight);
        
        lineLayer.backgroundColor = tableView.separatorColor.CGColor;
        
        [layer addSublayer:lineLayer];
    }
    
    // 以上方法存在缺陷当点击cell时还是出现cell方形效果，因此还需要添加以下方法
    // 如果你 cell 已经取消选中状态的话,那以下方法是不需要的.
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:bounds];
    backgroundLayer.fillColor = tableView.separatorColor.CGColor;
    [selectedBackgroundView.layer insertSublayer:backgroundLayer atIndex:0];
    selectedBackgroundView.backgroundColor = UIColor.clearColor;
    cell.selectedBackgroundView = selectedBackgroundView;
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
