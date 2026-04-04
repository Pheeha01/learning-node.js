-- CreateTable
CREATE TABLE "Company" (
    "company_id" SERIAL NOT NULL,
    "company_name" TEXT NOT NULL,
    "registration_number" TEXT NOT NULL,
    "business_type" TEXT NOT NULL,
    "number_of_employees" INTEGER,
    "year_established" INTEGER,
    "company_description" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "industry_id" INTEGER,
    "location_id" INTEGER,

    CONSTRAINT "Company_pkey" PRIMARY KEY ("company_id")
);

-- CreateTable
CREATE TABLE "Industry" (
    "industry_id" SERIAL NOT NULL,
    "industry_name" TEXT NOT NULL,

    CONSTRAINT "Industry_pkey" PRIMARY KEY ("industry_id")
);

-- CreateTable
CREATE TABLE "Location" (
    "location_id" SERIAL NOT NULL,
    "country" TEXT NOT NULL,

    CONSTRAINT "Location_pkey" PRIMARY KEY ("location_id")
);

-- CreateTable
CREATE TABLE "Product" (
    "product_id" SERIAL NOT NULL,
    "product_name" TEXT NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("product_id")
);

-- CreateTable
CREATE TABLE "CompanyProducts" (
    "company_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "CompanyProducts_pkey" PRIMARY KEY ("company_id","product_id")
);

-- CreateTable
CREATE TABLE "Region" (
    "region_id" SERIAL NOT NULL,
    "region_name" TEXT NOT NULL,

    CONSTRAINT "Region_pkey" PRIMARY KEY ("region_id")
);

-- CreateTable
CREATE TABLE "CompanyRegions" (
    "company_id" INTEGER NOT NULL,
    "region_id" INTEGER NOT NULL,

    CONSTRAINT "CompanyRegions_pkey" PRIMARY KEY ("company_id","region_id")
);

-- CreateTable
CREATE TABLE "CompanyTargets" (
    "source_company_id" INTEGER NOT NULL,
    "target_company_id" INTEGER NOT NULL,
    "status" TEXT DEFAULT 'pending',
    "notes" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CompanyTargets_pkey" PRIMARY KEY ("source_company_id","target_company_id")
);

-- CreateTable
CREATE TABLE "CompanyMatches" (
    "company1_id" INTEGER NOT NULL,
    "company2_id" INTEGER NOT NULL,
    "matched_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "match_type" TEXT,

    CONSTRAINT "CompanyMatches_pkey" PRIMARY KEY ("company1_id","company2_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Company_registration_number_key" ON "Company"("registration_number");

-- CreateIndex
CREATE UNIQUE INDEX "Industry_industry_name_key" ON "Industry"("industry_name");

-- CreateIndex
CREATE UNIQUE INDEX "Product_product_name_key" ON "Product"("product_name");

-- CreateIndex
CREATE UNIQUE INDEX "Region_region_name_key" ON "Region"("region_name");

-- AddForeignKey
ALTER TABLE "Company" ADD CONSTRAINT "Company_industry_id_fkey" FOREIGN KEY ("industry_id") REFERENCES "Industry"("industry_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Company" ADD CONSTRAINT "Company_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "Location"("location_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyProducts" ADD CONSTRAINT "CompanyProducts_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("company_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyProducts" ADD CONSTRAINT "CompanyProducts_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("product_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyRegions" ADD CONSTRAINT "CompanyRegions_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "Company"("company_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyRegions" ADD CONSTRAINT "CompanyRegions_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "Region"("region_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyTargets" ADD CONSTRAINT "CompanyTargets_source_company_id_fkey" FOREIGN KEY ("source_company_id") REFERENCES "Company"("company_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyTargets" ADD CONSTRAINT "CompanyTargets_target_company_id_fkey" FOREIGN KEY ("target_company_id") REFERENCES "Company"("company_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyMatches" ADD CONSTRAINT "CompanyMatches_company1_id_fkey" FOREIGN KEY ("company1_id") REFERENCES "Company"("company_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyMatches" ADD CONSTRAINT "CompanyMatches_company2_id_fkey" FOREIGN KEY ("company2_id") REFERENCES "Company"("company_id") ON DELETE RESTRICT ON UPDATE CASCADE;
