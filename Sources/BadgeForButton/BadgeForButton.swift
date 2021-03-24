import SwiftUI
import ColorExtensions

public extension View {
    
    func badgeNumber(_ badgeNum: Int, font: Font = Font.caption2, color: Color = .red) -> some View {
        func createBorder(_ geometry: GeometryProxy, _ preferences: [ChildViewPreferenceData]) -> some View {
            let p = preferences.first
            
            let bounds = p != nil ? geometry[p!.bounds] : .zero
            
            return ZStack {
                if badgeNum > 0 {
                    Text("\(badgeNum)")
                        .lineLimit(1)
                        .fixedSize()
                        .font(font)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 1)
                        .foregroundColor(color.accessibleFontColor)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(color)
                        )
                        .offset(x: 7.0, y: -7.0)
                }
            }
            .frame(width: bounds.size.width, height: bounds.size.height, alignment: .topTrailing)
        }
        
        return ZStack {
            self
                .anchorPreference(key: ChildViewPreferenceKey.self, value: .bounds, transform: { anchor in
                    [ChildViewPreferenceData(bounds: anchor)]
                })
                .overlayPreferenceValue(ChildViewPreferenceKey.self) { preferences in
                    GeometryReader { geometry in
                        createBorder(geometry, preferences)
                    }
                }
        }
    }
    
    
}


struct ChildViewPreferenceData {
    let bounds: Anchor<CGRect>
}

struct ChildViewPreferenceKey: PreferenceKey {
    typealias Value = [ChildViewPreferenceData]
    
    static var defaultValue: [ChildViewPreferenceData] = []
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.append(contentsOf: nextValue())
    }
}
