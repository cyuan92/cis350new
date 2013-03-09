module TherapistDashboardHelper	

	def retrieveAllPatients
		require File.expand_path(File.dirname(__FILE__)+'/../../aws_config')

		# Hard-coded bucket_name. Must be changed later to address multiple patients
		bucket_name = "recordings77"
		therapist_name = "conyuan"
		patient_name = "wingyli"
		# get an instance of the S3 interface using the default configuration
		s3=AWS::S3.new

		# create a bucket
		b = s3.buckets.create(bucket_name)
		html="<h1>"+patient_name+"\'s recordings</h1>\n"		
		# retrieve the filenames of all recordings
		#html <<"<ul class=\"recordings "+ patient_name + "\">"
		b.objects.each do |obj|			
			if obj.key.match(therapist_name+"\/+\w") 				

				html << "\n<li>"
				html << obj.key
				html <<"</li>\n"
			end			
		end
		html<<"</ul>"
		html.html_safe		
	end

	def retrieveAllRecordings
		require File.expand_path(File.dirname(__FILE__)+'/../../aws_config')

		# Hard-coded bucket_name. Must be changed later to address multiple patients
		bucket_name = "recordings77"
		therapist_name = "conyuan"
		patient_name = "wingyli"
		# get an instance of the S3 interface using the default configuration
		s3=AWS::S3.new

		# create a bucket
		b = s3.buckets.create(bucket_name)
		html="<h1>"+patient_name+"\'s recordings</h1>\n"		
		# retrieve the filenames of all recordings
		#html <<"<ul class=\"recordings "+ patient_name + "\">"
		b.objects.each do |obj|			
			if obj.key.match(therapist_name+"\/"+patient_name+"\/"+"[a-z A-Z 0-9 _ -]+.3gp") 				

				html << "\n<li><a href=\""
				html << obj.url_for(:get,:expires=>10*60).to_s	
				dateRecorded = obj.key.to_s.scan(/([^_]*)/).third.first
				timeRecorded = obj.key.to_s.scan(/([^_]*)/).fifth.first.scan(/([^.]*)/).first.first.gsub("-",":")
				html << "\">"+dateRecorded + " at " + timeRecorded
				html<<"</a></li>\n"
			end			
		end
		html<<"</ul>"
		html.html_safe		
	end


end
