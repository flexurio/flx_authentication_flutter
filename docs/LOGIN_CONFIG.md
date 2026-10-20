# Login Dynamic Configuration — Dokumentasi

Sistem login Flexurio ERP mendukung konfigurasi tampilan secara dinamis melalui file JSON per perusahaan. Tidak perlu mengubah kode Dart — cukup edit file JSON untuk mengubah tata letak, gambar, warna, dan teks.

---

## Cara Kerja

File config diload berdasarkan `companyId` dari flavor:

```dart
configAssetPath: 'asset/configuration-login/login_config_${config.companyId}.json'
```

Contoh: perusahaan dengan `companyId = 01` → `asset/configuration-login/login_config_01.json`

> [!NOTE]
> Jika file tidak ditemukan atau field tidak disertakan, sistem akan menggunakan nilai **default** secara otomatis.

---

## Struktur JSON Lengkap

```json
{
  "layout": "split_right_form",
  "leftFlex": 7,
  "rightFlex": 4,
  "background": { ... },
  "leftPanel": { ... },
  "rightPanel": { ... }
}
```

---

## Root Fields

| Field | Tipe | Default | Keterangan |
|---|---|---|---|
| `layout` | `string` | `"split_right_form"` | Layout halaman login |
| `leftFlex` | `int` | `8` | Proporsi lebar panel kiri |
| `rightFlex` | `int` | `3` | Proporsi lebar panel kanan |

### Flex Ratio — Panduan Proporsi

`leftFlex` dan `rightFlex` menentukan rasio lebar antara panel kiri dan kanan:

| leftFlex | rightFlex | Proporsi | Cocok untuk |
|---|---|---|---|
| 5 | 5 | 50/50 | Tampilan seimbang |
| 6 | 5 | ~55/45 | Text mode standar |
| 7 | 4 | ~64/36 | Gambar medium |
| 8 | 3 | ~73/27 | Gambar dominan |
| 9 | 3 | ~75/25 | Full image showcase |

---

## Background

```json
"background": {
  "type": "gradient",
  "gradient": {
    "colors": ["#1E40AF", "#2563EB", "#3B82F6"]
  },
  "pattern": "dots"
}
```

| Field | Tipe | Default | Keterangan |
|---|---|---|---|
| `type` | `string` | `"gradient"` | Tipe background: `"gradient"`, `"color"`, `"image"` |
| `gradient.colors` | `string[]` | - | Array warna hex untuk gradient (min 2 warna) |
| `pattern` | `string` | - | Pola overlay: `"dots"` atau kosongkan |

---

## Left Panel

Left panel mendukung **3 mode tampilan** yang dikontrol via field `mode`.

### Mode: `"text"` (Default)

Menampilkan teks, deskripsi, dan daftar fitur di panel kiri.

```json
"leftPanel": {
  "mode": "text",
  "tag": "ENTERPRISE RESOURCE PLANNING",
  "title": "Flexurio ERP",
  "description": "Kelola seluruh operasional bisnis dalam satu platform terintegrasi.",
  "features": [
    {
      "icon": "analytics",
      "title": "Business Intelligence",
      "description": "Laporan real-time dan dashboard analitik"
    },
    {
      "icon": "task",
      "title": "Manajemen Operasional",
      "description": "Otomasi alur kerja pembelian dan produksi"
    },
    {
      "icon": "shield",
      "title": "Kontrol & Kepatuhan",
      "description": "Audit trail dan kontrol akses berbasis peran"
    }
  ],
  "copyright": "© 2026 PT Metiska Farma. All rights reserved."
}
```

| Field | Tipe | Default | Keterangan |
|---|---|---|---|
| `mode` | `string` | `"text"` | Mode tampilan panel |
| `tag` | `string` | `"COMPLIANCE MANAGEMENT"` | Label pill di atas judul (huruf kapital) |
| `title` | `string` | Nama perusahaan | Judul utama panel kiri |
| `description` | `string` | Teks default | Deskripsi singkat |
| `features` | `array` | 3 item default | Daftar fitur (lihat sub-tabel) |
| `copyright` | `string` | `"© [tahun] [nama]"` | Teks copyright di pojok kiri bawah |

**Feature Item:**

| Field | Tipe | Keterangan |
|---|---|---|
| `icon` | `string` | Nama ikon: `"shield"`, `"task"`, `"analytics"`, `"assignment"`, `"chart"` |
| `title` | `string` | Judul fitur |
| `description` | `string` | Deskripsi singkat fitur |

---

### Mode: `"image"`

Menampilkan gambar yang mengisi penuh panel kiri. Tidak ada teks.

