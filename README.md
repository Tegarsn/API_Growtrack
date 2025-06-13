# 🌱 API_Growtrack

API backend untuk aplikasi Growtrack yang dibangun menggunakan **Node.js**. API ini dapat dijalankan secara lokal dan diakses publik melalui **Ngrok**.

---

## 🚀 Fitur

- Autentikasi menggunakan token (opsional)
- Routing modular (folder `routes/`)
- Middleware untuk logging atau keamanan
- Menggunakan file `.env` untuk konfigurasi
- Terhubung dengan database lokal (lihat file `db.js`)
- Ekspor database tersedia: `growtrack_db (1).sql`

---

## 📁 Struktur Folder

.
├── middleware/ # Middleware custom
├── routes/ # Semua endpoint API
├── db.js # Koneksi database
├── index.js # Entry point utama server
├── .env # Variabel environment
├── package.json # Konfigurasi proyek Node.js
├── growtrack_db (1).sql # File backup database
└── README.md # Dokumentasi

yaml
Salin
Edit

---

## 🔧 Instalasi

1. Clone repo ini:
   ```bash
   git clone https://github.com/Tegarsn/API_Growtrack.git
   cd API_Growtrack
Install dependencies:

bash
Salin
Edit
npm install
Buat file .env dan isi sesuai konfigurasi database atau port, contoh:

env
Salin
Edit
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=growtrack_db
Jalankan API:

bash
Salin
Edit
node index.js
🌐 Menjalankan Secara Publik dengan Ngrok
Agar API bisa diakses publik (untuk frontend, testing, dll):

Install Ngrok:

bash
Salin
Edit
npm install -g ngrok
Jalankan server kamu, misalnya di port 3000

Buka terminal baru dan jalankan:

bash
Salin
Edit
ngrok http 3000
Kamu akan mendapat URL publik seperti:

arduino
Salin
Edit
https://abc123.ngrok.io
