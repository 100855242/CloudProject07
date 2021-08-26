# https://aws.amazon.com/blogs/compute/scheduling-ssh-jobs-using-aws-lambda/
# The execution role must have permissions to execute EC2 DescribeInstances and invoke Lambda functions (see trigger_policy.json).

import boto3

def lambda_handler(event, context):
    
    client = boto3.client('ec2')
    instDict=client.describe_instances(
        Filters=[{'Name':'tag:Environment','Values':['CICD']}]
    )

    hostList=[]
    for r in instDict['Reservations']:
        for inst in r['Instances']:
            hostList.append(inst['PublicIpAddress'])

    #Invoke worker function for each IP address
    client = boto3.client('lambda')
    for host in hostList:
        print("Invoking worker_function on " + host)
        invokeResponse=client.invoke(
            FunctionName='CiCdWorker',
            InvocationType='Event',
            LogType='Tail',
            Payload='{"IP":"'+ host +'"}'
        )
        print(invokeResponse)

    return{
        'response' : hostList[0]
    }
