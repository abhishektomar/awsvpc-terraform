#!/usr/bin/ruby
# This script will tell what AZ's are available in our account.
#
# Prerequsite : aws cli 

profile=ARGV[0]
region=ARGV[1]

unless ARGV.length == 2
  puts "Usage: <scriptName> <profile> <region> \n"
  puts "e.g. : ruby az.rb default us-east-1"
  exit
end

azs = [`aws ec2 describe-availability-zones --region #{region} --profile #{profile} | awk '{print $4}'`]

puts "<= Availability Zones => \n"

for az in azs
  puts az
end
