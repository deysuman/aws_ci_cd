var express = require('express');
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.listen(3000, () =>
  console.log(`Example app listening on port 3000!`),
);
