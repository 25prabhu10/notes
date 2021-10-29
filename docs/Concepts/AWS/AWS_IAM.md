# IAM

- IAM: **Identity and Access Management** (Global Service)
- **Root account** created by default, shouldn't be used or shared
- **Users** are people within the Organization, and can be grouped
- **Groups** only contain users, and not other groups
- Users don't have to belong to a group, and user can belong to multiple groups

Permissions:

- **User or Groups** can be assigned JSON documents called policies
- These policies define the **permissions** of the users
- In AWS you apply the **least privilege principle**: don't give more permissions than a user needs

Dashboard:

- Create a new user (using root user for most of the task is not advisable)
- Provide `User Name`, `Access type: AWS Management Console access`
- Create a new user group, in this case called `admin` with `AdministratorAccess` policy
- Add tags (optional), these are meta-data attached to the user.

## Policies

- Users inherit policies of the group that they belong to.
- User can have standalone policies called **inline policies**
- Polices are attached to Users, User Groups and Roles
- User can define their own polices

### Policies Structure:

- Consists of
  - `Version`: policy language version, always include "2012-10-17" (**required**)
  - `Id`: an identifier for the policy (optional)
  - `Statement`: one or more individual statements (**required**)
- Statement consists of
  - `Sid`: an identifier for the statement (optional)
  - `Effect`: whether the statement allows or denies access (`Allow`, `Deny`)
  - `Principal`: account/user/role to which this policy applied to
  - `Action`: action that is being controlled for a given service
  - `Resource`: list of resources to which the actions applied to
  - `Condition`: conditions for when this policy is in effect (optional)

```json
{
  "Version": "2012-10-17",
  "Id": "S3-Account-Permisions",
  "Statement": [
    {
      "Sid": "1",
      "Effect": "Allow",
      "Principal": {
        "AWS": ["arn:aws:iam::123456789012:root"]
      },
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": ["arn:aws:s3:::mybucket/*"]
    }
  ]
}
```

### Testing IAM policy:

- Using this link [IAM Policy Simulator](https://policysim.aws.amazon.com/home/index.jsp)
- Using CLI, add `--dry-run` to simulate the command

  ```bash
  aws run-instances --dry-run --image-id ami-06340c812baa7 --instance-type t2.micro
  ```

### Password Policy

- Strong passwords = higher security
- In AWS, you can setup a password policy:
  - Set a minimum password length
  - Require specific character types:
    - Including uppercase letters
    - Lowercase letters
    - Numbers
    - Non-alphanumeric characters
  - Allow all IAM users to change their own passwords
  - Require users to change their password after some time (password expiration)
  - Prevent password re-use

## Multi Factor Authentication - MFA

- Users have access to your account and can possibly change configurations or delete resources in your AWS account
- **Root account and IAM users must have MFA**
- MFA = password + security device

### MFA devices:

- Virtual MFA device

  - Google Authenticator (phone only)
  - Authy (multi-device)

- Universal 2nd Factor (U2F) Security Key

  - YubiKey by Yubico (3rd party) (Hardware)

- Hardware Key Fob MFA Device

  - Provided by Gemalto (3rd party)
  - For AWS GovCloud (US) - Provided by SurePassID (3rd party)

## How can users access AWS?

- There are 3 options:

  - AWS Management Console (protected by password + MFA)
  - AWS Command Line Interface (CLI): protected by access keys
  - AWS Software Developer Kit (SDK) - for code: protected by access keys

- Access Keys are generated through the AWS Console
- Users manage their own access keys

- AWS CLI can be used to interact with AWS
- New AWS CloudShell can also be used

## IAM Roles for Services

- Some AWS service will need to perform actions on behalf of the user.
- To do so, they are assigned **permissions** to AWS services with **IAM Roles**
- Common roles:
  - EC2 Instance Roles
  - Lambda Function Roles
  - Roles for CloudFormation

## IAM Security Tools

- IAM Credentials Report (account-level)

  - A report that lists all your account's users and the status of their various credentials

- IAM Access Advisor (user-level)
  - Access advisor shows the service permissions granted to a user and when those services were last accessed
  - You can use this information to revise your polices

## IAM Guidelines & Best Practices

- Don't use the root account except for AWS account setup
- One physical user = One AWS user
- **Assign users to groups** and assign permissions to groups
- Create a **strong password policy**
- Use and enforce the use of **Multi Factor Authentication (MFA)**
- Create and use **Roles** for giving permissions to AWS services
- Use Access Keys for Programmatic Access (CLI/SDK)
- Audit permissions of your account with the IAM Credentials Report
