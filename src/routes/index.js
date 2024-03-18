require('dotenv').config();
const { Router } = require('express');
const router = Router();


const apiVersion = process.env.API_V1

router.get(`/`, (req, res, next) =>{
    return res.status(200).json({ message: 'funfs' });
})

module.exports = { router };



// api/v1/get:
// handler: index.handler
// events:
//   - httpApi:
//       path: /
//       method: POST

// api/v1/get_path:
// handler: index.handler
// events:
//   - httpApi: 
//       path: /path
//       method: GET


