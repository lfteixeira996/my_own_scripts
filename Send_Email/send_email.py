import smtplib
import imghdr
from email.message import EmailMessage

#create the body of the email
msg = EmailMessage()
msg['Subject'] = 'Email Subject'
msg['From'] = 'email of the sender'
msg['To'] = 'email of the receiver'
msg.set_content('Email message')

#Code to attach images
#with open('image.png', 'rb') as f:
#	file_data = f.read()
#	file_type = imghdr.what(f.name)
#	file_name = f.name
#msg.add_attachment(file_data, maintype="image", subtype=file_type, filename=file_name)	

#Code to attach a pdf
file = 'resume.pdf'
with open(file, 'rb') as f:
	file_data = f.read()
	file_name = f.name
msg.add_attachment(file_data, maintype='application', subtype='octet-stream', filename=file_name)	


#Send email 
with smtplib.SMTP_SSL('smtp.gmail.com', 465) as smtp:
    smtp.login('email of the sender', 'email_password')
    
    smtp.send_message(msg)
    

