import Course from "../models/Course.js";
import { notifyAll } from "../utils/notify.js";

export const listCourses = async (req, res) => {
  const q = req.user.role === "lecturer"
    ? { lecturerId: req.user.id }
    : {};

  res.json(await Course.find(q));
};

export const createCourse = async (req, res) => {
  const course = await Course.create({
    title: req.body.title,
    description: req.body.description,
    lecturerId: req.user.id,
  });

  await notifyAll(`📘 New course added: ${course.title}`, "course");

  res.status(201).json(course);
};

export const updateCourse = async (req, res) => {
  const course = await Course.findByIdAndUpdate(
    req.params.id,
    req.body,
    { new: true }
  );

  await notifyAll(`✏️ Course updated: ${course.title}`, "course");
  res.json(course);
};

export const deleteCourse = async (req, res) => {
  const course = await Course.findByIdAndDelete(req.params.id);
  await notifyAll(`🗑 Course deleted: ${course.title}`, "course");
  res.json({ success: true });
};
