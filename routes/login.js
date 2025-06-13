// routes/login.js
import express from 'express';
import pool from '../db.js';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';

dotenv.config();
const router = express.Router();

router.post('/', async (req, res) => {
  const { nik, password } = req.body;

  try {
    // Cek di petugas
    const [petugasRows] = await pool.query('SELECT * FROM petugas WHERE nik_petugas = ?', [nik]);
    if (petugasRows.length > 0) {
      const petugas = petugasRows[0];
      const match = await bcrypt.compare(password, petugas.password);
      if (match) {
        const token = jwt.sign(
          { id: petugas.id_petugas, role: 'petugas' },
          process.env.JWT_SECRET,
          { expiresIn: process.env.JWT_EXPIRES_IN }
        );
        return res.json({ message: 'Login berhasil', token, role: 'petugas' });
      }
      return res.status(401).json({ message: 'Password salah' });
    }

    // Cek di ibu
    const [ibuRows] = await pool.query('SELECT * FROM ibu WHERE nik_ibu = ?', [nik]);
    if (ibuRows.length > 0) {
      const ibu = ibuRows[0];
      const match = await bcrypt.compare(password, ibu.password);
      if (match) {
        const token = jwt.sign(
          { id: ibu.id_ibu, role: 'ibu' },
          process.env.JWT_SECRET,
          { expiresIn: process.env.JWT_EXPIRES_IN }
        );
        return res.json({ message: 'Login berhasil', token, role: 'ibu' });
      }
      return res.status(401).json({ message: 'Password salah' });
    }

    return res.status(404).json({ message: 'Akun tidak ditemukan' });

  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

export default router;
