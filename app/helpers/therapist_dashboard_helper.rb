module TherapistDashboardHelper	
	def retrieveAllPatients
		require File.expand_path(File.dirname(__FILE__)+'/../../aws_config')

		# Hard-coded bucket_name. Must be changed later to address multiple patients
		bucket_name = "recordings77"
		therapist_name = "conyuan"		
		# get an instance of the S3 interface using the default configuration
		s3=AWS::S3.new

		# create a bucket
		b = s3.buckets.create(bucket_name)
		html="<h1>Choose your Patient</h1>\n"		
		# retrieve the filenames of all recordings
		html <<"<ul>\n"
		b.objects.each do |obj|			
			if obj.key.match(therapist_name+"\/+[A-Z a-z]+\/$")								
				patient_name = obj.key.to_s.scan(/([^\/]*)/).third.first
				html << "<li>"+patient_name+"<br/><ul>"
				html << retrieveAllRecordings(b, therapist_name, patient_name).to_s
				html << "</ul></li>\n"				
			end	
		end
		html<<"</ul>"
		html.html_safe		
	end

	def retrieveAllRecordings(bucket, therapist_name, patient_name)		
		result = "\n"		

		# retrieve the filenames of all recordings		
		bucket.objects.each do |obj|	

			if obj.key.match(therapist_name+"\/"+patient_name+"\/"+"[a-z A-Z 0-9 _ -]+.3gp") 			
				result << "\n<li><a href=\""
				result << obj.url_for(:get,:expires=>10*60).to_s
				dateRecorded = obj.key.to_s.scan(/([^_]*)/).third.first
				timeRecorded = obj.key.to_s.scan(/([^_]*)/).fifth.first.scan(/([^.]*)/).first.first.gsub("-",":")
				result << "\">"+dateRecorded + " at " + timeRecorded
		#		result << "\">"+obj.key.to_s
				result <<"</a></li>\n"
			end
		end
		return result		
	end
	
end
