import mongoose from "mongoose";

const assignmentSchema = new mongoose.Schema(
  {
    courseId: { type: String, required: true },
    title: { type: String, required: true },
    instructions: { type: String, default: "" },
    dueDate: { type: Date, required: true },

    attachmentName: { type: String, default: "" },
    attachmentUrl: { type: String, default: "" },

    createdBy: { type: String, required: true },
  },
  { timestamps: true }
);

export default mongoose.model("Assignment", assignmentSchema);
