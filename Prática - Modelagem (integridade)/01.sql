CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"stateId" int NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
);



CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"fullName" varchar(255) NOT NULL,
	"cpf" varchar(255) NOT NULL UNIQUE,
	"email" varchar(255) NOT NULL UNIQUE,
	"passowrd" varchar(255) NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
);



CREATE TABLE "public.customerPhones" (
	"id" serial NOT NULL,
	"customerId" int(255) NOT NULL,
	"number" int NOT NULL UNIQUE,
	"type" varchar(255) NOT NULL,
	CONSTRAINT "customerPhones_pk" PRIMARY KEY ("id")
) WITH (
);



CREATE TABLE "public.customerAddresses" (
	"id" serial NOT NULL,
	"customerId" varchar(255) NOT NULL UNIQUE,
	"street" varchar(255) NOT NULL,
	"number" int NOT NULL,
	"complement" varchar(255) NOT NULL,
	"postalCode" varchar(255) NOT NULL,
	"cityId" int(255) NOT NULL,
	CONSTRAINT "customerAddresses_pk" PRIMARY KEY ("id")
) WITH (
);



CREATE TABLE "public.bankAccount" (
	"id" serial NOT NULL,
	"agency" int NOT NULL,
	"accountNumber" int(255) NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE NOT NULL,
	"customerId" int NOT NULL,
	CONSTRAINT "bankAccount_pk" PRIMARY KEY ("id")
) WITH (
);



CREATE TABLE "public.transactions" (
	"id" serial NOT NULL,
	"amount" int NOT NULL,
	"type" varchar(255) NOT NULL,
	"description" varchar(255) NOT NULL,
	"time" timestamp with time zone NOT NULL,
	"bankAccountId" int NOT NULL,
	"cancelled" varchar(255) NOT NULL,
	CONSTRAINT "transactions_pk" PRIMARY KEY ("id")
) WITH (
);



CREATE TABLE "public.creditCard" (
	"id" serial NOT NULL,
	"number" int NOT NULL,
	"accountNumber" int(255) NOT NULL,
	"bankAccountId" int NOT NULL,
	"name" varchar(255) NOT NULL,
	"securityCode" varchar(255) NOT NULL,
	"expirationMonth" int(255) NOT NULL,
	"expirationYear" int(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	"limit" varchar(255) NOT NULL,
	CONSTRAINT "creditCard_pk" PRIMARY KEY ("id")
) WITH (
);




ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");


ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCard" ADD CONSTRAINT "creditCard_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");








