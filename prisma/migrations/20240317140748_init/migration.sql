-- CreateTable
CREATE TABLE "tipo_entidade" (
    "id" SERIAL NOT NULL,
    "tipo" VARCHAR(7) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "tipo_entidade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "entidade" (
    "id" SERIAL NOT NULL,
    "tipoEntidadeId" INTEGER NOT NULL,
    "entidadeId" INTEGER,

    CONSTRAINT "entidade_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "entidade" ADD CONSTRAINT "entidade_tipoEntidadeId_fkey" FOREIGN KEY ("tipoEntidadeId") REFERENCES "tipo_entidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entidade" ADD CONSTRAINT "entidade_entidadeId_fkey" FOREIGN KEY ("entidadeId") REFERENCES "entidade"("id") ON DELETE SET NULL ON UPDATE CASCADE;
