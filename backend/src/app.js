import express from "express";
import cors from "cors";
import path from "path";

import authRoutes from "./routes/auth.routes.js";
import materialRoutes from "./routes/material.routes.js";
import assignmentRoutes from "./routes/assignment.routes.js";

const app = express();

app.use(cors());
app.use(express.json());

// serve uploaded files
app.use("/uploads", express.static(path.resolve("uploads")));

app.get("/", (_, res) => res.json({ ok: true, name: "edu-backend" }));

app.use("/api/auth", authRoutes);
app.use("/api/materials", materialRoutes);
app.use("/api/assignments", assignmentRoutes);

export default app;
