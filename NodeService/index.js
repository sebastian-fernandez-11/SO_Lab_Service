const express = require('express');
const app = express();
const port = 200;

app.get('/', (req, res) => {
  console.log(req.method); // Use the 'req' parameter to avoid the unused variable warning
  res.send('Hello World!');
});

app.listen(port, () => console.log(`Listening on port ${port}`));


