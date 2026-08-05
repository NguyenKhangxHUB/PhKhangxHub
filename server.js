const express = require("express");
const app = express();

const keys = [
  "Maru_YTKGjfHFJF816HF"
];

app.get("/check", (req, res) => {
  const key = req.query.key;

  if (keys.includes(key)) {
    res.send("true");
  } else {
    res.send("false");
  }
});

app.listen(3000, () => {
  console.log("Server running");
});