import mongoose from "mongoose";

const courseSchema = new mongoose.Schema(
  {
    title: {
      type: String,
      required: true,
    },

    description: {
      type: String,
    },

    // 🔥 STRING because auth uses "lect1"
    lecturerId: {
      type: String,
      required: true,
    },
  },
  { timestamps: true }
);

// ✅ Prevent OverwriteModelError
export default mongoose.models.Course ||
  mongoose.model("Course", courseSchema);
