import mongoose from "mongoose";

const notificationSchema = new mongoose.Schema(
  {
    message: String,
    type: {
      type: String,
      enum: ["course", "lesson"],
    },
  },
  { timestamps: true }
);

export default mongoose.models.Notification ||
  mongoose.model("Notification", notificationSchema);
