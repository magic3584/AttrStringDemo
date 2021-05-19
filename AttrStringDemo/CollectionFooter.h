//
//  CollectionFooter.h
//  AttrStringDemo
//
//  Created by Lugick Wang on 2021/5/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionFooter : UICollectionReusableView

- (void)setContent:(NSAttributedString *)content;

+ (void)collectionViewRegistTestFooterCell:(UICollectionView *)collectionView;

+ (instancetype)reusableTestFooterCellForCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
