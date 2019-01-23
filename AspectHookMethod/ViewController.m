//
//  ViewController.m
//  AspectHookMethod
//
//  Created by yangrui on 2019/1/23.
//  Copyright © 2019 yangrui. All rights reserved.
//

#import "ViewController.h"
#import "Aspects.h"



@interface ViewController ()
@property (strong, nonatomic) AspectIdentifier *token;
@end

@implementation ViewController

-(void)test{
    NSLog(@"=======test====执行========");
}

- (IBAction)clearHook:(id)sender {
    NSLog(@"%s",__func__);
    [self.token remove];
    
}

- (IBAction)hookAfterOnce_BtnClick:(id)sender {
     NSLog(@"%s",__func__);
    NSError *err = nil;
    AspectIdentifier *token = [self aspect_hookSelector:@selector(test) withOptions:AspectPositionAfter|AspectOptionAutomaticRemoval usingBlock:^{
        NSLog(@"hook block after");
    } error:&err];
    
    self.token = token;
   
}


- (IBAction)hookReplaceOnce_BtnClick:(id)sender {
    NSLog(@"%s",__func__);
    NSError *err = nil;
    AspectIdentifier *token = [self aspect_hookSelector:@selector(test) withOptions:AspectPositionInstead|AspectOptionAutomaticRemoval usingBlock:^{
        NSLog(@"hook block replace");
    } error:&err];
    self.token = token;
    
}


- (IBAction)hookBeforeAlways_BtnClick:(id)sender {
     NSLog(@"%s",__func__);
    NSError *err = nil;
    AspectIdentifier *token = [self aspect_hookSelector:@selector(test) withOptions:AspectPositionBefore  usingBlock:^{
        NSLog(@"hook block replace");
    } error:&err];
    self.token = token;
    
}




- (IBAction)doTest_BtnClick:(id)sender {
    NSLog(@"%s",__func__);
    [self test];
    
}


@end
