import mongoose from "mongoose";

const materialSchema = new mongoose.Schema(
  {
    courseId: { type: String, required: true },
    title: { type: String, required: true },
    description: { type: String, default: "" },

    type: { type: String, enum: ["pdf", "video", "link"], required: true },

    url: { type: String, default: "" },
    fileName: { type: String, default: "" },
    fileUrl: { type: String, default: "" },

    createdBy: { type: String, required: true },
  },
  { timestamps: true }
);

export default mongoose.model("Material", materialSchema);
