//
//  BTCFecher.m
//  bitcoinwatchkitdemococoaheads
//
//  Created by Jose Lino Neto on 1/28/15.
//  Copyright (c) 2015 Construtor. All rights reserved.
//

#import "BTCFetcher.h"
#import <AFNetworking/AFNetworking.h>

@implementation BTCFetcher

+(NSString *)buscarValorAtualizado:(HandlerSucessoBTCFecher)sucesso falha:(HandlerFalhaBTCFecher)falha{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:@"https://www.mercadobitcoin.net/api/ticker/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if (sucesso){
            sucesso(operation.response, responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        falha(operation.response, error);
    }];
    
    NSString *valor = @"R$ 789,99";
    
    return valor;
}

@end
