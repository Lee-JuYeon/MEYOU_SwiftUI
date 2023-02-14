//
//  MatesListView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2023/01/03.
//

import SwiftUI

struct MatesCardListView: View {
    
//    /// Return the CardViews width for the given offset in the array
//    /// - Parameters:
//    ///   - geometry: The geometry proxy of the parent
//    ///   - id: The ID of the current user
//    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
//        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
//        return geometry.size.width - offset
//    }
//
//    /// Return the CardViews frame offset for the given offset in the array
//    /// - Parameters:
//    ///   - geometry: The geometry proxy of the parent
//    ///   - id: The ID of the current user
//    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
//        return  CGFloat(users.count - 1 - id) * 10
//    }
//
//    private var maxID: Int {
//        return self.users.map { $0.id }.max() ?? 0
//    }
    
    var body: some View {
        VStack {
//            GeometryReader { geometry in
//                LinearGradient(
//                    gradient: Gradient(
//                        colors: [
//                            Color.init(#colorLiteral(red: 0.8509803922, green: 0.6549019608, blue: 0.7803921569, alpha: 1)),
//                            Color.init(#colorLiteral(red: 1, green: 0.9882352941, blue: 0.862745098, alpha: 1))
//                        ]
//                    ),
//                    startPoint: .bottom,
//                    endPoint: .top
//                )
//                .frame(
//                    width: geometry.size.width * 1.5,
//                    height: geometry.size.height
//                )
//                .background(Color.blue)
//                .clipShape(Circle())
//                .offset(
//                    x: -geometry.size.width / 4,
//                    y: -geometry.size.height / 2
//                )
//                
//                ZStack {
//                    ForEach(self.users, id: \.self) { user in
//                        Group {
//                            // Range Operator
//                            if (self.maxID - 3)...self.maxID ~= user.id {
//                                MatesCardView(
//                                    user: user,
//                                    onRemove: { removedUser in
//                                        // Remove that user from our array
//                                        self.users.removeAll { $0.id == removedUser.id }
//                                    }
//                                )
//                                .animation(.spring())
//                                .frame(
//                                    width: self.getCardWidth(geometry, id: user.id),
//                                    height: 400
//                                )
//                                .offset(
//                                    x: 0,
//                                    y: self.getCardOffset(geometry, id: user.id)
//                                )
//                            }
//                        }
//                    }//forEach
//                }//ZStack
//            }//geometryReader
        }//VStack
    }
}
