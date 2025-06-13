import express from 'express';
import db from '../db.js';
import { authenticateJWT } from '../middleware/auth.js'; // pastikan path-nya benar
import pool from '../db.js'; // atau './db.js' tergantung struktur folder kamu

const router = express.Router();

// routes/anak.js
router.get('/my-anak', authenticateJWT, async (req, res) => {
  if (req.user.role !== 'ibu') return res.status(403).json({ message: 'Akses ditolak' });

  try {
    // Ambil nama ibu dari ID
    const [ibu] = await pool.query('SELECT nama FROM ibu WHERE id_ibu = ?', [req.user.id]);
    if (ibu.length === 0) return res.status(404).json({ message: 'Ibu tidak ditemukan' });

    const nama_ibu = ibu[0].nama;

    const [rows] = await pool.query('SELECT * FROM anak WHERE nama_ortu = ?', [nama_ibu]);
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// routes/layanan_anak.js
router.get('/my-layanan', authenticateJWT, async (req, res) => {
  if (req.user.role !== 'ibu') return res.status(403).json({ message: 'Akses ditolak' });

  try {
    // Ambil nama ibu
    const [ibu] = await pool.query('SELECT nama FROM ibu WHERE id_ibu = ?', [req.user.id]);
    if (ibu.length === 0) return res.status(404).json({ message: 'Ibu tidak ditemukan' });

    const nama_ibu = ibu[0].nama;

    const [rows] = await pool.query(`
      SELECT layanan_anak.*, anak.nama AS nama_anak
      FROM layanan_anak
      JOIN anak ON layanan_anak.nik_anak = anak.nik_anak
      WHERE anak.nama_ortu = ?
    `, [nama_ibu]);

    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});





// 🔍 GET all anak
router.get('/', async (req, res) => {
  try {
    const [rows] = await db.execute('SELECT * FROM anak');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// 🔍 GET anak by ID
router.get('/:id_anak', async (req, res) => {
  try {
    const [rows] = await db.execute('SELECT * FROM anak WHERE id_anak = ?', [req.params.id_anak]);
    if (rows.length === 0) return res.status(404).json({ message: 'Anak not found' });
    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// ➕ POST create anak
router.post('/', async (req, res) => {
  const {
    nik_anak,
    nama,
    tempat_lahir,
    tanggal_lahir,
    jenis_kelamin,
    berat_badan,
    tinggi_badan,
    alamat,
    nama_ortu,
    status
  } = req.body;

  try {
    const [result] = await db.execute(
      `INSERT INTO anak (nik_anak, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, berat_badan, tinggi_badan, alamat, nama_ortu, status, created_at, updated_at)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [nik_anak, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, berat_badan, tinggi_badan, alamat, nama_ortu, status]
    );

    res.status(201).json({ message: 'Anak created', id_anak: result.insertId });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// ✏️ PUT update anak
router.put('/:id_anak', async (req, res) => {
  const {
    nik_anak,
    nama,
    tempat_lahir,
    tanggal_lahir,
    jenis_kelamin,
    berat_badan,
    tinggi_badan,
    alamat,
    nama_ortu,
    status
  } = req.body;

  try {
    const [existing] = await db.execute('SELECT * FROM anak WHERE id_anak = ?', [req.params.id_anak]);
    if (existing.length === 0) return res.status(404).json({ message: 'Anak not found' });

    await db.execute(
      `UPDATE anak SET nik_anak = ?, nama = ?, tempat_lahir = ?, tanggal_lahir = ?, jenis_kelamin = ?, berat_badan = ?, tinggi_badan = ?, alamat = ?, nama_ortu = ?, status = ?, updated_at = NOW() WHERE id_anak = ?`,
      [nik_anak, nama, tempat_lahir, tanggal_lahir, jenis_kelamin, berat_badan, tinggi_badan, alamat, nama_ortu, status, req.params.id_anak]
    );

    res.json({ message: 'Anak updated' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// ❌ DELETE anak
router.delete('/:id_anak', async (req, res) => {
  try {
    const [result] = await db.execute('DELETE FROM anak WHERE id_anak = ?', [req.params.id_anak]);
    if (result.affectedRows === 0) return res.status(404).json({ message: 'Anak not found' });
    res.json({ message: 'Anak deleted' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

export default router;