```json
"leftPanel": {
  "mode": "image",
  "imageUrl": "asset/image/login-banner-company-01.png",
  "imageFit": "cover",
  "imageAlignment": "center"
}
```

| Field | Tipe | Default | Keterangan |
|---|---|---|---|
| `mode` | `string` | - | `"image"` |
| `imageUrl` | `string` | - | Path asset lokal atau URL `http(s)://` |
| `imageFit` | `string` | `"contain"` | Cara gambar mengisi area (lihat tabel) |
| `imageAlignment` | `string` | `"center"` | Posisi gambar dalam area |
| `backgroundColor` | `string` | - | Warna heksadesimal latar belakang panel (misal `"#FFFFFF"`) |

---

### Responsivitas Layout & Tampilan Gambar

Sistem login Flexurio menerapkan tata letak responsif adaptif:

1. **Layar < 1024px (Mobile & Tablet / Layar Terbagi):**
   - Otomatis beralih ke layout **Single-Column** vertikal yang dapat di-scroll.
   - Jika mode `image` atau `image_with_text` aktif, gambar akan otomatis tampil sebagai **banner responsif di atas card form login** dengan sudut melengkung dan bayangan halus.
   - Card form login mempertahankan lebar yang proporsional sehingga form input dan tombol (seperti input PIN verifikasi 6 digit) tidak terhimpit.
   - Container card form login selalu ditampilkan **solid/opaque** (menggunakan gradient abu-terang elegan, tidak transparan) sehingga teks dan input tetap terlihat kontras dan tidak tembus ke motif/warna latar belakang layar.
   - Copyright (jika ada) ditampilkan rapi di bagian bawah halaman.

2. **Layar >= 1024px (Desktop):**
   - Tampilan **Split-Screen 2 Kolom** (panel kiri gambar/teks, panel kanan card form).
   - Panel kanan memiliki proteksi batas lebar minimum aman (`minRightPanelWidth`), memastikan card form login tidak gepeng meskipun layar berada pada resolusi menengah (1024px–1300px) atau saat menggunakan rasio flex kiri yang besar.
   - Pada panel kiri, gambar diposisikan proporsional dan tidak terpotong saat menggunakan `imageFit: "contain"`.

---

### Mode: `"image_with_text"`

Menampilkan gambar penuh dengan overlay gradient gelap dan teks (tag + judul) di bagian bawah.

```json
"leftPanel": {
  "mode": "image_with_text",
  "imageUrl": "asset/image/login-banner-company-01.png",
  "imageFit": "contain",
  "imageAlignment": "center",
  "tag": "ENTERPRISE RESOURCE PLANNING",
  "title": "Flexurio ERP"
}
```

> [!TIP]
> Gunakan mode ini ketika perusahaan ingin menampilkan foto/ilustrasi tetapi tetap ingin branding teks terlihat.

---

### Nilai `imageFit`

| Nilai | Keterangan |
|---|---|
| `"contain"` | **(Sangat Direkomendasikan untuk Banner Berisi Teks/Infografis/Visi-Misi)** Gambar proporsional dan seluruh isi gambar terlihat utuh tanpa ada teks yang terpotong. |
| `"cover"` | Gambar mengisi seluruh area panel, bagian tepi mungkin terpotong (cocok untuk foto gedung/lanskap tanpa teks). |
| `"fill"` | Gambar distretch mengisi area (tidak proporsional). |
| `"fitWidth"` | Gambar fit berdasarkan lebar. |
| `"fitHeight"` | Gambar fit berdasarkan tinggi. |
| `"scaleDown"` | Sama seperti contain, tapi tidak diperbesar melebihi ukuran aslinya. |
| `"none"` | Ukuran asli gambar. |

### Nilai `imageAlignment`

| Nilai | Posisi |
|---|---|
| `"center"` | Tengah (default) |
| `"topCenter"` | Atas tengah |
| `"bottomCenter"` | Bawah tengah |
| `"centerLeft"` | Tengah kiri |
| `"centerRight"` | Tengah kanan |
| `"topLeft"` / `"topRight"` | Sudut atas |
| `"bottomLeft"` / `"bottomRight"` | Sudut bawah |

### Ukuran Gambar yang Direkomendasikan

| Mode gambar | Ukuran ideal | Format | Keterangan |
|---|---|---|---|
| `cover` (foto/foto gedung) | 1920 × 1080 px | JPG | Compressed < 500KB |
| `contain` (ilustrasi/infografis) | 800 × 600 px | PNG transparan | |
| Logo besar + tagline | 600 × 400 px | PNG transparan | |

---

## Right Panel

