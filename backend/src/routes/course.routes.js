import { Router } from "express";
import { auth } from "../middleware/auth.js";
import {
  listCourses,
  createCourse,
} from "../controllers/course.controller.js";

const router = Router();

router.get("/", auth, listCourses);
router.post("/", auth, createCourse);

export default router;
