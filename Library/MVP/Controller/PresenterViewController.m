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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (Presenter *p in self.presenters) {
        [p willAppear:animated];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    for (Presenter *p in self.presenters) {
        [p didAppear:animated];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    for (Presenter *p in self.presenters) {
        [p willDisappear:animated];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    for (Presenter *p in self.presenters) {
        [p didDisappear:animated];
    }
}

- (void)dealloc
{
    
}

@end
