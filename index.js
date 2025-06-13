import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import dotenv from 'dotenv';
 
import petugasRoutes from './routes/petugas.js';
import ibuRoutes from './routes/ibu.js';
import anakRoutes from './routes/anak.js';
import layananibuRoutes from './routes/layananibu.js';
import layanananakRouter from './routes/layanananak.js';
import loginRouter from './routes/login.js';

dotenv.config();

const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use('/api/petugas', petugasRoutes);
app.use('/api/ibu', ibuRoutes);
app.use('/api/anak', anakRoutes);
app.use('/api/layananibu', layananibuRoutes);
app.use('/api/layanananak', layanananakRouter);
app.use('/api/login', loginRouter);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
