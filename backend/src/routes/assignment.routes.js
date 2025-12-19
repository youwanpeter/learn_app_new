import { Router } from "express";
import { auth } from "../middleware/auth.js";
import { allowRoles } from "../middleware/roles.js";
import { upload } from "../middleware/upload.js";
import {
  listAssignments,
  createAssignment,
  updateAssignment,
  deleteAssignment,
} from "../controllers/assignment.controller.js";

const r = Router();

r.get("/", auth, listAssignments);
r.post(
  "/",
  auth,
  allowRoles("lecturer", "staff", "admin"),
  upload.single("file"),
  createAssignment
);
r.put(
  "/:id",
  auth,
  allowRoles("lecturer", "staff", "admin"),
  upload.single("file"),
  updateAssignment
);
r.delete(
  "/:id",
  auth,
  allowRoles("lecturer", "staff", "admin"),
  deleteAssignment
);

export default r;
