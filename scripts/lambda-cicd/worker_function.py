import boto3
import paramiko

def lambda_handler(event, context):

    s3_client = boto3.client('s3')
    #Download private key file from secure S3 bucket
    s3_client.download_file('cicdkeys','cicdssh.pem', '/tmp/cicdssh.pem')

    k = paramiko.RSAKey.from_private_key_file("/tmp/cicdssh.pem")
    c = paramiko.SSHClient()
    c.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    host=event['IP']
    print("Connecting to " + host)
    c.connect( hostname = host, username = "ec2-user", pkey = k )
    print("Connected to " + host)

    commands = [
        "aws s3 cp s3://cicdkeys/gitpull.sh /home/ec2-user/gitpull.sh",
        "chmod 700 /home/ec2-user/gitpull.sh",
        "/home/ec2-user/gitpull.sh"
    ]
    for command in commands:
        print("Executing {}".format(command))
        stdin , stdout, stderr = c.exec_command(command)
        print(stdout.read())
        print(stderr.read())

    return
    {
        'message' : "Script execution completed. See Cloudwatch logs for complete output"
    }
