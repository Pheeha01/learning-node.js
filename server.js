import express from "express"
import {PrismaClient} from "@prisma/client"
import cors from "cors"
const app = express();
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());

app.post('/signUp', async (req, res) => {
  const data = req.body;
  try {
    const company = await prisma.company.create({ data });
    res.json(company);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});
