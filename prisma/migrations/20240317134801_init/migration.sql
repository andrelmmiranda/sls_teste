-- CreateTable
CREATE TABLE "setor_usuario" (
    "setorId" INTEGER NOT NULL,
    "usuarioId" INTEGER NOT NULL,

    CONSTRAINT "setor_usuario_pkey" PRIMARY KEY ("setorId","usuarioId")
);

-- AddForeignKey
ALTER TABLE "setor_usuario" ADD CONSTRAINT "setor_usuario_setorId_fkey" FOREIGN KEY ("setorId") REFERENCES "setor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "setor_usuario" ADD CONSTRAINT "setor_usuario_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
