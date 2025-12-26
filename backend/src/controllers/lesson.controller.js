import Lesson from "../models/Lesson.js";
import { notifyAll } from "../utils/notify.js";

export const listLessons = async (req, res) => {
  res.json(await Lesson.find({ courseId: req.query.courseId }));
};

export const createLesson = async (req, res) => {
  const lesson = await Lesson.create({
    ...req.body,
    createdBy: req.user.id,
  });

  await notifyAll(`📘 New lesson: ${lesson.title}`, "lesson");
  res.status(201).json(lesson);
};

export const updateLesson = async (req, res) => {
  const lesson = await Lesson.findByIdAndUpdate(
    req.params.id,
    req.body,
    { new: true }
  );

  await notifyAll(`✏️ Lesson updated: ${lesson.title}`, "lesson");
  res.json(lesson);
};

export const deleteLesson = async (req, res) => {
  const lesson = await Lesson.findByIdAndDelete(req.params.id);
  await notifyAll(`🗑 Lesson deleted: ${lesson.title}`, "lesson");
  res.json({ success: true });
};
