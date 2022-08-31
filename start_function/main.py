import googleapiclient.discovery

def start_vm(request):
    compute = googleapiclient.discovery.build('compute', 'v1')
    result = compute.instances().start(project='YOUR_PROJECT_ID', zone='YOUR_VM_ZONE', instance='YOUR_VM_NAME').execute()
    return result
