import mongoose from "mongoose";

const lessonSchema = new mongoose.Schema(
  {
    courseId: {
      type: String, // 🔥 string course id
      required: true,
    },

    title: {
      type: String,
      required: true,
    },

    content: {
      type: String,
      default: "",
    },

    // 🔥 FIX: string because auth uses "lect1"
    createdBy: {
      type: String,
      required: true,
    },
  },
  { timestamps: true }
);

// ✅ Prevent OverwriteModelError
export default mongoose.models.Lesson ||
  mongoose.model("Lesson", lessonSchema);
