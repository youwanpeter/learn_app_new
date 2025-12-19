import Material from "../models/Material.js";

export async function listMaterials(req, res) {
  const { courseId } = req.query;
  if (!courseId) return res.status(400).json({ message: "courseId required" });

  const items = await Material.find({ courseId }).sort({ createdAt: -1 });
  res.json(items);
}

export async function createMaterial(req, res) {
  const { courseId, title, description = "", type, url = "" } = req.body;
  if (!courseId || !title || !type) {
    return res.status(400).json({ message: "courseId, title, type required" });
  }

  let fileUrl = "";
  let fileName = "";

  if (req.file) {
    fileName = req.file.filename;
    fileUrl = `${process.env.BASE_URL}/uploads/${req.file.filename}`;
  }

  const doc = await Material.create({
    courseId,
    title,
    description,
    type,
    url,
    fileName,
    fileUrl,
    createdBy: req.user.id,
  });

  res.status(201).json(doc);
}

export async function updateMaterial(req, res) {
  const { id } = req.params;

  const patch = {};
  ["title", "description", "url", "type"].forEach((k) => {
    if (req.body[k] !== undefined) patch[k] = req.body[k];
  });

  if (req.file) {
    patch.fileName = req.file.filename;
    patch.fileUrl = `${process.env.BASE_URL}/uploads/${req.file.filename}`;
  }

  const updated = await Material.findByIdAndUpdate(id, patch, { new: true });
  if (!updated) return res.status(404).json({ message: "Not found" });

  res.json(updated);
}

export async function deleteMaterial(req, res) {
  const { id } = req.params;
  const deleted = await Material.findByIdAndDelete(id);
  if (!deleted) return res.status(404).json({ message: "Not found" });
  res.json({ ok: true });
}
