const { prisma } = require('../../connections/prismaClient');
const { pool } = require('../../connections/pool');

class SectorController{
    static async getAll(req, res, next){
        try {
            const data = await prisma.setor.findMany();
            return res.status(200).json({ data });     
        } catch (error) {
            return res.status(400).json({ message: 'BAD REQUEST' });
        }
    }

    static async getById(req, res, next){
        try {
            const { id } = req.params;

            const data = await prisma.setor.findUnique({
                where: { id: Number(id) }
            });

            return res.status(200).json({ data });
        } catch (error) {
            return res.status(400).json({ message: 'BAD REQUEST' });
        } 
    }

    static async create(req, res, next){
        try {
            const { nome, descricao } = req.body;

            const data = await prisma.setor.create({ data: { nome, descricao }});
            return res.status(201).json({ data });
        } catch (error) {
            return res.status(400).json({ message: 'BAD REQUEST' });
        }
    }

    static async update(req, res, next){
        try {
            const { nome, descricao } = req.body;
            const { id } = req.params;

            const data = await prisma.setor.update({
                where: { id: Number(id) },
                data: { nome, descricao }
            });
            return res.status(200).json({ data });
        } catch (error) {
            return res.status(400).json({ message: 'BAD REQUEST' });
        }
    }

    static async delete(req, res, next){
        try {
            const { id } = req.params;
            const data = await prisma.setor.delete({
                where: { id: Number(id) }
            })
            return res.status(200).json();
        } catch (error) {
            return res.status(400).json({ message: 'BAD REQUEST' });
        }
    }
}

module.exports = { SectorController };