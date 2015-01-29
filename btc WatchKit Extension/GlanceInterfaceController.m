//
//  GlanceInterfaceController.m
//  btc
//
//  Created by Jose Lino Neto on 1/29/15.
//  Copyright (c) 2015 Construtor. All rights reserved.
//

#import "GlanceInterfaceController.h"
#import "BTCFetcher.h"

@interface GlanceInterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *valorLabel;

@end

@implementation GlanceInterfaceController

-(void)awakeWithContext:(id)context{
    [super awakeWithContext:context];
    
    [self atualizarRemoto];
}

-(void)atualizarRemoto{
    [self.valorLabel setText:@"Carregando..."];
    
    // Configure interface objects here.
    [BTCFetcher buscarValorAtualizado:^(NSHTTPURLResponse *resposta, id objetoDeResposta) {
        
        NSString *valorFinal = [NSString stringWithFormat:@"R$ %4.2f", [objetoDeResposta[@"ticker"][@"last"] doubleValue]];
        self.valorLabel.text = valorFinal;
        
    } falha:^(NSHTTPURLResponse *resposta, NSError *erro) {
        self.valorLabel.text = @"0.00";
    }];
}

@end
