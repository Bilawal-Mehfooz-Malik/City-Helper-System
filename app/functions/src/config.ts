import sgMail from "@sendgrid/mail";
import * as dotenv from "dotenv";

dotenv.config();

const SENDGRID_API_KEY = process.env.SENDGRID_API_KEY;
export const FROM_EMAIL = process.env.FROM_EMAIL || "";
export const TO_EMAIL = process.env.TO_EMAIL || "";

if (SENDGRID_API_KEY) sgMail.setApiKey(SENDGRID_API_KEY);
else console.warn("SendGrid API key missing. Emails will not be sent.");

export const sendEmail = async (msg: sgMail.MailDataRequired) => {
  if (!SENDGRID_API_KEY) return console.warn("SendGrid API key missing. Email not sent.");
  try {
    await sgMail.send(msg);
    console.log("Email sent successfully!");
  } catch (err: any) {
    console.error("Error sending email:", err);
    if (err.response) console.error(err.response.body);
  }
};
