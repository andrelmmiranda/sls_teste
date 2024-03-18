/*
  Warnings:

  - You are about to drop the `Faturamento` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Faturamento" DROP CONSTRAINT "Faturamento_entidade_id_fkey";

-- DropTable
DROP TABLE "Faturamento";

-- CreateTable
CREATE TABLE "faturamento" (
    "id" SERIAL NOT NULL,
    "tipo" VARCHAR(35) NOT NULL,
    "minimo" INTEGER NOT NULL,
    "entidade_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "faturamento_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "faturamento_entidade_id_key" ON "faturamento"("entidade_id");

-- AddForeignKey
ALTER TABLE "faturamento" ADD CONSTRAINT "faturamento_entidade_id_fkey" FOREIGN KEY ("entidade_id") REFERENCES "entidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
