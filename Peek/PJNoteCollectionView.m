//
//  PJNoteCollectionView.m
//  Peek
//
//  Created by pjpjpj on 2018/6/19.
//  Copyright © 2018年 #incloud. All rights reserved.
//

#import "PJNoteCollectionView.h"
#import "PJNoteCollectionViewCell.h"
#import "PJNoteHeaderView.h"

static NSString * const resureIdentifier = @"PJNoteCollectioview";

@interface PJNoteCollectionView() <UICollectionViewDataSource, UICollectionViewDelegate>
@end

@implementation PJNoteCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor clearColor];
    self.delegate = self;
    self.dataSource = self;
    self.showsVerticalScrollIndicator = false;
    
    self.dataArray = [@[] mutableCopy];

    [self registerClass:[PJNoteCollectionViewCell class] forCellWithReuseIdentifier:@"PJNoteCollectioview"];
    [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PJNoteHeaderView"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PJNoteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PJNoteCollectioview" forIndexPath:indexPath];
    if (cell) {
        for (UIView *view in cell.subviews) {
            [view removeFromSuperview];
        }
    }
    cell.dataSource = self.dataArray[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    //如果是头视图
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"PJNoteHeaderView" forIndexPath:indexPath];
        if (header) {
            for (UIView *view in header.subviews) {
                [view removeFromSuperview];
            }
        }
        PJNoteHeaderView *headerView = [[PJNoteHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.width, 100)];
        //头视图添加view
        [header addSubview:headerView];
        return header;
    }
    //如果底部视图
    //    if([kind isEqualToString:UICollectionElementKindSectionFooter]){
    //
    //    }
    return nil;
}


@end