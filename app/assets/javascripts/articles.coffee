# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
//= require wysihtml5n
//= require dropzone

Array::unique = ->
  output = {}
  output[@[key]] = @[key] for key in [0...@length]
  value for key, value of output

Dropzone.autoDiscover = false

#http://www.dropzonejs.com/#config-dictFallbackMessage
$(document).ready ->
  $('.wysihtml5').each -> $(@).wysiHTML5N()


  # grap our upload form by its id
  $('.dropzone').each ->
    $thisDropZone = $(@)

    avatar = {
      $avatarInputField: $('[name="' + $thisDropZone.attr('hidden-field-name') + '"]')

      _read_file_ids: ->
        str = this.$avatarInputField.val() || null
        return str && str.split(',') || []

      _write_file_ids: (fileIDs)->
        this.$avatarInputField.val(fileIDs.unique().join(','))

      add_file_id: (fileID)->
        fileIDs = this._read_file_ids()
        if !(fileID in fileIDs) then fileIDs.push(fileID)
        this._write_file_ids(fileIDs)

      del_file_id: (fileID)->
        fileIDs = this._read_file_ids()
        fileIDs = fileIDs.filter (id) -> id isnt fileID
        this._write_file_ids(fileIDs)

    }

    $(@).dropzone({

      init: ->
#	    	mockFile = {"id":1, "size":196072, "name": "image", url:"/system/uploads/images/000/000/002/original/团详情页其它结构化.PNG?1452612143"}
#	    	this.options.addedfile.call(this, mockFile)
#	    	this.options.thumbnail.call(this, mockFile, mockFile.url)
#	    	this.options.success.call(this, mockFile, {fileID:2})

#	    	mockFile = {"fileID":1, "size":196072, "name": "image", url:"/system/uploads/images/000/000/002/original/团详情页其它结构化.PNG?1452612143"}
        mockFiles = JSON.parse(avatar.$avatarInputField.attr('avatar-data'))
        if mockFiles && mockFiles.length then
        (
          this.emit("addedfile", mockFile);
          this.emit("thumbnail", mockFile, mockFile.url);
          this.emit("success", mockFile, {fileID: mockFile.fileID})
        ) for mockFile in mockFiles

      dictRemoveFile: "删除"
      dictDefaultMessage: "点击上传图片"
      url: '/uploads'
      headers:
        "X-CSRF-Token": $('meta[name="csrf-token"]').attr('content')
# restrict image size to a maximum 1MB
      maxFilesize: 1
# changed the passed param to one accepted by
# our rails app
      paramName: "upload[image]"
# show remove links on each image upload
      addRemoveLinks: true
# if the upload was successful
      success: (file, response)->
# find the remove button link of the uploaded file and give it an id
# based of the fileID response from the server
        avatar.add_file_id(response.fileID)
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
            #					$(this).remove()
            #					$('.dz-preview').each ->  $(@).remove()
            $(file.previewElement).remove()
            avatar.del_file_id(id)
        })
    })


