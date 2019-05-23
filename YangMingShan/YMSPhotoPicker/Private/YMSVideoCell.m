//
//  YMSVideoCell.m
//  YangMingShan
//
//  Created by Gal Cohen on 4/24/19.
//  Copyright © 2019 Yahoo. All rights reserved.
//

#import "YMSVideoCell.h"
#import "YMSPhotoPickerTheme.h"

@interface YMSVideoCell ()

@property (weak, nonatomic) IBOutlet UILabel *videoDurationLabel;
@property (weak, nonatomic) IBOutlet UIView *videoDetailView;

@end

@implementation YMSVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.videoDurationLabel.textColor = [YMSPhotoPickerTheme sharedInstance].videoDurationTextColor;
    self.videoDurationLabel.font = [YMSPhotoPickerTheme sharedInstance].videoDurationLabelFont;
    self.videoDetailView.backgroundColor = [YMSPhotoPickerTheme sharedInstance].videoCellDetailViewColor;
}

- (void)loadPhotoWithManager:(PHImageManager *)manager forAsset:(PHAsset *)asset targetSize:(CGSize)size
{
    [super loadPhotoWithManager:manager forAsset:asset targetSize:size];
    
    int duration = (int)asset.duration;
    int minutes = duration / 60;
    int seconds = duration % 60;
    self.videoDurationLabel.text = [NSString stringWithFormat:@"%i:%02i", minutes, seconds];
}


@end
