//
//  ViewController.m
//  btc
//
//  Created by Jose Lino Neto on 1/29/15.
//  Copyright (c) 2015 Construtor. All rights reserved.
//

#import "ViewController.h"
#import "BTCFetcher.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *valorLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.valorLabel.text = @"Carregando...";
    [BTCFetcher buscarValorAtualizado:^(NSHTTPURLResponse *resposta, id objetoDeResposta) {

        NSString *valorFinal = [NSString stringWithFormat:@"R$ %4.2f", [objetoDeResposta[@"ticker"][@"last"] doubleValue]];
        
        self.valorLabel.text = valorFinal;
    } falha:^(NSHTTPURLResponse *resposta, NSError *erro) {
        self.valorLabel.text = @"0.00";
    }];
}

@end
