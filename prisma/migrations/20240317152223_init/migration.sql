-- AlterTable
ALTER TABLE "faturamento" ALTER COLUMN "tipo" DROP NOT NULL,
ALTER COLUMN "tipo" SET DEFAULT 'POR VIDA ATIVA',
ALTER COLUMN "minimo" DROP NOT NULL;

-- CreateTable
CREATE TABLE "endereco" (
    "id" SERIAL NOT NULL,
    "cep" CHAR(8) NOT NULL,
    "logradouro" VARCHAR(100),
    "complemento" VARCHAR(100),
    "bairro" VARCHAR(50),
    "localidade" VARCHAR(50),
    "uf" CHAR(2),
    "usuario_id" INTEGER,
    "entidade_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "endereco_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Programa" (
    "id" SERIAL NOT NULL,
    "titulo" VARCHAR(50) NOT NULL,
    "descricao" TEXT,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "Programa_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "entidade_programa" (
    "entidade_id" INTEGER NOT NULL,
    "programa_id" INTEGER NOT NULL,

    CONSTRAINT "entidade_programa_pkey" PRIMARY KEY ("entidade_id","programa_id")
);

-- CreateTable
CREATE TABLE "agendamento" (
    "id" SERIAL NOT NULL,
    "data" TIMESTAMP NOT NULL,
    "tipo" VARCHAR(25) NOT NULL DEFAULT 'ÚNICO',
    "status" BOOLEAN NOT NULL DEFAULT true,
    "programa_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "agendamento_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "agendamento_usuario" (
    "agendamento_id" INTEGER NOT NULL,
    "usuario_id" INTEGER NOT NULL,

    CONSTRAINT "agendamento_usuario_pkey" PRIMARY KEY ("agendamento_id","usuario_id")
);

-- CreateTable
CREATE TABLE "programa_usuario" (
    "programa_id" INTEGER NOT NULL,
    "usuario_id" INTEGER NOT NULL,

    CONSTRAINT "programa_usuario_pkey" PRIMARY KEY ("programa_id","usuario_id")
);

-- AddForeignKey
ALTER TABLE "endereco" ADD CONSTRAINT "endereco_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "endereco" ADD CONSTRAINT "endereco_entidade_id_fkey" FOREIGN KEY ("entidade_id") REFERENCES "entidade"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entidade_programa" ADD CONSTRAINT "entidade_programa_entidade_id_fkey" FOREIGN KEY ("entidade_id") REFERENCES "entidade"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "entidade_programa" ADD CONSTRAINT "entidade_programa_programa_id_fkey" FOREIGN KEY ("programa_id") REFERENCES "Programa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "agendamento" ADD CONSTRAINT "agendamento_programa_id_fkey" FOREIGN KEY ("programa_id") REFERENCES "Programa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "agendamento_usuario" ADD CONSTRAINT "agendamento_usuario_agendamento_id_fkey" FOREIGN KEY ("agendamento_id") REFERENCES "agendamento"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "agendamento_usuario" ADD CONSTRAINT "agendamento_usuario_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "programa_usuario" ADD CONSTRAINT "programa_usuario_programa_id_fkey" FOREIGN KEY ("programa_id") REFERENCES "Programa"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "programa_usuario" ADD CONSTRAINT "programa_usuario_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "usuario"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
