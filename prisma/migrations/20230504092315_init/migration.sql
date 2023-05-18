-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `email` VARCHAR(256) NOT NULL,
    `user` VARCHAR(64) NOT NULL,
    `pass` VARCHAR(64) NOT NULL,
    `disp` VARCHAR(32) NOT NULL,
    `sex` INTEGER UNSIGNED NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,
    `verified` INTEGER UNSIGNED NOT NULL DEFAULT 0,

    UNIQUE INDEX `User_email_user_key`(`email`, `user`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Email` (
    `id` VARCHAR(191) NOT NULL,
    `Email_From` TEXT NOT NULL,
    `Email_To` TEXT NOT NULL,
    `Email_subject` TEXT NOT NULL,
    `Email_textBody` TEXT NOT NULL,
    `Email_htmlBody` TEXT NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
