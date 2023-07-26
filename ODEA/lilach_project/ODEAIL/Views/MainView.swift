import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel = MainViewModel()

    var body: some View {
        if viewModel.isSignIn, !viewModel.currentUserId.isEmpty {
            let dataManager = DataManager(userId: viewModel.currentUserId)
            TabView {
                ShopView(userId: viewModel.currentUserId) // Pass dataManager here
                    .tabItem { Label("Shop", systemImage: "bag") }
                RecentsOrdersView(userId: viewModel.currentUserId) // Pass dataManager here
                    .tabItem { Label("Recent Orders", systemImage: "cart.fill") }
            }
            .environmentObject(dataManager) // Make the DataManager available throughout the SwiftUI hierarchy
        } else {
            LoginView()
        }
    }
}
