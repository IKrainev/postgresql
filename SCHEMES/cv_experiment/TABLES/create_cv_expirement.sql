CREATE TABLE "files"(
    "id" UUID NOT NULL,
    "meta_id" UUID NOT NULL,
    "modality_id" UUID NOT NULL,
    "s3_id" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "size_in_mb" DOUBLE PRECISION NOT NULL,
    "extension" VARCHAR(255) NOT NULL,
    "description" TEXT NULL,
    "is_pathology" BOOLEAN NOT NULL,
    "is_defected" BOOLEAN NULL,
    "is_annotated" BOOLEAN NOT NULL,
    "time_was_uploaded" DATE NOT NULL,
    "time_was_checked" DATE NULL
);
ALTER TABLE
    "files" ADD PRIMARY KEY("id");
CREATE TABLE "modality"(
    "id" UUID NOT NULL,
    "type_of_research" VARCHAR(255) NOT NULL,
    "name_of_modality" VARCHAR(255) NOT NULL,
    "name_of_organ" VARCHAR(255) NOT NULL,
    "name_of_disease" VARCHAR(255) NOT NULL,
    "type_of_data" VARCHAR(255) NOT NULL,
    "description" TEXT NULL,
    "type_of_task" VARCHAR [] NOT NULL
);
ALTER TABLE
    "modality" ADD PRIMARY KEY("id");
CREATE TABLE "s3"(
    "id" UUID NOT NULL,
    "bucket" VARCHAR(255) NOT NULL,
    "path_to_s3" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "s3" ADD PRIMARY KEY("id");
ALTER TABLE
    "files" ADD CONSTRAINT "files_s3_id_foreign" FOREIGN KEY("s3_id") REFERENCES "s3"("id");
ALTER TABLE
    "files" ADD CONSTRAINT "files_modality_id_foreign" FOREIGN KEY("modality_id") REFERENCES "modality"("id");