//
//  KKListEmptyView.m
//  KKTableView
//
//  Created by KKWONG on 2020/9/26.
//  Copyright © 2020 KKWONG. All rights reserved.
//

#import "KKListEmptyView.h"
@interface KKListEmptyView()
@property (nonatomic, strong) UITapGestureRecognizer * reloadTapGR;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * detailLabel;
@property (nonatomic, strong) UILabel * loadingLabel;
@property (nonatomic, strong) UILabel * errorTitleLabel;
@property (nonatomic, strong) UILabel * errorDetailLabel;
@property (nonatomic, strong) UIImageView * emptyImageView;
@property (nonatomic, strong) UIImageView * errorImageView;
@property (nonatomic, strong) UIActivityIndicatorView * indicatorView;
@end
@implementation KKListEmptyView
- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        [self addGestureRecognizer:self.reloadTapGR];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.loadingLabel];
        [self addSubview:self.errorTitleLabel];
        [self addSubview:self.errorDetailLabel];
        [self addSubview:self.emptyImageView];
        [self addSubview:self.errorImageView];
        [self addSubview:self.indicatorView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.titleLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.8
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorTitleLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorTitleLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                    multiplier:1.0
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorTitleLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.8
                                                      constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.detailLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.8 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorDetailLabel
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.errorTitleLabel
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorDetailLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorDetailLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.8 constant:0]];
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.emptyImageView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.emptyImageView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.emptyImageView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.5 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.emptyImageView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                     multiplier:0.5 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorImageView
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorImageView
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self.errorTitleLabel
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:-10]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorImageView
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.5 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.errorImageView
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                     multiplier:0.5 constant:0]];
    
    if (self.emptyEntityCreator.emptyEntity.loadingPosition == KKEmptyViewLoadingOnTopPosition) {
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loadingLabel
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0]];
       [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loadingLabel
                                                        attribute:NSLayoutAttributeTop
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                        attribute:NSLayoutAttributeTop
                                                       multiplier:1.0
                                                         constant:10]];

        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                         attribute:NSLayoutAttributeTrailing
                                                         relatedBy:NSLayoutRelationEqual
                                                         toItem:self.loadingLabel
                                                         attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                         constant:-10]];
       [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                        attribute:NSLayoutAttributeCenterY
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:self.loadingLabel
                                                        attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0
                                                        constant:0]];

    } else {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                         constant:0]];
       [self addConstraint:[NSLayoutConstraint constraintWithItem:self.indicatorView
                                                        attribute:NSLayoutAttributeBottom
                                                        relatedBy:NSLayoutRelationEqual
                                                        toItem:self.titleLabel
                                                        attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                        constant:-10]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loadingLabel
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                     multiplier:1.0
                                                     constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loadingLabel
                                                     attribute:NSLayoutAttributeCenterY
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:self
                                                     attribute:NSLayoutAttributeCenterY
                                                     multiplier:1.0
                                                     constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.loadingLabel
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                     multiplier:0.8
                                                     constant:0]];
    }
}

- (void)reloadData:(UITapGestureRecognizer *)tap {
    if (self.reloadCallback) {
        tap.enabled = NO;
        self.reloadCallback();
    }
}


- (void)setEmptyEntityCreator:(KKEmptyEntityCreator *)emptyEntityCreator {
    _emptyEntityCreator = emptyEntityCreator;
    self.titleLabel.font            = emptyEntityCreator.emptyEntity.emptyTitleFont;
    self.detailLabel.font           = emptyEntityCreator.emptyEntity.emptyDetailFont;
    self.loadingLabel.font          = emptyEntityCreator.emptyEntity.emptyLoadingFont;
    self.titleLabel.text            = emptyEntityCreator.emptyEntity.emptyTitle;
    self.detailLabel.text           = emptyEntityCreator.emptyEntity.emptyDetail;
    self.loadingLabel.text          = emptyEntityCreator.emptyEntity.emptyLoading;
    self.titleLabel.textColor       = emptyEntityCreator.emptyEntity.emptyTitleColor;
    self.detailLabel.textColor      = emptyEntityCreator.emptyEntity.emptyDetailColor;
    self.loadingLabel.textColor     = emptyEntityCreator.emptyEntity.emptyLoadingColor;
    self.emptyImageView.image       = [UIImage imageNamed:emptyEntityCreator.emptyEntity.emptyImageName];
}

