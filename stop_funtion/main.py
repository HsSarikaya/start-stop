import googleapiclient.discovery

def stop_vm(request):
    compute = googleapiclient.discovery.build('compute', 'v1')
    result = compute.instances().stop(project='YOUR_PROJECT_ID', zone='YOUR_VM_ZONE', instance='YOUR_VM_NAME').execute()
    return result
