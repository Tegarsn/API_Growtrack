import express, { Router } from 'express';
import pool from '../db.js';
import bcrypt from 'bcryptjs';
import { authenticateJWT } from '../middleware/auth.js';
const router = express.Router();


router.get('/my-layanan', authenticateJWT, async (req, res) => {
  if (req.user.role !== 'ibu') {
    return res.status(403).json({ message: 'Akses ditolak' });
  }

  try {
    // Ambil nama ibu dari tabel ibu
    const [ibuRows] = await pool.query('SELECT nama FROM ibu WHERE id_ibu = ?', [req.user.id]);
    if (ibuRows.length === 0) return res.status(404).json({ message: 'Data ibu tidak ditemukan' });

    const namaIbu = ibuRows[0].nama;

    // Ambil semua nik_anak yang nama_ortu == nama ibu
    const [anakRows] = await pool.query('SELECT nik_anak FROM anak WHERE nama_ortu = ?', [namaIbu]);
    const nikList = anakRows.map(row => row.nik_anak);

    if (nikList.length === 0) {
      return res.json([]); // ibu belum punya anak
    }

    // Query layanan_anak yang nik_anaknya termasuk dalam list
    const [layananRows] = await pool.query(
      `SELECT layanan_anak.*, anak.nama AS nama_anak
       FROM layanan_anak
       JOIN anak ON layanan_anak.nik_anak = anak.nik_anak
       WHERE layanan_anak.nik_anak IN (?)`,
      [nikList]
    );

    res.json(layananRows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get All layanan_ibu with nama ibu
router.get('/', async (req, res) => {
    try {
        const [rows] = await pool.query(`
        SELECT 
            layanan_ibu.id_layananibu,
            layanan_ibu.nik_ibu,
            ibu.nama AS nama_ibu,
            layanan_ibu.lingkar_lengan,
            layanan_ibu.saran_bidan,
            layanan_ibu.tanggal_cekup,
            layanan_ibu.umur_kehamilan,
            layanan_ibu.denyutjantung_janin,
            layanan_ibu.cek_darah,
            layanan_ibu.berat_badan,
            layanan_ibu.created_at,
            layanan_ibu.updated_at
            FROM layanan_ibu
            JOIN ibu ON layanan_ibu.nik_ibu = ibu.nik_ibu
        `);
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get layanan_ibu by id
router.get('/:id', async (req, res) => {
  try {
    const id = req.params.id;
    const [rows] = await pool.query(
      `SELECT layanan_ibu.*, ibu.nama 
       FROM layanan_ibu 
       JOIN ibu ON layanan_ibu.nik_ibu = ibu.nik_ibu 
       WHERE layanan_ibu.id_layananibu = ?`, 
       [id]
    );

    if (rows.length === 0) {
      return res.status(404).json({ message: 'Layanan Ibu not found' });
    }

    res.json(rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// POST - Tambah layanan_ibu
router.post('/', async (req, res) => {
    try {
        const {
        nik_ibu,
        lingkar_lengan,
        saran_bidan,
        tanggal_cekup,
        umur_kehamilan,
        denyutjantung_janin,
        cek_darah,
        berat_badan
    } = req.body;

    const [result] = await pool.query(
      `INSERT INTO layanan_ibu 
      (nik_ibu, lingkar_lengan, saran_bidan, tanggal_cekup, umur_kehamilan, denyutjantung_janin, cek_darah, berat_badan, created_at, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [nik_ibu, lingkar_lengan, saran_bidan, tanggal_cekup, umur_kehamilan, denyutjantung_janin, cek_darah, berat_badan]
    );

    res.status(201).json({ message: 'Layanan Ibu created', id_layananibu: result.insertId });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// PUT - Update layanan_ibu berdasarkan ID
router.put('/:id', async (req, res) => {
  try {
    const id = req.params.id;
    const {
      nik_ibu,
      lingkar_lengan,
      saran_bidan,
      tanggal_cekup,
      umur_kehamilan,
      denyutjantung_janin,
      cek_darah,
      berat_badan
    } = req.body;

    const [result] = await pool.query(
      `UPDATE layanan_ibu SET 
        nik_ibu = ?, 
        lingkar_lengan = ?, 
        saran_bidan = ?, 
        tanggal_cekup = ?, 
        umur_kehamilan = ?, 
        denyutjantung_janin = ?, 
        cek_darah = ?, 
        berat_badan = ?, 
        updated_at = NOW()
      WHERE id_layananibu = ?`,
      [nik_ibu, lingkar_lengan, saran_bidan, tanggal_cekup, umur_kehamilan, denyutjantung_janin, cek_darah, berat_badan, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Layanan Ibu not found' });
    }

    res.json({ message: 'Layanan Ibu updated' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// DELETE - Hapus layanan_ibu berdasarkan ID
router.delete('/:id', async (req, res) => {
  try {
    const id = req.params.id;

    const [result] = await pool.query(
      `DELETE FROM layanan_ibu WHERE id_layananibu = ?`,
      [id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Layanan Ibu not found' });
    }

    res.json({ message: 'Layanan Ibu deleted' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


export default router;