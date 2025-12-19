import Assignment from "../models/Assignment.js";

export async function listAssignments(req, res) {
  const { courseId } = req.query;
  if (!courseId) return res.status(400).json({ message: "courseId required" });

  const items = await Assignment.find({ courseId }).sort({ dueDate: 1 });
  res.json(items);
}

export async function createAssignment(req, res) {
  const { courseId, title, instructions = "", dueDate } = req.body;
  if (!courseId || !title || !dueDate) {
    return res
      .status(400)
      .json({ message: "courseId, title, dueDate required" });
  }

  let attachmentUrl = "";
  let attachmentName = "";

  if (req.file) {
    attachmentName = req.file.filename;
    attachmentUrl = `${process.env.BASE_URL}/uploads/${req.file.filename}`;
  }

  const doc = await Assignment.create({
    courseId,
    title,
    instructions,
    dueDate,
    attachmentName,
    attachmentUrl,
    createdBy: req.user.id,
  });

  res.status(201).json(doc);
}

export async function updateAssignment(req, res) {
  const { id } = req.params;

  const patch = {};
  ["title", "instructions", "dueDate"].forEach((k) => {
    if (req.body[k] !== undefined) patch[k] = req.body[k];
  });

  if (req.file) {
    patch.attachmentName = req.file.filename;
    patch.attachmentUrl = `${process.env.BASE_URL}/uploads/${req.file.filename}`;
  }

  const updated = await Assignment.findByIdAndUpdate(id, patch, { new: true });
  if (!updated) return res.status(404).json({ message: "Not found" });

  res.json(updated);
}

export async function deleteAssignment(req, res) {
  const { id } = req.params;
  const deleted = await Assignment.findByIdAndDelete(id);
  if (!deleted) return res.status(404).json({ message: "Not found" });
  res.json({ ok: true });
}