```json
"rightPanel": {
  "logoUrl": "asset/image/logo-company-01.png",
  "logoNamedUrl": "asset/image/logo-name-company-01.png",
  "logoHeight": 45,
  "title": "Welcome back",
  "subtitle": "Please sign in to your account",
  "panelBackgroundGradient": ["#E2E8F0", "#F1F5F9", "#F8FAFC"],
  "cardBackgroundColor": "#FFFFFF",
  "cardBorderRadius": 24,
  "cardMaxWidth": 380
}
```

| Field | Tipe | Default | Keterangan |
|---|---|---|---|
| `logoUrl` | `string` | - | Path asset logo icon perusahaan |
| `logoNamedUrl` | `string` | - | Path asset logo nama perusahaan |
| `logoHeight` | `number` | `50` | Tinggi logo dalam px |
| `title` | `string` | - | Judul di atas form login |
| `subtitle` | `string` | - | Subjudul di bawah judul |
| `panelBackgroundGradient` | `string[]` | - | Array warna hex gradient panel kanan (dari bawah ke atas) |
| `panelBackgroundColor` | `string` | - | Warna solid panel kanan (jika tidak pakai gradient) |
| `cardBackgroundColor` | `string` | `#FFFFFF` | Warna background card form login |
| `cardBackgroundGradient` | `string[]` | - | Gradient background card (opsional) |
| `cardBorderRadius` | `number` | `24` | Sudut melengkung card dalam px |
| `cardMaxWidth` | `number` | `380` | Lebar maksimum card form login dalam px |

---

## Contoh Config Lengkap

### Config Text Mode (`login_config_01.json`)

```json
{
  "layout": "split_right_form",
  "leftFlex": 7,
  "rightFlex": 4,
  "background": {
    "type": "gradient",
    "gradient": {
      "colors": ["#1E40AF", "#2563EB", "#3B82F6"]
    },
    "pattern": "dots"
  },
  "leftPanel": {
    "mode": "text",
    "tag": "ENTERPRISE RESOURCE PLANNING",
    "title": "Flexurio ERP",
    "description": "Kelola seluruh operasional bisnis dalam satu platform terintegrasi.",
    "features": [
      { "icon": "analytics", "title": "Business Intelligence", "description": "..." },
      { "icon": "task",      "title": "Manajemen Operasional", "description": "..." },
      { "icon": "shield",    "title": "Kontrol & Kepatuhan",   "description": "..." }
    ],
    "copyright": "© 2026 PT Metiska Farma. All rights reserved."
  },
  "rightPanel": {
    "logoUrl": "asset/image/logo-company-01.png",
    "logoNamedUrl": "asset/image/logo-name-company-01.png",
    "logoHeight": 45,
    "title": "Welcome back",
    "subtitle": "Please sign in to your account",
    "panelBackgroundGradient": ["#E2E8F0", "#F1F5F9", "#F8FAFC"],
    "cardBackgroundColor": "#FFFFFF",
    "cardBorderRadius": 24,
    "cardMaxWidth": 380
  }
}
```

### Config Image Mode (`login_config_image_01.json`)

```json
{
  "layout": "split_right_form",
  "leftFlex": 7,
  "rightFlex": 4,
  "background": {
    "type": "gradient",
    "gradient": { "colors": ["#1E40AF", "#2563EB", "#3B82F6"] },
    "pattern": "dots"
  },
  "leftPanel": {
    "mode": "image",
    "imageUrl": "asset/image/login-banner-company-01.jpg",
    "imageFit": "cover",
    "imageAlignment": "center"
  },
  "rightPanel": {
    "logoUrl": "asset/image/logo-company-01.png",
    "logoNamedUrl": "asset/image/logo-name-company-01.png",
    "logoHeight": 45,
    "title": "Welcome back",
    "subtitle": "Please sign in to your account",
    "panelBackgroundGradient": ["#E2E8F0", "#F1F5F9", "#F8FAFC"],
    "cardBackgroundColor": "#FFFFFF",
    "cardBorderRadius": 24,
    "cardMaxWidth": 380
  }
}
```

---

## Onboarding Perusahaan Baru

Untuk menambahkan config perusahaan baru (misal `companyId = 05`):

1. **Buat file config:** `asset/configuration/login_config_05.json`
2. **Siapkan asset:**
   - `asset/image/logo-company-05.png` — logo icon
   - `asset/image/logo-name-company-05.png` — logo nama
   - *(opsional)* `asset/image/login-banner-company-05.jpg` — gambar panel kiri
3. **Daftarkan ke `pubspec.yaml`** jika format file baru (sudah terdaftar untuk folder `asset/image/` dan `asset/configuration/`)
4. **Sesuaikan flavor** dengan `companyId = "05"`

> [!IMPORTANT]
> File config adalah **asset statis** yang di-bundle saat build. Setiap perubahan config memerlukan **rebuild aplikasi**.
