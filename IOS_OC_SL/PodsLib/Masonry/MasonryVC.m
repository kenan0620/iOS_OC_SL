//
//  MasonryVC.m
//  IOS_OC_SL
//
//  Created by 柯南 on 2021/8/18.
//

#import "MasonryVC.h"

@interface MasonryVC ()
@property (nonatomic, strong) UILabel *masLabel1;
@property (nonatomic, strong) UILabel *masLabel2;
@property (nonatomic, strong) UILabel *masLabel3;
@property (nonatomic, strong) UILabel *masLabel4;
@property (nonatomic, strong) NSMutableArray *masonryViewArray;
@end

@implementation MasonryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Masonry 详解";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addMutabViewTwo];
}

// 添加视图
- (void)addView{
    [self.view addSubview:self.masLabel1];
    
    /**
     居屏幕中间展示
     
     [self.masLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.center.equalTo(self.view);
     }];
     
     居屏幕左上展示
     [self.masLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
     make.left.equalTo(self.view);
     }];
     
     居屏幕左下展示
     [self.masLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.equalTo(self.view);
     make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
     }];
     
     居屏幕右上展示
     [self.masLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
     make.right.equalTo(self.view);
     }];
     
     居屏幕右下展示
     [self.masLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.right.equalTo(self.view);
     make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
     }];
     居屏幕右100上100展示
     [self.masLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(100);
     make.right.equalTo(self.view).offset(-100);
     }];
     */
    
    [self.masLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(100);
        make.right.equalTo(self.view).offset(-100);
    }];
    self.masLabel1.text = @"添加的视图1";
}


- (void)addMutabViewOne{
    [self.view addSubview:self.masLabel1];
    [self.view addSubview:self.masLabel2];
    [self.view addSubview:self.masLabel3];
    
    [self.masLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        // 距离顶部安全区100
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(100);
        // 距离屏幕左边100
        make.left.equalTo(self.view).offset(100);
        // masLabel2、masLabel3的左边距和masLabel1保持一致
        make.left.equalTo(@[self.masLabel2,self.masLabel3]);
    }];
    
    [self.masLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        // 距离顶部安全区100
        make.centerY.equalTo(self.view);
    }];
    [self.masLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        // 距离底部安全区100,bottom往上是负数,往下是正数
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-100);
        make.top.mas_equalTo(self.view).offset(10);
    }];
    
    self.masLabel1.text = @"添加的视图1";
    self.masLabel2.text = @"添加的视图2";
    self.masLabel3.text = @"添加的视图3";
    
}

- (void)addMutabViewTwo{
    // 通过对MASAxisType和(withFixedSpacing或withFixedItemLength)进行组合从而实现高度固定改变间隔和间隔固定改变高度的操作.
    //    // 实现masonry水平固定间隔方法
    //    [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
    //    // 设置array的垂直方向的约束
    //    [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(50);
    //        make.height.mas_equalTo(80);
    //    }];
    
    // 实现masonry水平固定控件宽度方法
    //        [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:80 leadSpacing:10 tailSpacing:10];
    //
    //        // 设置array的垂直方向的约束
    //        [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(50);
    //            make.height.mas_equalTo(80);
    //        }];
    
    // 实现masonry垂直固定控件高度方法
    //      [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
    //
    //      // 设置array的水平方向的约束
    //      [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
    //          make.left.equalTo(self.view).offset(50);
    //          make.width.mas_equalTo(80);
    //      }];
    
    // 实现masonry垂直方向固定控件高度方法
    [self.masonryViewArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:80 leadSpacing:10 tailSpacing:10];
    
    // 设置array的水平方向的约束
    [self.masonryViewArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50);
        make.width.mas_equalTo(80);
    }];
}

#pragma mark - UILazy
- (UILabel *)masLabel1{
    if (!_masLabel1) {
        _masLabel1 = [[UILabel alloc] init];
        _masLabel1.backgroundColor = [UIColor yellowColor];
        _masLabel1.numberOfLines = 0;
    }
    
    return _masLabel1;
}

- (UILabel *)masLabel2{
    if (!_masLabel2) {
        _masLabel2 = [[UILabel alloc] init];
        _masLabel2.backgroundColor = [UIColor lightGrayColor];
        _masLabel2.numberOfLines = 0;
    }
    
    return _masLabel2;
}

- (UILabel *)masLabel3{
    if (!_masLabel3) {
        _masLabel3 = [[UILabel alloc] init];
        _masLabel3.backgroundColor = [UIColor brownColor];
        _masLabel3.numberOfLines = 0;
    }
    
    return _masLabel3;
}

- (UILabel *)masLabel4{
    if (!_masLabel4) {
        _masLabel4 = [[UILabel alloc] init];
        _masLabel4.backgroundColor = [UIColor purpleColor];
        _masLabel4.numberOfLines = 0;
    }
    
    return _masLabel4;
}
- (NSMutableArray *)masonryViewArray {
    if (!_masonryViewArray) {
        
        _masonryViewArray = [NSMutableArray array];
        for (int i = 0; i < 4; i ++) {
            
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor yellowColor];
            [self.view addSubview:view];
            [_masonryViewArray addObject:view];
        }
    }
    
    return _masonryViewArray;
}

@end
