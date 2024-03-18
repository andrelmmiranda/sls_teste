const { prisma } = require('../connections/prismaClient');
const { pool } = require('../connections/pool');



class Functions{
  static async root(req, res, next){
    try {
      const entidades = await prisma.entidade.findMany();
      return res.status(200).json({ data: entidades });

    } catch (error) {
      return res.status(400).json({ message: 'deu algum caô'});
    }
  }

  static async path(req, res, next){
    try {
      return (await pool.query('select * from entidade e')).rows;

      // return await prisma.endereco.findMany();
      return res.status(200).json({ message: 'reloou uold from path'});
    } catch (error) {
      return res.status(400).json({ message: 'deu algum caô'});
    }
  }
}

module.exports = { Functions }