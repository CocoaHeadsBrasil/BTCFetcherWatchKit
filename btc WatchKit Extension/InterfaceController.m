//
//  InterfaceController.m
//  btc WatchKit Extension
//
//  Created by Jose Lino Neto on 1/29/15.
//  Copyright (c) 2015 Construtor. All rights reserved.
//

#import "InterfaceController.h"
#import "BTCFetcher.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *ultimoValorLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *vendaLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *compraLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *maximoLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *minimoLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *volumeLabel;

@end


@implementation InterfaceController

-(void)atualizarRemoto{
    [self.ultimoValorLabel setText:@"Carregando..."];
    [self.vendaLabel setText:@""];
    [self.compraLabel setText:@""];
    [self.maximoLabel setText:@""];
    [self.minimoLabel setText:@""];
    
    // Configure interface objects here.
    [BTCFetcher buscarValorAtualizado:^(NSHTTPURLResponse *resposta, id objetoDeResposta) {
        
        NSString *ultimoValor = [NSString stringWithFormat:@"last: R$ %4.2f", [objetoDeResposta[@"ticker"][@"last"] doubleValue]];
        NSString *vendaValor = [NSString stringWithFormat:@"sell: R$ %4.2f", [objetoDeResposta[@"ticker"][@"buy"] doubleValue]];
        NSString *compraValor = [NSString stringWithFormat:@"buy: R$ %4.2f", [objetoDeResposta[@"ticker"][@"sell"] doubleValue]];
        NSString *maximoValor = [NSString stringWithFormat:@"high: R$ %4.2f", [objetoDeResposta[@"ticker"][@"high"] doubleValue]];
        NSString *minimoValor = [NSString stringWithFormat:@"low: R$ %4.2f", [objetoDeResposta[@"ticker"][@"low"] doubleValue]];
        NSString *volumeValor = [NSString stringWithFormat:@"volume: %4.2f", [objetoDeResposta[@"ticker"][@"vol"] doubleValue]];
        
        [self.ultimoValorLabel setText:ultimoValor];
        [self.vendaLabel setText:vendaValor];
        [self.compraLabel setText:compraValor];
        [self.maximoLabel setText:maximoValor];
        [self.minimoLabel setText:minimoValor];
        [self.volumeLabel setText:volumeValor];
        
    } falha:^(NSHTTPURLResponse *resposta, NSError *erro) {
        [self.ultimoValorLabel setText:@"Erro"];
    }];
}

- (IBAction)atualizarAction {
    [self atualizarRemoto];
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    [self atualizarRemoto];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



