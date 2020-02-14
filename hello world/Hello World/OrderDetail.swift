//
//  OrderDetail.swift
//  Hello World
//
//  Created by tokunakaharuyuki on 2020/01/18.
//  Copyright © 2020 M&B company. All rights reserved.
//

import SwiftUI

struct OrderDetail: View {
    var order: OrderEntity
    
    var body: some View {
        VStack {
            Text(order.flavorName)
                .font(.title)
            if order.nataDeCoco {
                 Text("Nata de coco")
            }
            
        }
       
    }
}

struct OrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetail(order: orderStore.orders[0])
    }
}
