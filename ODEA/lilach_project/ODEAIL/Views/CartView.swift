
import SwiftUI

struct CartView: View {
    @EnvironmentObject var viewModel: DataManager
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingAlert = false
    
    
    private let userId: String
    
    init(userId: String) {
           self.userId = userId
       }
    var body: some View {
        ZStack {
            ScrollView {
                if viewModel.products.count > 0 {
                    ForEach(viewModel.products, id: \.id) { product in
                        ProductInCart(product: product)
                    }
                    
                    HStack {
                        Text("Your cart total is")
                        Spacer()
                        Text("$\(viewModel.total).00")
                            .bold()
                    }
                    .padding()
                    
                } else {
                    Text("Your cart is empty.")
                }
            }
            .navigationTitle(Text("My Cart"))
            .padding(.top)
            Spacer()
            Spacer()
            if !isShowingAlert {
                PrimaryButton(
                    title: "Save order",
                    background: .orange
                ) {
                    if viewModel.products.count > 0 {
                        viewModel.saveCartToFirestore()
                        isShowingAlert = true
                    }
                }
            }
            if isShowingAlert {
                            Color.black.opacity(0.5)
                                .edgesIgnoringSafeArea(.all)
                                .overlay(
                                    PopupView(
                                        title: "Order Status",
                                        message: "Your order has been sent successfully.",
                                        buttonText: "OK"
                                    ) {
                                        viewModel.removeAllFromCart()
                                        presentationMode.wrappedValue.dismiss()
                                        isShowingAlert = false // Reset isOrderReceived when "OK" button is tapped
                                    }
                                )
                        }
                    }
                }
            }


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(userId: "1234")
            .environmentObject(DataManager(userId: "1234"))
    }
}
