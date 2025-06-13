import express from "express";
import pool from "../db.js";
import bcrypt from "bcryptjs";
import { authenticateJWT } from '../middleware/auth.js';

const router = express.Router();

// router.get('/me', authenticateJWT, async (req, res) => {
//   if (req.user.role !== 'ibu') return res.status(403).json({ message: 'Akses ditolak' });

//   try {
//     const [rows] = await pool.query('SELECT * FROM ibu WHERE id_ibu = ?', [req.user.id]);
//     if (rows.length === 0) return res.status(404).json({ message: 'Data ibu tidak ditemukan' });
//     res.json(rows[0]);
//   } catch (err) {
//     res.status(500).json({ error: err.message });
//   }
// });


// router.get('/my-data', authenticateJWT, async (req, res) => {
//   if (req.user.role !== 'ibu') {
//     return res.status(403).json({ message: 'Akses ditolak' });
//   }

//   try {
//     // Ambil data ibu berdasarkan id dari token
//     const [ibuRows] = await pool.query('SELECT * FROM ibu WHERE id_ibu = ?', [req.user.id]);
//     if (ibuRows.length === 0) return res.status(404).json({ message: 'Data ibu tidak ditemukan' });

//     const ibu = ibuRows[0];

//     // Ambil layanan_ibu berdasarkan nik_ibu (karena relasi menggunakan nik_ibu)
//     const [layananRows] = await pool.query(
//       `SELECT * FROM layanan_ibu WHERE nik_ibu = ?`,
//       [ibu.nik_ibu]
//     );

//     res.json({
//       ibu,
//       layanan_ibu: layananRows
//     });
//   } catch (error) {
//     res.status(500).json({ error: error.message });
//   }
// });



// Get all ibu
router.get("/", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT id_ibu, nik_ibu, nama, password, tempat_lahir, tanggal_lahir, tinggi_badan, berat_badan, alamat, created_at, updated_at FROM ibu");
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Get ibu by id
router.get("/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const [rows] = await pool.query("SELECT id_ibu, nik_ibu, nama, tempat_lahir, tanggal_lahir, tinggi_badan, berat_badan, alamat, created_at, updated_at FROM ibu WHERE id_ibu = ?", [id]);
    if (rows.length === 0) return res.status(404).json({ message: "Ibu not found" });
    res.json(rows[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Create new ibu
router.post("/", async (req, res) => {
  try {
    const { nik_ibu, nama, password, tempat_lahir, tanggal_lahir, tinggi_badan, berat_badan, alamat } = req.body;

    if (!nik_ibu || !nama || !password) {
      return res.status(400).json({ message: "nik_ibu, nama, and password are required" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);
    const [result] = await pool.query(
      `INSERT INTO ibu (nik_ibu, nama, password, tempat_lahir, tanggal_lahir, tinggi_badan, berat_badan, alamat, created_at, updated_at) 
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
      [nik_ibu, nama, hashedPassword, tempat_lahir || null, tanggal_lahir || null, tinggi_badan || null, berat_badan || null, alamat || null]
    );

    res.status(201).json({ message: "Ibu created", id_ibu: result.insertId });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Update ibu by id
router.put("/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const { nik_ibu, nama, password, tempat_lahir, tanggal_lahir, tinggi_badan, berat_badan, alamat } = req.body;

    // Cek dulu apakah record ada
    const [rows] = await pool.query("SELECT * FROM ibu WHERE id_ibu = ?", [id]);
    if (rows.length === 0) return res.status(404).json({ message: "Ibu not found" });

    let hashedPassword = rows[0].password;
    if (password) {
      hashedPassword = await bcrypt.hash(password, 10);
    }

    await pool.query(
      `UPDATE ibu SET nik_ibu=?, nama=?, password=?, tempat_lahir=?, tanggal_lahir=?, tinggi_badan=?, berat_badan=?, alamat=?, updated_at=NOW() WHERE id_ibu=?`,
      [nik_ibu || rows[0].nik_ibu,
       nama || rows[0].nama, 
       hashedPassword,
       tempat_lahir || rows[0].tempat_lahir,
       tanggal_lahir || rows[0].tanggal_lahir,
       tinggi_badan || rows[0].tinggi_badan,
       berat_badan || rows[0].berat_badan,
       alamat || rows[0].alamat,
       id]
    );

    res.json({ message: "Ibu updated" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Delete ibu by id
router.delete("/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const [result] = await pool.query("DELETE FROM ibu WHERE id_ibu = ?", [id]);
    if (result.affectedRows === 0) return res.status(404).json({ message: "Ibu not found" });
    res.json({ message: "Ibu deleted" });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

export default router;
