import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import courseRoutes from "./routes/course.routes.js";
import lessonRoutes from "./routes/lesson.routes.js";

const app = express();
app.use(cors());
app.use(express.json());

app.get("/", (_, res) => res.json({ ok: true }));

app.use("/api/courses", courseRoutes);
app.use("/api/lessons", lessonRoutes);

export default app;
