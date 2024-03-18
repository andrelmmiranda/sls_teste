require('dotenv').config();
const { Router } = require('express');
const sectorRouter = Router();
const { SectorController } = require('../../controllers/sectorController');


const apiVersion = process.env.API_V1;

sectorRouter.get(`${apiVersion}/sector`, SectorController.getAll);
sectorRouter.get(`${apiVersion}/sector/:id`, SectorController.getById);
sectorRouter.post(`${apiVersion}/sector`, SectorController.create);
sectorRouter.put(`${apiVersion}/sector/:id`, SectorController.update);
sectorRouter.delete(`${apiVersion}/sector/:id`, SectorController.delete);

module.exports = { sectorRouter };
