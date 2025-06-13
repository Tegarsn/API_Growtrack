import express, {Router} from 'express';
import pool from '../db.js';

const router = express.Router();

// Get All layanan_anak with nama anak boyyy
router.get('/', async (req, res) => {
    try {
        const [rows] = await pool.query(`
            SELECT
            layanan_anak.id_layanananak,
            layanan_anak.nik_anak,
            anak.nama AS nama_anak,
            layanan_anak.pemberian_pmt,
            layanan_anak.tanggal_cekup,
            layanan_anak.hasil_posyandu,
            layanan_anak.imunisasi,
            layanan_anak.lingkar_kepala,
            layanan_anak.berat_badan,
            layanan_anak.tinggi_badan,
            layanan_anak.pemberian_vitamin,
            layanan_anak.gizi_rutin,
            layanan_anak.created_at,
            layanan_anak.updated_at
            FROM layanan_anak
            JOIN anak ON layanan_anak.nik_anak = anak.nik_anak
            `);
        res.json(rows);
    }   catch (error) {
        res.status(500).json({ error: error.message});
    }
});

router.get('/:id',async (req, res) => {
    try {
        const id = req.params.id;
        const [rows] = await pool.query(
            `SELECT layanan_anak.*, anak.nama
            FROM layanan_anak
            JOIN anak ON layanan_anak.nik_anak = anak.nik_anak
            WHERE layanan_anak.id_layanananak = ?
            `,
            [id]
        );
        if (rows.length === 0) {
            return res.status(404).json({ message: 'layanan anak tidak adaaaa'});
        }
        res.json(rows[0]);
    } catch (error) {
        res.status(500).json({ error: error.message});
    }
});


router.post('/', async (req, res) => {
    try{
        const{
            nik_anak,
            pemberian_pmt,
            tanggal_cekup,
            hasil_posyandu,
            imunisasi,
            lingkar_kepala,
            berat_badan,
            tinggi_badan,
            pemberian_vitamin,
            gizi_rutin
        } = req.body
        const [result] = await pool.query(
            `INSERT INTO layanan_anak
            (nik_anak, pemberian_pmt, tanggal_cekup, hasil_posyandu, imunisasi, lingkar_kepala,
            berat_badan, tinggi_badan, pemberian_vitamin, gizi_rutin, created_at, updated_at)
            VALUES (?, ?, ? , ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`,
            [
                nik_anak,
                pemberian_pmt,
                tanggal_cekup,
                hasil_posyandu,
                imunisasi,
                lingkar_kepala,
                berat_badan,
                tinggi_badan,
                pemberian_vitamin,
                gizi_rutin
            ]
        );
        res.status(201).json({ message: 'Layanan anak created', id_layanananak: result.insertId });
    } catch (error) {
        res.status(500).json({ error: error.message});
    }
});

// Update layanan_anak by id
router.put('/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const {
            nik_anak,
            pemberian_pmt,
            tanggal_cekup,
            hasil_posyandu,
            imunisasi,
            lingkar_kepala,
            berat_badan,
            tinggi_badan,
            pemberian_vitamin,
            gizi_rutin
        } = req.body;

    const [result] = await pool.query(
      `UPDATE layanan_anak
       SET nik_anak = ?, 
           pemberian_pmt = ?, 
           tanggal_cekup = ?, 
           hasil_posyandu = ?, 
           imunisasi = ?, 
           lingkar_kepala = ?, 
           berat_badan = ?, 
           tinggi_badan = ?, 
           pemberian_vitamin = ?, 
           gizi_rutin = ?, 
           updated_at = NOW()
       WHERE id_layanananak = ?`,
      [
        nik_anak,
        pemberian_pmt,
        tanggal_cekup,
        hasil_posyandu,
        imunisasi,
        lingkar_kepala,
        berat_badan,
        tinggi_badan,
        pemberian_vitamin,
        gizi_rutin,
        id
      ]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Layanan anak tidak ditemukan' });
    }

    res.json({ message: 'Layanan anak berhasil diupdate' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Delete layanan_anak by id
router.delete('/:id', async (req, res) => {
  try {
    const id = req.params.id;

    const [result] = await pool.query(
      `DELETE FROM layanan_anak WHERE id_layanananak = ?`,
      [id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Layanan anak tidak ditemukan' });
    }

    res.json({ message: 'Layanan anak berhasil dihapus' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});
export default router;