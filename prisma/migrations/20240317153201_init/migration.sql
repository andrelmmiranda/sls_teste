/*
  Warnings:

  - You are about to drop the `Programa` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "agendamento" DROP CONSTRAINT "agendamento_programa_id_fkey";

-- DropForeignKey
ALTER TABLE "entidade_programa" DROP CONSTRAINT "entidade_programa_programa_id_fkey";

-- DropForeignKey
ALTER TABLE "programa_usuario" DROP CONSTRAINT "programa_usuario_programa_id_fkey";

-- DropTable
DROP TABLE "Programa";

-- CreateTable
CREATE TABLE "programa" (
    "id" SERIAL NOT NULL,
    "titulo" VARCHAR(50) NOT NULL,
    "descricao" TEXT,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "programa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "avaliacao" (
    "id" SERIAL NOT NULL,
    "titulo" VARCHAR(50) NOT NULL,
    "descricao" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "avaliacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "avaliacao_programa" (
    "avaliacao_id" INTEGER NOT NULL,
    "programa_id" INTEGER NOT NULL,

    CONSTRAINT "avaliacao_programa_pkey" PRIMARY KEY ("avaliacao_id","programa_id")
);

-- AddForeignKey
ALTER TABLE "entidade_programa" ADD CONSTRAINT "entidade_programa_programa_id_fkey" FOREIGN KEY ("programa_id") REFERENCES "programa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "agendamento" ADD CONSTRAINT "agendamento_programa_id_fkey" FOREIGN KEY ("programa_id") REFERENCES "programa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "programa_usuario" ADD CONSTRAINT "programa_usuario_programa_id_fkey" FOREIGN KEY ("programa_id") REFERENCES "programa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "avaliacao_programa" ADD CONSTRAINT "avaliacao_programa_avaliacao_id_fkey" FOREIGN KEY ("avaliacao_id") REFERENCES "avaliacao"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "avaliacao_programa" ADD CONSTRAINT "avaliacao_programa_programa_id_fkey" FOREIGN KEY ("programa_id") REFERENCES "programa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
