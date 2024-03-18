/*
  Warnings:

  - You are about to drop the column `createdAt` on the `cargo` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `cargo` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `cargo` table. All the data in the column will be lost.
  - You are about to drop the column `entidadeId` on the `entidade` table. All the data in the column will be lost.
  - You are about to drop the column `tipoEntidadeId` on the `entidade` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `setor` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `setor` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `setor` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `tipo_entidade` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `tipo_entidade` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `tipo_entidade` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `usuario` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `usuario` table. All the data in the column will be lost.
  - Added the required column `tipo_entidade_id` to the `entidade` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "entidade" DROP CONSTRAINT "entidade_entidadeId_fkey";

-- DropForeignKey
ALTER TABLE "entidade" DROP CONSTRAINT "entidade_tipoEntidadeId_fkey";

-- AlterTable
ALTER TABLE "cargo" DROP COLUMN "createdAt",
DROP COLUMN "deletedAt",
DROP COLUMN "updateAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "update_at" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "entidade" DROP COLUMN "entidadeId",
DROP COLUMN "tipoEntidadeId",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "entidade_id" INTEGER,
ADD COLUMN     "tipo_entidade_id" INTEGER NOT NULL,
ADD COLUMN     "update_at" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "setor" DROP COLUMN "createdAt",
DROP COLUMN "deletedAt",
DROP COLUMN "updateAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "update_at" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "tipo_entidade" DROP COLUMN "createdAt",
DROP COLUMN "deletedAt",
DROP COLUMN "updateAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "update_at" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "usuario" DROP COLUMN "createdAt",
DROP COLUMN "deletedAt",
DROP COLUMN "updateAt",
ADD COLUMN     "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "update_at" TIMESTAMP(3);

-- AddForeignKey
ALTER TABLE "entidade" ADD CONSTRAINT "entidade_tipo_entidade_id_fkey" FOREIGN KEY ("tipo_entidade_id") REFERENCES "tipo_entidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entidade" ADD CONSTRAINT "entidade_entidade_id_fkey" FOREIGN KEY ("entidade_id") REFERENCES "entidade"("id") ON DELETE SET NULL ON UPDATE CASCADE;
