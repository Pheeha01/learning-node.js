-- CreateTable
CREATE TABLE "Notification" (
    "notification_id" SERIAL NOT NULL,
    "company_id" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "message" TEXT,
    "related_company_id" INTEGER,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "is_read" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("notification_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Notification_company_id_related_company_id_type_key" ON "Notification"("company_id", "related_company_id", "type");

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("company_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_related_company_id_fkey" FOREIGN KEY ("related_company_id") REFERENCES "Company"("company_id") ON DELETE SET NULL ON UPDATE CASCADE;
