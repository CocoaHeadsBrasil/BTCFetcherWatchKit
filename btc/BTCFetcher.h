//
//  BTCFecher.h
//  bitcoinwatchkitdemococoaheads
//
//  Created by Jose Lino Neto on 1/28/15.
//  Copyright (c) 2015 Construtor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTCFetcher : NSObject

typedef void (^HandlerSucessoBTCFecher)(NSHTTPURLResponse *resposta, id objetoDeResposta);
typedef void (^HandlerFalhaBTCFecher)(NSHTTPURLResponse *resposta, NSError *erro);

+(NSString *)buscarValorAtualizado:(HandlerSucessoBTCFecher)sucesso falha:(HandlerFalhaBTCFecher)falha;

@end
