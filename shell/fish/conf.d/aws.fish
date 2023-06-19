function ec2-instances --description 'Shortcut for nicely formatted table of ec2 instances'
    aws ec2 describe-instances \
        --filters Name=tag-key,Values=Name \
        --query 'Reservations[*].Instances[*].{Instance:InstanceId,AZ:Placement.AvailabilityZone,Name:Tags[?Key==`Name`]|[0].Value}' \
        --output table
end
