-- CreateTable
CREATE TABLE "Referral" (
    "id" SERIAL NOT NULL,
    "referrerName" TEXT NOT NULL,
    "referrerEmail" TEXT NOT NULL,
    "friendName" TEXT NOT NULL,
    "friendEmail" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Referral_pkey" PRIMARY KEY ("id")
);

-- Insert sample entries
INSERT INTO referrals (referrer, referee, email, course) VALUES
('Alice Smith', 'Bob Johnson', 'bob@example.com', 'Data Science'),
('John Doe', 'Jane Doe', 'jane@example.com', 'Web Development'),
('Michael Brown', 'Sarah Connor', 'sarah@example.com', 'Machine Learning'),
('Emily Davis', 'Daniel Martinez', 'daniel@example.com', 'Cybersecurity'),
('Sophia Wilson', 'David Lee', 'david@example.com', 'Cloud Computing');

