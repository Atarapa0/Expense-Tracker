# 💰 Expense Tracker - Gelir Gider Takip Uygulaması

Flutter ile geliştirilmiş modern ve kullanıcı dostu bir gelir-gider takip uygulaması. Bu uygulama, kişisel finans yönetiminizi kolaylaştırmak ve harcamalarınızı düzenli olarak takip etmek için tasarlanmıştır.

## 📱 Özellikler

### Ana Özellikler
- **💳 Gelir/Gider Takibi**: Detaylı gelir ve gider kayıtları
- **📊 Anlık Bakiye Görüntüleme**: Güncel bakiye, toplam gelir ve gider bilgileri
- **📅 Tarih Seçimi**: İşlemler için özelleştirilebilir tarih seçimi
- **🏷️ Kategori Sistemi**: 8 farklı kategori ile organize işlemler
- **💱 Türk Lirası Desteği**: TL sembolü ile yerel para birimi kullanımı

### Kategoriler
- 💰 **Maaş** (Salary)
- 👨‍💻 **Freelance** (Freelancer)
- 🍔 **Yiyecek** (Food)
- 🚗 **Ulaşım** (Transportation)
- 🛍️ **Alışveriş** (Shopping)
- 🎬 **Eğlence** (Entertainment)
- 📺 **Abonelikler** (Subscriptions)
- 📂 **Diğer** (Other)

## 🛠️ Teknoloji Stack

- **Frontend**: Flutter (Dart)
- **State Management**: Provider Pattern
- **Platform**: Android & iOS
- **Minimum SDK**: Flutter 3.8.0+

## 📁 Proje Yapısı

```
lib/
├── main.dart                    # Ana uygulama giriş noktası
├── models/
│   └── transaction_model.dart   # İşlem veri modeli
├── pages/
│   ├── home_page.dart          # Ana sayfa - bakiye ve işlem listesi
│   └── add_transaction_page.dart # İşlem ekleme sayfası
├── providers/
│   └── transaction_provider.dart # State management
└── widgets/
    ├── balance_card.dart       # Bakiye kartı widget'ı
    └── transaction_tile.dart   # İşlem listesi item'ı
```

## 🚀 Kurulum ve Çalıştırma

### Gereksinimler
- Flutter SDK (3.8.0 veya üzeri)
- Dart SDK
- Android Studio / VS Code
- Android/iOS Emulator veya fiziksel cihaz

### Kurulum Adımları

1. **Projeyi klonlayın**
   ```bash
   git clone https://github.com/Atarapa0/Expense-Tracker.git
   cd expense_tracker
   ```

2. **Bağımlılıkları yükleyin**
   ```bash
   flutter pub get
   ```

3. **Uygulamayı çalıştırın**
   ```bash
   flutter run
   ```

### Debug Modunda Çalıştırma
```bash
flutter run --debug
```

### Release APK Oluşturma
```bash
flutter build apk --release
```

## 📦 Kullanılan Paketler

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.5+1      # State management
  cupertino_icons: ^1.0.8  # iOS stil ikonlar

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0    # Kod kalitesi kontrolleri
```

## 💡 Kullanım

### Ana Sayfa
- Güncel bakiyenizi, toplam gelirinizi ve giderinizi görüntüleyin
- Son işlemlerinizi kategorileriyle birlikte listeleyin
- "Income Add" veya "Expense Add" butonları ile yeni işlem ekleyin

### İşlem Ekleme
1. Tutar girin (sadece sayı)
2. Açıklama ekleyin
3. Tarih seçin
4. İşlem tipini seçin (Gelir/Gider)
5. Kategori seçin
6. "Save Transactions" ile kaydedin

## 🎨 UI/UX Özellikleri

- **Modern Design**: Material Design prensiplerine uygun arayüz
- **Responsive Layout**: Farklı ekran boyutlarına uyumlu
- **Intuitive Navigation**: Kullanıcı dostu navigasyon
- **Color Coding**: Gelir (yeşil) ve gider (kırmızı) renk kodlaması
- **Turkish Localization**: Türkçe arayüz desteği

## 🔧 Geliştirme

### Yeni Özellik Ekleme
1. Fork yapın
2. Feature branch oluşturun (`git checkout -b feature/yeni-ozellik`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin feature/yeni-ozellik`)
5. Pull Request oluşturun

### Code Style
- Dart/Flutter resmi style guide'ını takip edin
- `flutter analyze` ile kod analizi yapın
- `flutter test` ile testleri çalıştırın

## 📄 Lisans

Bu proje MIT lisansı altında dağıtılmaktadır. Detaylar için [LICENSE](LICENSE) dosyasına bakın.

## 👨‍💻 Geliştirici

**Furkan Erdoğan**
- GitHub: [@Atarapa0](https://github.com/Atarapa0)

## 🤝 Katkıda Bulunma

Katkılarınızı memnuniyetle karşılıyoruz! Lütfen katkıda bulunmadan önce [CONTRIBUTING.md](CONTRIBUTING.md) dosyasını okuyun.

## 📞 İletişim

Herhangi bir sorunuz veya öneriniz varsa, lütfen GitHub Issues üzerinden iletişime geçin.

---

**⚡ Flutter ile geliştirilmiştir**
