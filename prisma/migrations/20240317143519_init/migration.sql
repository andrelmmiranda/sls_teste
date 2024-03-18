/*
  Warnings:

  - The primary key for the `cargo_usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `cargoId` on the `cargo_usuario` table. All the data in the column will be lost.
  - You are about to drop the column `usuarioId` on the `cargo_usuario` table. All the data in the column will be lost.
  - The primary key for the `setor_usuario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `setorId` on the `setor_usuario` table. All the data in the column will be lost.
  - You are about to drop the column `usuarioId` on the `setor_usuario` table. All the data in the column will be lost.
  - Added the required column `cargo_id` to the `cargo_usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario_id` to the `cargo_usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `setor_id` to the `setor_usuario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `usuario_id` to the `setor_usuario` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "cargo_usuario" DROP CONSTRAINT "cargo_usuario_cargoId_fkey";

-- DropForeignKey
ALTER TABLE "cargo_usuario" DROP CONSTRAINT "cargo_usuario_usuarioId_fkey";

-- DropForeignKey
ALTER TABLE "setor_usuario" DROP CONSTRAINT "setor_usuario_setorId_fkey";

-- DropForeignKey
ALTER TABLE "setor_usuario" DROP CONSTRAINT "setor_usuario_usuarioId_fkey";

-- AlterTable
ALTER TABLE "cargo_usuario" DROP CONSTRAINT "cargo_usuario_pkey",
DROP COLUMN "cargoId",
DROP COLUMN "usuarioId",
ADD COLUMN     "cargo_id" INTEGER NOT NULL,
ADD COLUMN     "usuario_id" INTEGER NOT NULL,
ADD CONSTRAINT "cargo_usuario_pkey" PRIMARY KEY ("cargo_id", "usuario_id");

-- AlterTable
ALTER TABLE "setor_usuario" DROP CONSTRAINT "setor_usuario_pkey",
DROP COLUMN "setorId",
DROP COLUMN "usuarioId",
ADD COLUMN     "setor_id" INTEGER NOT NULL,
ADD COLUMN     "usuario_id" INTEGER NOT NULL,
ADD CONSTRAINT "setor_usuario_pkey" PRIMARY KEY ("setor_id", "usuario_id");

-- CreateTable
CREATE TABLE "Faturamento" (
    "id" SERIAL NOT NULL,
    "tipo" VARCHAR(35) NOT NULL,
    "minimo" INTEGER NOT NULL,
    "entidade_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "Faturamento_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "cargo_usuario" ADD CONSTRAINT "cargo_usuario_cargo_id_fkey" FOREIGN KEY ("cargo_id") REFERENCES "cargo"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cargo_usuario" ADD CONSTRAINT "cargo_usuario_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "setor_usuario" ADD CONSTRAINT "setor_usuario_setor_id_fkey" FOREIGN KEY ("setor_id") REFERENCES "setor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "setor_usuario" ADD CONSTRAINT "setor_usuario_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Faturamento" ADD CONSTRAINT "Faturamento_entidade_id_fkey" FOREIGN KEY ("entidade_id") REFERENCES "entidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
