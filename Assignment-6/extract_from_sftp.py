import paramiko
import os

host = 'localhost'
port = 22
username = 'your_sftp_user'
password = 'your_password'
remote_path = '/employee_data.csv'
local_path = 'downloaded_employee_data.csv'

# Connect to SFTP
try:
    transport = paramiko.Transport((host, port))
    transport.connect(username=username, password=password)
    sftp = paramiko.SFTPClient.from_transport(transport)

    # Download file
    sftp.get(remote_path, local_path)
    print(" File downloaded successfully.")

    sftp.close()
    transport.close()
except Exception as e:
    print(" Error:", e)
