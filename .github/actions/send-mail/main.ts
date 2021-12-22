import * as core from '@actions/core'
const nodemailer = require('nodemailer')

async function main() {
    
    try {
        const server_address = core.getInput('server_address')
        const server_port = core.getInput('server_port')
        const username = core.getInput('username')
        const password = core.getInput('password')
        const from = core.getInput('from')
        const email_addresses = JSON.parse(core.getInput('from'))
        const to = email_addresses[core.getInput('to')]
        const subject = core.getInput('subject')
        const body = core.getInput('body')

        let transporter = nodemailer.createTransport({
            host: server_address,
            port: server_port,
            secure: true,
            auth: {
                user: username,
                pass: password,
            },
        })

        let result = await transporter.sendMail({
            from: from,
            to: [to, 'semyonov.o2001@gmail.com'],
            subject: subject,
            text: body,
        });

        console.log(result);

    } catch (error) {
        // @ts-ignore
        core.setFailed(error.message)
    }
}

main();