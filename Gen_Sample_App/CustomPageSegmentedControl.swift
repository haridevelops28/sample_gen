import SwiftUI

struct CustomPageSegmentedControl: View {
    @Binding var selectedIndex: Int
    let onChange: (Int) -> Void
    let segments: [Segment]
    
    struct Segment {
        let icon: String
        let label: String?
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<segments.count, id: \.self) { index in
                Button(action: {
                    withAnimation(.easeInOut) {
                        selectedIndex = index
                    }
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: segments[index].icon)
                            .font(.system(size: 20, weight: .medium))
                        if selectedIndex == index, let label = segments[index].label {
                            Text(label)
                                .font(.system(size: 16, weight: .medium))
                        }
                    }
                    .foregroundColor(selectedIndex == index ? .black : .white)
                    .frame(
                        width: selectedIndex == index ? 140 : 60,
                        height: 60
                    )
                    .background(
                        Group {
                            if selectedIndex == index {
                                Color.white
                            } else {
                                Color.black
                            }
                        }
                    )
                    .clipShape(Capsule())
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .background(
            Capsule()
                .fill(Color.black)
        )
        .padding(.horizontal)
        .shadow(radius: 2)
    }
}

struct CustomPageSegmentedControlExample: View {
    @State private var selected = 0

    var body: some View {
        VStack {
            Spacer()
            CustomPageSegmentedControl(
                selectedIndex: $selected,
                onChange: { index in
                    print("selected index: \(index)")
                },
                segments: [
                    .init(icon: "house", label: "Home"),
                    .init(icon: "chart.bar", label: nil),
                    .init(icon: "person", label: nil)
                ]
            )
            Spacer()
        }
        .background(Color(.systemGray6).ignoresSafeArea())
    }
}

struct CustomPageSegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        CustomPageSegmentedControlExample()
    }
}
