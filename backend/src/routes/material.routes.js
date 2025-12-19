import { Router } from "express";
import { auth } from "../middleware/auth.js";
import { allowRoles } from "../middleware/roles.js";
import { upload } from "../middleware/upload.js";
import {
  listMaterials,
  createMaterial,
  updateMaterial,
  deleteMaterial,
} from "../controllers/material.controller.js";

const r = Router();

r.get("/", auth, listMaterials);
r.post(
  "/",
  auth,
  allowRoles("lecturer", "staff", "admin"),
  upload.single("file"),
  createMaterial
);
r.put(
  "/:id",
  auth,
  allowRoles("lecturer", "staff", "admin"),
  upload.single("file"),
  updateMaterial
);
r.delete(
  "/:id",
  auth,
  allowRoles("lecturer", "staff", "admin"),
  deleteMaterial
);

export default r;
