//
//  ViewController.m
//  AttrStringDemo
//
//  Created by Lugick Wang on 2021/5/19.
//

#import "ViewController.h"
#import "CollectionFooter.h"
#import <Masonry/Masonry.h>

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.equalTo(@320);
        make.height.equalTo(@320);
    }];
    
    [self.collectionView reloadData];
    // Do any additional setup after loading the view.
}
- (NSMutableAttributedString *)attrString {
    NSString *answeredOption = @"A、B、C、D";
    
    NSString *correctOption =  @"A、B、C";
    
    NSString *answer = [NSString stringWithFormat:@"正确答案是 %@，你的答案是 %@。",correctOption, answeredOption];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:answer];
    
    [attributedString addAttribute:NSFontAttributeName
                               value:[UIFont systemFontOfSize:15]
                               range:NSMakeRange(0,6)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 6)];
    
    
    [attributedString addAttribute:NSFontAttributeName
                               value:[UIFont systemFontOfSize:15]
                               range:NSMakeRange(6,correctOption.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(6,correctOption.length)];
    
    
    [attributedString addAttribute:NSFontAttributeName
                               value:[UIFont systemFontOfSize:15]
                               range:NSMakeRange(6+correctOption.length,7)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(6+correctOption.length,7)];
    
    [attributedString addAttribute:NSFontAttributeName
                               value:[UIFont systemFontOfSize:15]
                               range:NSMakeRange(6+correctOption.length+7,answeredOption.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(6+correctOption.length+7,answeredOption.length)];
    
    return attributedString;
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        CollectionFooter *footer = [CollectionFooter reusableTestFooterCellForCollectionView:collectionView forIndexPath:indexPath];
        [footer setContent:[self attrString]];
        return footer;
    }
    return nil;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    CGFloat height = 0;

    CGRect rect = [[self attrString] boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    
    height += 10;
    height += rect.size.height;
    height += 10;
    
//    // to see the full text
//    height += 100;
    return CGSizeMake(320, height);
}

#pragma mark  - getters
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(30, 30);
        layout.minimumInteritemSpacing = 10;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [CollectionFooter collectionViewRegistTestFooterCell:_collectionView];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        if (@available(iOS 11, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _collectionView;
}


- (UILabel *)label {
    if (!_label) {
        _label = [UILabel new];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.numberOfLines = 0;
    }
    return _label;
}

@end
