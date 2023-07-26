import Combine
import SwiftUI

struct ProductInCart: View {
    @EnvironmentObject var dataManager: DataManager
    var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(product.name)
                   

                Text("\(product.price)$")
            }
  
          
            Spacer()

            

                       Image(systemName: "trash")
                           .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                           .onTapGesture {
                               dataManager.removeFromCart(product: product)
                           }
                   }
                   .padding(.horizontal)
                   .frame(maxWidth: .infinity, alignment: .leading)
               }
     
    }

struct ProductInCart_Previews: PreviewProvider {
    static var previews: some View {
        ProductInCart(product: productList[2])
    }
}
