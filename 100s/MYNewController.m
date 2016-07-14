//
//  MYNewController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/14.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYNewController.h"
#import "MYHotCollectionCell.h"

@interface MYNewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *listArray;
@end

@implementation MYNewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.listArray = @[@"唐僧",@"悟空",@"八戒",@"沙僧",@"如来",@"观音"].mutableCopy;
    [self setupCollectionView];
    
}
- (void)setupCollectionView {
        
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.itemSize = CGSizeMake((SCREEN_WIDTH - 30) / 2, (SCREEN_WIDTH - 30) / 2 + 45);
        
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    // 注册单元
    [_collectionView registerClass:[MYHotCollectionCell class] forCellWithReuseIdentifier:@"MYHotCollectionCell"];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MYHotCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MYHotCollectionCell" forIndexPath:indexPath];
        
    cell.nameLabel.text = self.listArray[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
