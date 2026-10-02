import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var dnsEnabled = true
    @State private var proxyBody = false
    @State private var proxyCoV1 = false
    @State private var proxyCoV2 = false
    @State private var proxyMagic = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            VStack(spacing: 0) {
                // Header
                HStack(spacing: 12) {
                    Image(systemName: "bolt.shield.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42, height: 42)
                        .foregroundColor(.cyan)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.cyan.opacity(0.15))
                        )

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Grock Proxy")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        Text("com.grock.proxy")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        HStack(spacing: 4) {
                            Circle().fill(Color.green).frame(width: 8, height: 8)
                            Text("ONLINE")
                                .font(.system(size: 11, weight: .medium))
                                .foregroundColor(.green)
                        }
                    }
                    Spacer()
                }
                .padding()

                // Tabs
                HStack(spacing: 0) {
                    TabButton(title: "Proxy", icon: "bolt.fill", isSelected: selectedTab == 0) { selectedTab = 0 }
                    TabButton(title: "Định Vị", icon: "location.fill", isSelected: selectedTab == 1) { selectedTab = 1 }
                    TabButton(title: "Mod NV", icon: "person.2.fill", isSelected: selectedTab == 2) { selectedTab = 2 }
                    TabButton(title: "ESP", icon: "eye.fill", isSelected: selectedTab == 3) { selectedTab = 3 }
                }
                .padding(.horizontal)
                .padding(.bottom, 8)

                ScrollView {
                    VStack(spacing: 16) {
                        if selectedTab == 0 {
                            // DNS Antiband
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Circle().fill(Color.green).frame(width: 8, height: 8)
                                    Text("Đang chặn quảng cáo")
                                        .font(.system(size: 13))
                                        .foregroundColor(.white.opacity(0.8))
                                }

                                HStack {
                                    Image(systemName: "shield.fill")
                                        .foregroundColor(.blue)
                                        .font(.system(size: 22))
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("DNS Antiband 4.0")
                                            .font(.system(size: 15, weight: .semibold))
                                            .foregroundColor(.white)
                                        Text("DNS NextDNS · Chống Game Quét")
                                            .font(.system(size: 11))
                                            .foregroundColor(.gray)
                                        Text("DNS-over-HTTPS")
                                            .font(.system(size: 11))
                                            .foregroundColor(.blue)
                                    }
                                    Spacer()
                                    Image(systemName: dnsEnabled ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(dnsEnabled ? .green : .gray)
                                        .font(.system(size: 28))
                                        .onTapGesture { dnsEnabled.toggle() }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 14).fill(Color(white: 0.12)))
                            }
                            .padding(.horizontal)

                            // PROXY DELTA VIP
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Rectangle().fill(Color.cyan).frame(width: 3, height: 16)
                                    Text("PROXY DELTA VIP")
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text("AUTO")
                                        .font(.system(size: 11, weight: .bold))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 3)
                                        .background(Color.cyan.opacity(0.2))
                                        .foregroundColor(.cyan)
                                        .cornerRadius(6)
                                }

                                Text("IB hỗ trợ trực tiếp 24/7")
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)

                                // Video button
                                HStack {
                                    Image(systemName: "play.circle.fill")
                                        .foregroundColor(.red)
                                        .font(.system(size: 24))
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Xem Video Hướng Dẫn")
                                            .font(.system(size: 14, weight: .medium))
                                            .foregroundColor(.white)
                                        Text("Hướng dẫn cài đặt & bật Proxy chi tiết")
                                            .font(.system(size: 11))
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Text("XEM NGAY")
                                        .font(.system(size: 12, weight: .bold))
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(8)
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color(white: 0.1)))

                                // 4 proxy cards
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                                    ProxyCard(title: "Proxy Body", subtitle: "Full Đỏ Xoá Máu Vàng", icon: "figure.stand", isOn: $proxyBody)
                                    ProxyCard(title: "Proxy Cổ V1", subtitle: "Aim Cổ Ít Lộ Hơn", icon: "scope", isOn: $proxyCoV1)
                                    ProxyCard(title: "Proxy Cổ V2", subtitle: "Vùng Cổ Máu Đỏ To Hơn, Bám Hơn", icon: "target", isOn: $proxyCoV2)
                                    ProxyCard(title: "Proxy Magic", subtitle: "Đạn Ma Thuật", icon: "sparkles", isOn: $proxyMagic)
                                }
                            }
                            .padding(.horizontal)
                        } else if selectedTab == 1 {
                            PlaceholderTab(title: "Định Vị")
                        } else if selectedTab == 2 {
                            PlaceholderTab(title: "Mod NV")
                        } else {
                            PlaceholderTab(title: "ESP")
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}

struct TabButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 18))
                Text(title)
                    .font(.system(size: 11, weight: .medium))
            }
            .foregroundColor(isSelected ? .cyan : .gray)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(isSelected ? Color.cyan.opacity(0.15) : Color.clear)
            .cornerRadius(10)
        }
    }
}

struct ProxyCard: View {
    let title: String
    let subtitle: String
    let icon: String
    @Binding var isOn: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.cyan)
                Spacer()
                Circle()
                    .fill(isOn ? Color.green : Color.gray.opacity(0.4))
                    .frame(width: 10, height: 10)
            }
            Text(title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
            Text(subtitle)
                .font(.system(size: 11))
                .foregroundColor(.gray)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color(white: 0.12)))
        .onTapGesture { isOn.toggle() }
    }
}

struct PlaceholderTab: View {
    let title: String
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "wrench.and.screwdriver")
                .font(.system(size: 40))
                .foregroundColor(.gray)
            Text("\(title) — đang phát triển")
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 60)
    }
}

#Preview {
    ContentView()
}
