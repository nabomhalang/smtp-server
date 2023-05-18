import { SMTPServer } from 'smtp-server';
import { simpleParser } from "mailparser";
import { prisma } from "./prisma";


const server = new SMTPServer({
  logger: true,
  disabledCommands: ["STARTTLS", "AUTH"],

  onData(stream, session, callback) {
    var email = "";
    stream.on("data", (chunk: string) => {
      email += chunk.toString();
    });

    stream.on("end", () => {
      simpleParser(email)
        .then(async (parsed) => {
          const from = parsed.from?.value[0].address;
          var to;
          if (Array.isArray(parsed.to)) {
            to = parsed.to.map((address) => {
              return address.text
            });

            for (const address of parsed.to) {
              to = address.text
            }
          } else {
            to = parsed.to?.text;
          }
          const subject = parsed.subject
          const textBody = parsed.text
          const htmlBody = parsed.html

          await prisma.email.create({
            data: {
              Email_From: from as string,
              Email_To: to as string,
              Email_subject: subject as string,
              Email_textBody: textBody as string,
              Email_htmlBody: htmlBody as string
            }
          });
        });

      if (callback) return callback();
    });
  },
})


server.listen(25)
