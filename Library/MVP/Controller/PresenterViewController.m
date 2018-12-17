//
//  ViewController.m
//  YDD
//
//  Created by BinGe on 2018/12/5.
//

#import "PresenterViewController.h"

@interface PresenterViewController ()

@property (nonatomic, strong) NSMutableArray<Presenter *> *presenters;

@end

@implementation PresenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenters = [[NSMutableArray alloc] init];
}

- (void)addPresenter:(Presenter *)presenter {
    Log(@"%@", presenter);
    if (![self.presenters containsObject:presenter]) {
        [self.presenters addObject:presenter];
    }
}

- (void)dealloc
{
    Log(@"");
}

@end