- (void)setLoading:(BOOL)loading {
    _loading = loading;
    self.emptyImageView.hidden      = self.hasError ? self.hasError : loading;
    self.titleLabel.hidden          = self.hasError ? self.hasError : loading;
    self.detailLabel.hidden         = self.hasError ? self.hasError : loading;
    self.errorImageView.hidden      = loading;
    self.errorTitleLabel.hidden     = loading;
    self.errorDetailLabel.hidden    = loading;
    self.indicatorView.hidden       = !loading;
    self.loadingLabel.hidden        = !loading;
    self.reloadTapGR.enabled        = !loading;
    if (loading) {
        [self.indicatorView startAnimating];
    } else {
        [self.indicatorView stopAnimating];
    }
}

- (void)setHasError:(BOOL)hasError {
    _hasError = hasError;
    self.emptyImageView.hidden      = hasError;
    self.titleLabel.hidden          = hasError;
    self.detailLabel.hidden         = hasError;
    self.errorImageView.hidden      = !hasError;
    self.errorTitleLabel.hidden     = !hasError;
    self.errorDetailLabel.hidden    = !hasError;
    self.indicatorView.hidden       = hasError;
    self.loadingLabel.hidden        = hasError;
    self.reloadTapGR.enabled        = hasError;
    self.reloadTapGR.enabled        = hasError;
    self.errorImageView.image = [UIImage imageNamed:self.emptyEntityCreator.emptyEntity.errorImageName];
    self.errorTitleLabel.text = self.emptyEntityCreator.emptyEntity.errorTitle;
    self.errorDetailLabel.text = self.emptyEntityCreator.emptyEntity.errorDetail;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
//        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [UILabel new];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
//        [self addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UILabel *)loadingLabel {
    if (!_loadingLabel) {
        _loadingLabel = [UILabel new];
        _loadingLabel.textAlignment = NSTextAlignmentCenter;
        _loadingLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _loadingLabel.hidden = YES;
//        [self addSubview:_loadingLabel];
    }
    return _loadingLabel;
}

- (UILabel *)errorDetailLabel {
    if (!_errorDetailLabel) {
        _errorDetailLabel = [UILabel new];
        _errorDetailLabel.textAlignment = NSTextAlignmentCenter;
        _errorDetailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _errorDetailLabel.hidden = YES;
//        [self addSubview:_errorDetailLabel];
    }
    return _errorDetailLabel;
}

- (UILabel *)errorTitleLabel{
    if (!_errorTitleLabel) {
        _errorTitleLabel = [UILabel new];
        _errorTitleLabel.textAlignment = NSTextAlignmentCenter;
        _errorTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _errorTitleLabel.hidden = YES;
//        [self addSubview:_errorTitleLabel];
    }
    return _errorTitleLabel;
}


- (UIImageView *)emptyImageView {
    if (!_emptyImageView) {
        _emptyImageView = [UIImageView new];
        _emptyImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _emptyImageView;
}


- (UIImageView *)errorImageView {
    if (!_errorImageView) {
        _errorImageView = [UIImageView new];
        _errorImageView.backgroundColor = UIColor.blueColor;
        _errorImageView.hidden = YES;
        _errorImageView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _errorImageView;
}


- (UITapGestureRecognizer *)reloadTapGR {
    if (!_reloadTapGR) {
        _reloadTapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reloadData:)];
        _reloadTapGR.enabled = NO;
    }
    return _reloadTapGR;
}

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _indicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        _indicatorView.hidden = YES;
        [_indicatorView sizeToFit];
    }
    return _indicatorView;
}


@end
