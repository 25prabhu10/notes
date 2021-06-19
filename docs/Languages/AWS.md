# AWS

Parvesh Chopra

ffmpeg -f alsa -ac 2 -i default -acodec libopus -threads 0 -y output.mka

ffmpeg -f x11grab -r 20 -s 1920x1080 -i :0.0 -vcodec libx265 -preset fast -b:v 500k -threads 0 -y output.6.mkv

ffmpeg -f pulse -ac 2 -i default -f x11grab -r 20 -s 1920x1080 -i :0.0 -acodec aac -vcodec libx264 -preset ultrafast -b:v 900k -threads 0 -y output.mkv

[Instance purchasing options](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-purchasing-options.html)

If not sure, leverage the https://aws.amazon.com/compute-optimizer/

ALB Vs NLB - https://aws.amazon.com/elasticloadbalancing/features/

please share one example for SNS
A:
https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/sns-examples.html

link for outpost please?
A:
https://aws.amazon.com/outposts/

please provide any link to Aws hardware devices ?
A:
https://aws.amazon.com/snowball/ | https://aws.amazon.com/outposts/

Is there issue of exposing my IP? with Route 53
A:
Amazon Route 53 automatically creates a name server (NS) record that has the same name as your hosted zone. It lists the four name servers that are the authoritative name servers for your hosted zone. e.g. https://aws.amazon.com/route53/faqs/

Can you provide a real life example of Route53?
A:
Sure, like for disaster recovery, if one region goes down, route 53 will do the failover to another region automatically. There are diff options you get : have a look in here :https://aws.amazon.com/route53/features/

what is block here?
A:
Block is defined as we save data on hard disks, it is into blocks hence faster to find it. EBS is like hard disks

Can we create RAID structures with EBS manually or its taken care by the system itself?
A:
Yes. You can stripe multiple volumes together to achieve up to 260,000 IOPS or 60,000 Mbps (or 7500 MB/s) when attached to larger EC2 instances. However, performance for st1 and sc1 scales linearly with volume size so there may not be as much of a benefit to stripe these volumes together.
12:16 PM
Webinar staffto everyone
Q:
how does S3 bucket charges
A:
https://aws.amazon.com/s3/pricing/
12:19 PM
Webinar staffto everyone
Q:
Can an EBS connect to multiple EC2 instances
A:
one EBS to one EC2 however we launched newer types of multiattach EBS https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volumes-multi.html
12:27 PM
Webinar staffto everyone
Q:
different b/w efs and ebs
A:
https://aws.amazon.com/efs/when-to-choose-efs/
12:27 PM
Webinar staffto everyone
Q:
diff between EFS and S3?
A:
https://aws.amazon.com/efs/when-to-choose-efs/
12:27 PM
Webinar staffto everyone
Q:
DynamoDB is a Non rdbs db?
A:
yes !
12:41 PM
Webinar staffto everyone
Q:
How many questions , duration,
A:
We will cover these Q at the end. 65 Q in 90 mins.

Some of Lambda examples here : https://docs.aws.amazon.com/lambda/latest/dg/lambda-samples.html

https://www.cloudping.info/

The role of AWS Fargate in the container world: https://aws.amazon.com/blogs/containers/the-role-of-aws-fargate-in-the-container-world/

https://aws.amazon.com/ecs/

ECS vs. EKS: https://aws.amazon.com/blogs/containers/amazon-ecs-vs-amazon-eks-making-sense-of-aws-container-services/

aws.amazon.com/free

Is it just me who can hear Shwetabh with lag ?

public 1:58 PM
Parvesh Chopra (Organizer)to Everyone
Me coming last in class

public 2:21 PM
Shwetabh Varma (Organizer, Presenter)to Everyone
https://calculator.aws/#/

public 2:46 PM
Parvesh Chopra (Organizer)to Everyone
I have seen recently in Gurgaon too.

public 2:49 PM
Shwetabh Varma (Organizer, Presenter)to Everyone
https://aws.amazon.com/premiumsupport/plans/

public 2:55 PM
Parvesh Chopra (Organizer)to Everyone
https://pages.awscloud.com/traincert-learn-aws-cloudskills.html ; Pls review this link and save it.

public 3:09 PM
Parvesh Chopra (Organizer)to Everyone
https://d1.awsstatic.com/training-and-certification/docs-cloud-practitioner/AWS-Certified-Cloud-Practitioner_Exam-Guide.pdf

https://d1.awsstatic.com/training-and-certification/docs-cloud-practitioner/AWS-Certified-Cloud-Practitioner_Sample-Questions.pdf

https://www.linkedin.com/in/shwetabh-varma-482b0a13/

AWS Partners: https://www.aws.training/Details/eLearning?id=60697

https://aws.amazon.com/certification/certified-cloud-practitioner/
