import SwiftUI

enum Fonts {
    case light
    case news
    case bold
    case extraBold
    
    static let CodecProLight = "CodecPro-Light"
    static let CodecProNews = "CodecPro-News"
    static let CodecProBold = "CodecPro-Bold"
    static let CodecProExtraBold = "CodecPro-ExtraBold"
    
    func getfont(size: Int) -> Font {
        switch self {
        case .light: Font.custom(Fonts.CodecProLight, size: size.adaptive)
        case .news: Font.custom(Fonts.CodecProNews, size: size.adaptive)
        case .bold: Font.custom(Fonts.CodecProBold, size: size.adaptive)
        case .extraBold: Font.custom(Fonts.CodecProExtraBold, size: size.adaptive)
        }
    }
}

extension View {
  @ViewBuilder func setFont(_ font: Fonts, size: Int) -> some View {
    self.font(font.getfont(size: size))
  }
}
