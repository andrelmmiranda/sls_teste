/*
  Warnings:

  - You are about to drop the `department` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "department";

-- CreateTable
CREATE TABLE "Cargo" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(50) NOT NULL,
    "descricao" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Cargo_pkey" PRIMARY KEY ("id")
);
