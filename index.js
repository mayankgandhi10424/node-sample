const e = require('express');
const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  try {
    const { status } = req.query;
    console.info('Request received', Math.random());
    res.status((status && parseInt(status)) || 200).json({
      status: status,
      message: 'Hello World!',
    });
  } catch (error) {
    console.error('Error occurred', error);
    res.status(500).json({
      status: 500,
      message: error.message,
    });
  }
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
});