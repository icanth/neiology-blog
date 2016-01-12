# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require wysihtml5n
//= require dropzone

$(document).ready ->
	#http://www.dropzonejs.com/#config-dictFallbackMessage
	Dropzone.autoDiscover = false
	# grap our upload form by its id
	$('.dropzone').dropzone({
	    dictDefaultMessage: "点击上传图片"
		url: '/uploads'
		headers: "X-CSRF-Token" : $('meta[name="csrf-token"]').attr('content')
		# restrict image size to a maximum 1MB
		maxFilesize: 1
		# changed the passed param to one accepted by
		# our rails app
		paramName: "upload[image]"
		# show remove links on each image upload
		addRemoveLinks: true
		# if the upload was successful
		success: (file,response)->
			# find the remove button link of the uploaded file and give it an id
			# based of the fileID response from the server
			$(file.previewTemplate).find('.dz-remove').attr('id', response.fileID);
			# add the dz-success class (the green tick sign)
			$(file.previewElement).addClass("dz-success");
		#when the remove button is clicked
		removedfile: (file)->
			# grap the id of the uploaded file we set earlier
			id = $(file.previewTemplate).find('.dz-remove').attr('id'); 

			# make a DELETE ajax request to delete the file
			$.ajax({
				type: 'DELETE',
				url: '/uploads/' + id,
				success: (data)->
					console.log(data.message)
			})
		})
	
	$('.wysihtml5').each -> $(@).wysiHTML5N()


