import express from "express";
import dotenv from "dotenv";
import { chats } from "./data/data.js";
import cors from "cors";

// const cors = require("cors");

const app = express();
dotenv.config();
app.use(cors());

app.get("/", (req, res) => {
  res.send("API is running yolo...");
});

// app.get("/api/chat", (req, res) => {
app.get("/api/chat", cors({ origin: "http://localhost:3000" }), (req, res) => {
  res.send(chats);
});

app.get("/api/chat/:id", (req, res) => {
  const chat = chats.find((c) => c._id === req.params.id);
  res.send(chat);
});

const PORT = process.env.PORT || 5000;

app.listen(PORT, console.log(`Server running on port ${PORT}`));
