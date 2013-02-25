module TherapistDashboardHelper

	def retrieveAllRecordings
		require File.expand_path(File.dirname(__FILE__)+'/../../aws_config')

		# Hard-coded bucket_name. Must be changed later to address multiple patients
		bucket_name = "recordings77"

		# get ian instance of the S3 interface using the default configuration
		s3=AWS::S3.new

		# create a bucket
		b = s3.buckets.create(bucket_name)
		html = "<ul>"
		# retrieve the filenames of all recordings
		b.objects.each do |obj|
			html << "<li>" + obj.key + "</li>"
		end
		html<<"</ul>"
		html.html_safe		
	end
end
