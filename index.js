const express = require('express');
const bodyParser = require('body-parser');
const { PrismaClient } = require('@prisma/client');
const nodemailer = require('nodemailer');
const cors = require('cors'); // Import the cors package
require('dotenv').config();

const prisma = new PrismaClient();
const app = express();
app.use(cors()); // Enable CORS for all routes
app.use(bodyParser.json());

app.post('/api/referrals', async (req, res) => {
  const { referrer, referee, email, course } = req.body;

  try {
    const newReferral = await prisma.referral.create({
      data: {
        referrer,
        referee,
        email,
        course,
      },
    });

    // Send referral email
    let transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: process.env.GMAIL_USER,
        pass: process.env.GMAIL_PASS,
      },
    });

    let mailOptions = {
      from: process.env.GMAIL_USER,
      to: email,
      subject: 'Course Referral',
      text: `Hi ${referee},\n\n${referrer} has referred you to the course: ${course}.\n\nBest Regards,\nYour Team`,
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log(error);
        res.status(500).send('Error sending email');
      } else {
        console.log('Email sent: ' + info.response);
        res.status(200).send(newReferral);
      }
    });
  } catch (error) {
    console.error(error);
    res.status(400).send('Error creating referral');
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

