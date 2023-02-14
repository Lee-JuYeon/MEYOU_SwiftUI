//
//  ChipView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/19.
//

import SwiftUI

struct ChipView: View {
    
    @State var chips : [ChipModel] = [
        ChipModel(text: "Worker Holic"),
        ChipModel(text: "Book"),
        ChipModel(text: "Movie"),
        ChipModel(text: "Singing"),
        ChipModel(text: "Cello"),
        ChipModel(text: "Piano"),
        ChipModel(text: "Guitar"),
        ChipModel(text: "Social Media"),
        ChipModel(text: "Pub"),
        ChipModel(text: "Animation"),
        ChipModel(text: "Drama"),
        ChipModel(text: "Right Wing"),
        ChipModel(text: "Left Wing"),
        ChipModel(text: "Start-up"),
        ChipModel(text: "Student"),
        ChipModel(text: "Cosplay"),
        ChipModel(text: "IELTS"),
        ChipModel(text: "TOEIC"),
        ChipModel(text: "JLPT"),
        ChipModel(text: "IT")
    ]
    
    private var fontSize : CGFloat = 16
    private let capsulePaddingSize : CGFloat = 40
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        VStack(
            spacing : 10
        ){
//            ForEach(getRows(), id:\.self){ rows in
//                HStack(spacing : capsulePaddingSize){
//                    ForEach(rows){ chipItem in
//                        ChipItemView(chip: chipItem)
//                    }
//                }
//            }
        }
        .onChange(of: chips) { newValue in
            guard let last = chips.last else { return }
            
            let font = UIFont.systemFont(ofSize: fontSize)
            /*
             NSAttributedString 객체는 문자열에 관련된 속성을 이용할 때에 필요함.
             NSAttributedString은 읽기 전용.
             NSMutableAttributedString은 수정가능.
             NSDictionary에 저장된 이름으로 문자열을 식별.
             즉, NSAttributedString은 텍스트의 일부분에 폰트를 바꾸고 색상을 변경할 수 있다.
             */
            let attributes = [NSAttributedString.Key.font : font]
            let size = (last.text as NSString).size(withAttributes: attributes)
            chips[getIndex(chip: last)].size = size.width
        }
        .animation(.easeInOut, value: chips)
    }
    
    private func getIndex(chip : ChipModel) -> Int {
        let index = chips.firstIndex { currentChip in
            return chip.id == currentChip.id
        } ?? 0
        
        return index
    }
    
    @ViewBuilder
    private func ChipItemView(chip : ChipModel) -> some View {
        Text(chip.text)
            .font(.system(size:fontSize))
            .padding(.horizontal, capsulePaddingSize/2)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(Theme.buttonColour(forScheme: scheme))
            )
            .lineLimit(1)
            .contentShape(Capsule())
    }
    
    private func getRows() -> [[ChipModel]] {
        var rows : [[ChipModel]] = []
        var currentRow : [ChipModel] = []

        // 텍스트 너비 계산
        var totalWidth : CGFloat = 0
        
        // 10은 여유로 뺴줌.
        let screenWidth : CGFloat = UIScreen.main.bounds.width - 90
        chips.forEach { chip in
            
            totalWidth += (chip.size + capsulePaddingSize)
            
            // totalWidth가 사이즈보다 큰지 계산
            if totalWidth > screenWidth {
                /*
                 2차배열 추가
                 데이터 초기화
                 긴 문자열 체크
                 */
                totalWidth = (!currentRow.isEmpty || rows.isEmpty ? (chip.size + capsulePaddingSize) : 0)
                
                //2차 배열에 추가
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(chip)
            }else{
                currentRow.append(chip)
            }
        }
        
        //
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        
        return rows
    }
}
