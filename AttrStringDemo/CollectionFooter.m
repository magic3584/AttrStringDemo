//
//  CollectionFooter.m
//  AttrStringDemo
//
//  Created by Lugick Wang on 2021/5/19.
//

#import "CollectionFooter.h"
#import <Masonry/Masonry.h>

@interface CollectionFooter()
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *contentLabel;


@end

@implementation CollectionFooter
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}


- (void)configUI {
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self.bgView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.top.equalTo(@10);
        make.bottom.equalTo(@-10);
    }];

}


#pragma mark - public
- (void)setContent:(NSAttributedString *)content {
    [self.contentLabel setAttributedText:content];
}

+ (void)collectionViewRegistTestFooterCell:(UICollectionView *)collectionView {
    [collectionView registerClass:[self class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([self class])];
}

+ (instancetype)reusableTestFooterCellForCollectionView:(UICollectionView *)collectionView forIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];

}

#pragma mark - getters
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}


@end
