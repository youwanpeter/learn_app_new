import { Router } from "express";
import jwt from "jsonwebtoken";

const router = Router();

// 🔐 TEMP USERS (replace with DB later)
const users = [
  {
    id: "lect1",
    email: "lecturer@example.com",
    password: "1234",
    role: "lecturer",
  },
  {
    id: "stud1",
    email: "student@example.com",
    password: "1234",
    role: "student",
  },
];

router.post("/login", (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({
      message: "Email and password required",
    });
  }

  const user = users.find(
    (u) => u.email === email && u.password === password
  );

  if (!user) {
    return res.status(401).json({
      message: "Invalid credentials",
    });
  }

  const token = jwt.sign(
    {
      id: user.id,
      role: user.role,
    },
    process.env.JWT_SECRET,
    { expiresIn: "7d" }
  );

  res.status(200).json({
    token,
    role: user.role,
  });
});

export default router;
