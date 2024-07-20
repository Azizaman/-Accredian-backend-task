/*
  Warnings:

  - You are about to drop the column `friendEmail` on the `Referral` table. All the data in the column will be lost.
  - You are about to drop the column `friendName` on the `Referral` table. All the data in the column will be lost.
  - You are about to drop the column `message` on the `Referral` table. All the data in the column will be lost.
  - You are about to drop the column `referrerEmail` on the `Referral` table. All the data in the column will be lost.
  - You are about to drop the column `referrerName` on the `Referral` table. All the data in the column will be lost.
  - Added the required column `course` to the `Referral` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `Referral` table without a default value. This is not possible if the table is not empty.
  - Added the required column `referee` to the `Referral` table without a default value. This is not possible if the table is not empty.
  - Added the required column `referrer` to the `Referral` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Referral" DROP COLUMN "friendEmail",
DROP COLUMN "friendName",
DROP COLUMN "message",
DROP COLUMN "referrerEmail",
DROP COLUMN "referrerName",
ADD COLUMN     "course" TEXT NOT NULL,
ADD COLUMN     "email" TEXT NOT NULL,
ADD COLUMN     "referee" TEXT NOT NULL,
ADD COLUMN     "referrer" TEXT NOT NULL;
