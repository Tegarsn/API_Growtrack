import express from 'express';
import db from '../db.js';
import bcrypt from 'bcryptjs';

const router = express.Router();

// Create petugas
router.post('/', async (req, res) => {
  const { nik_petugas, nama, password, status } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  try {
    const [result] = await db.execute(
      `INSERT INTO petugas (nik_petugas, nama, password, status, created_at, updated_at)
       VALUES (?, ?, ?, ?, NOW(), NOW())`,
      [nik_petugas, nama, hashedPassword, status]
    );
    res.status(201).json({ message: 'Petugas created', id: result.insertId });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Read all petugas
router.get('/', async (req, res) => {
  try {
    const [rows] = await db.execute('SELECT id_petugas, nik_petugas, nama,password, status, created_at, updated_at FROM petugas');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Read single petugas
router.get('/:id_petugas', async (req, res) => {
  try {
    const [rows] = await db.execute('SELECT id_petugas, nik_petugas, nama, status, created_at, updated_at FROM petugas WHERE id_petugas = ?', [req.params.id_petugas]);
    if (rows.length === 0) return res.status(404).json({ message: 'Petugas not found' });
    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Update petugas
router.put('/:id_petugas', async (req, res) => {
  const { nik_petugas, nama, password, status } = req.body;
  try {
    let query = 'UPDATE petugas SET nik_petugas = ?, nama = ?, status = ?, updated_at = NOW()';
    let params = [nik_petugas, nama, status];

    if (password) {
      const hashedPassword = await bcrypt.hash(password, 10);
      query += ', password = ?';
      params.push(hashedPassword);
    }

    query += ' WHERE id_petugas = ?';
    params.push(req.params.id_petugas);

    const [result] = await db.execute(query, params);

    if (result.affectedRows === 0) return res.status(404).json({ message: 'Petugas not found' });
    res.json({ message: 'Petugas updated' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// Delete petugas
router.delete('/:id_petugas', async (req, res) => {
  try {
    const [result] = await db.execute('DELETE FROM petugas WHERE id_petugas = ?', [req.params.id_petugas]);
    if (result.affectedRows === 0) return res.status(404).json({ message: 'Petugas not found' });
    res.json({ message: 'Petugas deleted' });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

export default router;
