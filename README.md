# Proyek Pertama: Menyelesaikan Permasalahan Human Resource Perusahaan Jaya Jaya Maju

> ⚠️ Peringatan 
> 
> Skenario dalam proyek ini hanyalah fiktif belaka. Apabila terdapat kesamaan nama tokoh, perusahaan, ataupun produk, itu adalah kebetulan semata dan tidak ada unsur kesengajaan.
## Business Understanding
Jaya Jaya Maju merupakan salah satu perusahaan multinasional yang telah berdiri sejak tahun 2000. Ia memiliki lebih dari 1000 karyawan yang tersebar di seluruh penjuru negeri. 

### Permasalahan Bisnis

Perusahaan Jaya Jaya Maju memiliki masalah dalam mengelola karyawan terutama tingginya *attrition rate* (rasio jumlah karyawan yang keluar dengan total karyawan keseluruhan) hingga lebih dari 10%

### Cakupan Proyek

Proyek ini berupaya mengidentifikasi beberapa faktor yang dapat menyebabkan tingginya *attrition rate* yang terjadi di perusahaan Jaya Jaya Maju seperti perbandingan antara *attrition rate* terhadap umur, *job involvement*, gaji bulanan, travel, jarak rumah, bidang studi, dll.
Proyek ini juga membuat model machine learning untuk memprediksi kemungkinan karyawan meninggalkan perusahaan

### Persiapan

Sumber data: [Dataset Jaya Jaya Maju](https://github.com/dicodingacademy/dicoding_dataset/tree/main/employee)

Setup environment:

**Clone repo**
```bash
# clone this repo 
git clone https://github.com/agungfir98/ds-mahir-submission-pertama.git dicoding-hr-problem-submission
cd dicoding-hr-problem-submission
```
**Setup virtual Environtment (opsional)**
```bash
python -m venv ./venv
```

### setup
**manual setup**
```bash
cp example.env .env
pip install -r requirements.txt
docker-compose up -d
```
**atau dengan menjalankan script berikut**
mengotomasi proses setup hingga mengimport metabase instance
> note disarankan untuk menyesuaikan example.env sesuai kebutuhan
```bash
# run setup.sh to setup postgresql and matebase with docker compose
./setup.sh
# this script copy example env, fetch dataset for submission, and start a docker compose
```
> note:
> setelah menjalankan `setup.sh` mungkin masih perlu untuk mengganti host name menjadi localhost pada metabase dikarenakan perbedaan konfigurasi network (saya menginstall docker didalam WSL (windows subsystem fo linux) yang memiliki konfigrasi network berbeda sehingga tidak dapat menggunakan localhost serperti biasanya)

## Business Dashboard

Dashboard mencakup segala faktor yang mungkin dapat berkaitan dengan besarnya attrition rate seperti umur, gaji, role, jarak rumah, tingkat kepuasan, lembur, keterlibatan pekerja, seberapa sering pekerja melakukan perjalanan dinas, dll.
hampir semua elemen yang digunakan berupa bar chart untuk menunjukan perbandingan tiap variabel tersebut dengan attrition rate.

## Conclusion

Banyak hal mempengaruhi attrition rate yang dimiliki perusahaan. Tingkat kepuasaan pekerja, begitu pula dengan *job involvement* pekerja mempengaruhi tingginya attrition rate. Begitu juga dengan gaji bulanan, jarak rumah pekerja, lembur, dan seberapa sering pekerja harus melakukan perjalanan dinas.

### Rekomendasi Action Items (Optional)

Berikan beberapa rekomendasi action items yang harus dilakukan perusahaan guna menyelesaikan permasalahan atau mencapai target mereka.

- Mengevaluasi lingkungan kerja dengan membuat survei tentang apa saja yang dapat di tingkatkan terkait kepuasan pekerja
- Menangani rendahnya *job involvement* yang dirasakan pekerja
- Mengevaluasi apakah upah layak pada pekerja
- Memikirkan untuk merekrut pekerja dengan jarak yang dekat dengan kantor
- Evaluasi lembur
- Mengevaluasi kegiatan perjalanan dinas
