/*
  Warnings:

  - Added the required column `nome` to the `entidade` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "entidade" ADD COLUMN     "cnpj" VARCHAR(14),
ADD COLUMN     "cor" CHAR(7),
ADD COLUMN     "cpf" VARCHAR(11),
ADD COLUMN     "intermediaria" BOOLEAN DEFAULT false,
ADD COLUMN     "logo" TEXT,
ADD COLUMN     "nome" VARCHAR(100) NOT NULL;

-- CreateTable
CREATE TABLE "entidade_usuario" (
    "entidade_id" INTEGER NOT NULL,
    "usuario_id" INTEGER NOT NULL,

    CONSTRAINT "entidade_usuario_pkey" PRIMARY KEY ("entidade_id","usuario_id")
);

-- AddForeignKey
ALTER TABLE "entidade_usuario" ADD CONSTRAINT "entidade_usuario_entidade_id_fkey" FOREIGN KEY ("entidade_id") REFERENCES "entidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entidade_usuario" ADD CONSTRAINT "entidade_usuario_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
