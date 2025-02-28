/*
  Warnings:

  - You are about to drop the column `ingredientes` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the `MenuCategody` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `customerCpf` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `customerName` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "OrderStatus" ADD VALUE 'PAYMENT_CONFIRMED';
ALTER TYPE "OrderStatus" ADD VALUE 'PAYMENT_FAILED';

-- DropForeignKey
ALTER TABLE "MenuCategody" DROP CONSTRAINT "MenuCategody_restaurantId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_menuCategoryId_fkey";

-- AlterTable
ALTER TABLE "Order" ADD COLUMN     "customerCpf" TEXT NOT NULL,
ADD COLUMN     "customerName" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "ingredientes",
ADD COLUMN     "ingredients" TEXT[];

-- DropTable
DROP TABLE "MenuCategody";

-- CreateTable
CREATE TABLE "MenuCategory" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "restaurantId" TEXT NOT NULL,

    CONSTRAINT "MenuCategory_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "MenuCategory" ADD CONSTRAINT "MenuCategory_restaurantId_fkey" FOREIGN KEY ("restaurantId") REFERENCES "Restaurant"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_menuCategoryId_fkey" FOREIGN KEY ("menuCategoryId") REFERENCES "MenuCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;
