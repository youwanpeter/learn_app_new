import { Router } from "express";
import { auth } from "../middleware/auth.js";
import {
  listLessons,
  createLesson,
} from "../controllers/lesson.controller.js";

const router = Router();

router.get("/", auth, listLessons);
router.post("/", auth, createLesson);

export default router;
