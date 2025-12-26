import Notification from "../models/Notification.js";

export const notifyAll = async (message, type) => {
  await Notification.create({ message, type });
};
