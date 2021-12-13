import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


def approve_mail(toaddr):
    fromaddr = "cydezlimit123@gmail.com"

    # instance of MIMEMultipart
    msg = MIMEMultipart()
    # toaddr = "ankitpchandran353@gmail.com"
    # storing the senders email address
    msg['From'] = fromaddr

    # storing the receivers email address
    msg['To'] = toaddr

    # storing the subject
    msg['Subject'] = "Account Authentication Details"
    # msg['Subject'] = subject

    # string to store the body of the mail

    # attach the body with the msg instance

    html = """
    <html>
      <head></head>
      <body>
      <p>Username:<br>""" + toaddr + """

        </p>
        <p>Your Account Approved</p>

        </p><br>
        <p>Join Link<br>
           Authenticate Your Account <a href="http://127.0.0.1:8000/logins">Login now</a>.
        </p>
      </body>
    </html>
    """

    msg.attach(MIMEText(html, 'html'))

    # creates SMTP session
    s = smtplib.SMTP('smtp.gmail.com', 587)

    # start TLS for security
    s.starttls()

    # Authentication
    s.login(fromaddr, "cydezlimit321")

    # Converts the Multipart msg into a string
    text = msg.as_string()

    # sending the mail
    s.sendmail(fromaddr, toaddr, text)

    # terminating the session
    s.quit()


def reject_mail(toaddr):
    fromaddr = "cydezlimit123@gmail.com"

    # instance of MIMEMultipart
    msg = MIMEMultipart()
    # toaddr = "ankitpchandran353@gmail.com"
    # storing the senders email address
    msg['From'] = fromaddr

    # storing the receivers email address
    msg['To'] = toaddr

    # storing the subject
    msg['Subject'] = "Account Authentication Details"
    # msg['Subject'] = subject

    # string to store the body of the mail

    # attach the body with the msg instance

    html = """
    <html>
      <head></head>
      <body>
      <p>Username:<br>""" + toaddr + """

        </p>
        <p>Your Account Rejected</p>

        </p><br>
        <p>Join Link<br>
           Authenticate Your Account <a href="http://127.0.0.1:8000/logins">Login now</a>.
        </p>
      </body>
    </html>
    """

    msg.attach(MIMEText(html, 'html'))

    # creates SMTP session
    s = smtplib.SMTP('smtp.gmail.com', 587)

    # start TLS for security
    s.starttls()

    # Authentication
    s.login(fromaddr, "cydezlimit321")

    # Converts the Multipart msg into a string
    text = msg.as_string()

    # sending the mail
    s.sendmail(fromaddr, toaddr, text)

    # terminating the session
    s.quit()


def request_mail(toaddr):
    fromaddr = "cydezlimit123@gmail.com"

    # instance of MIMEMultipart
    msg = MIMEMultipart()
    # toaddr = "ankitpchandran353@gmail.com"
    # storing the senders email address
    msg['From'] = fromaddr

    # storing the receivers email address
    msg['To'] = toaddr

    # storing the subject
    msg['Subject'] = "Account Authentication Details"
    # msg['Subject'] = subject

    # string to store the body of the mail

    # attach the body with the msg instance

    html = """
    <html>
      <head></head>
      <body>
      <p>Username:<br>""" + toaddr + """

        </p>
        <p>I'm ready to start a ride with you</p>

        </p><br>
        <p>Join Link<br>
           Authenticate Your Account <a href="http://127.0.0.1:8000/logins">Login now</a>.
        </p>
      </body>
    </html>
    """

    msg.attach(MIMEText(html, 'html'))

    # creates SMTP session
    s = smtplib.SMTP('smtp.gmail.com', 587)

    # start TLS for security
    s.starttls()

    # Authentication
    s.login(fromaddr, "cydezlimit321")

    # Converts the Multipart msg into a string
    text = msg.as_string()

    # sending the mail
    s.sendmail(fromaddr, toaddr, text)

    # terminating the session
    s.quit()


def accept_mail(toaddr):
    fromaddr = "cydezlimit123@gmail.com"

    # instance of MIMEMultipart
    msg = MIMEMultipart()
    # toaddr = "ankitpchandran353@gmail.com"
    # storing the senders email address
    msg['From'] = fromaddr

    # storing the receivers email address
    msg['To'] = toaddr

    # storing the subject
    msg['Subject'] = "Account Authentication Details"
    # msg['Subject'] = subject

    # string to store the body of the mail

    # attach the body with the msg instance

    html = """
    <html>
      <head></head>
      <body>
      <p>Username:<br>""" + toaddr + """

        </p>
        <p>Hlo, Your trip request is accepted</p>

        </p><br>
        <p>Join Link<br>
           Authenticate Your Account <a href="http://127.0.0.1:8000/logins">Login now</a>.
        </p>
      </body>
    </html>
    """

    msg.attach(MIMEText(html, 'html'))

    # creates SMTP session
    s = smtplib.SMTP('smtp.gmail.com', 587)

    # start TLS for security
    s.starttls()

    # Authentication
    s.login(fromaddr, "cydezlimit321")

    # Converts the Multipart msg into a string
    text = msg.as_string()

    # sending the mail
    s.sendmail(fromaddr, toaddr, text)

    # terminating the session
    s.quit()


def trip_reject_mail(toaddr):
    fromaddr = "cydezlimit123@gmail.com"

    # instance of MIMEMultipart
    msg = MIMEMultipart()
    # toaddr = "ankitpchandran353@gmail.com"
    # storing the senders email address
    msg['From'] = fromaddr

    # storing the receivers email address
    msg['To'] = toaddr

    # storing the subject
    msg['Subject'] = "Account Authentication Details"
    # msg['Subject'] = subject

    # string to store the body of the mail

    # attach the body with the msg instance

    html = """
    <html>
      <head></head>
      <body>
      <p>Username:<br>""" + toaddr + """

        </p>
        <p>Sorry your trip Rejected</p>

        </p><br>
        <p>Join Link<br>
           Authenticate Your Account <a href="http://127.0.0.1:8000/logins">Login now</a>.
        </p>
      </body>
    </html>
    """

    msg.attach(MIMEText(html, 'html'))

    # creates SMTP session
    s = smtplib.SMTP('smtp.gmail.com', 587)

    # start TLS for security
    s.starttls()

    # Authentication
    s.login(fromaddr, "cydezlimit321")

    # Converts the Multipart msg into a string
    text = msg.as_string()

    # sending the mail
    s.sendmail(fromaddr, toaddr, text)

    # terminating the session
    s.quit()
