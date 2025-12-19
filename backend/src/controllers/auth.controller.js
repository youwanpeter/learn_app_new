import jwt from "jsonwebtoken";

// DEMO users (replace with real users later)
const USERS = [
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

export async function login(req, res) {
  const { email, password } = req.body;

  const user = USERS.find((u) => u.email === email && u.password === password);
  if (!user) return res.status(401).json({ message: "Invalid credentials" });

  const token = jwt.sign(
    { id: user.id, role: user.role },
    process.env.JWT_SECRET,
    { expiresIn: "7d" }
  );

  res.json({ token, role: user.role, id: user.id });
}
