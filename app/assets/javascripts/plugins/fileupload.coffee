$ ->
  uploadButton = $('<button/>').addClass('btn btn-primary').prop('disabled', true).text('Processing...').on('click', ->
    $this = $(this)
    data = $this.data()
    $this.off('click').text('Abort').on 'click', ->
      $this.remove()
      data.abort()
      return
    data.submit().always ->
      $this.remove()
      return
  )

  $('#fileupload').fileupload(
    url: '/'
    dataType: 'json'
    autoUpload: false
    acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i
    maxFileSize: 999000
    disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent)
    previewMaxWidth: 100
    previewMaxHeight: 100
    previewCrop: true).on('fileuploadadd', (e, data) ->
    data.context = $('<div/>').appendTo('#files')

    $.each data.files, (index, file) ->
      loadImage(
        file
        (img) ->
          if img.type == "error"
            console.log 'error'
          else
            node = $('<p/>').append($('<span/>').text(file.name))

            if !index
              node.append(img)
              node.append('<br>').append uploadButton.clone(true).data(data)

            node.appendTo data.context
        {
          maxWidth:  100
          maxHeight: 100
        }
      )
      return
#    ).on('fileuploadprocessalways', (e, data) ->
#      index = data.index
#      file = data.files[index]
#      node = $(data.context.children()[index])
#      if file.preview
#        node.prepend('<br>').prepend file.preview
#      if file.error
#        node.append('<br>').append $('<span class="text-danger"/>').text(file.error)
#      if index + 1 == data.files.length
#        data.context.find('button').text('Upload').prop 'disabled', ! !data.files.error
#      return
#    ).on('fileuploadprogressall', (e, data) ->
#      progress = parseInt(data.loaded / data.total * 100, 10)
#      $('#progress .progress-bar').css 'width', progress + '%'
#      return
#    ).on('fileuploaddone', (e, data) ->
#      $.each data.result.files, (index, file) ->
#        if file.url
#          link = $('<a>').attr('target', '_blank').prop('href', file.url)
#          $(data.context.children()[index]).wrap link
#        else if file.error
#          error = $('<span class="text-danger"/>').text(file.error)
#          $(data.context.children()[index]).append('<br>').append error
#        return
#      return
#    ).on('fileuploadfail', (e, data) ->
#      $.each data.files, (index) ->
#        error = $('<span class="text-danger"/>').text('File upload failed.')
#        $(data.context.children()[index]).append('<br>').append error
#        return
#      return
    )#.prop('disabled', !$.support.fileInput).parent().addClass if $.support.fileInput then undefined else 'disabled'

#  $('#fileupload').fileupload
#    dataType: 'json'
#    done: (e, data) ->
#      $.each data.result.files, (index, file) ->
#        $('<p/>').text(file.name).appendTo(document.body)
#    change: (e, data)->
#      return
#    submit: (e, data) ->
#      $.each data.files, (index, file) ->
#        loadImage(
#          file
#          (img) ->
#            if img.type == "error"
#              console.log 'error'
#            else
#              document.body.appendChild(img)
#          {
#            maxWidth: 600
#          }
#        )
#
#      data.formData = { shit: 'no' }
#      true
#
#    add: (e, data) ->
#      $.each data.files, (index, file) ->
#        $filesContainer = $('.files-container')
#        source   = $('#file-upload-template').html()
#        template = Handlebars.compile(source);
#
#        context = { content: "Hello" }
#        $filesContainer.append(template(context))
#
#
#        $entry = $filesContainer.find('.fileupload-entry').last()
#        $entry[0].file = file
#
#        $img = $entry.find('.img')
#
#        loadImage(
#          file
#          (img) ->
#            if img.type == "error"
#              console.log 'error'
#            else
#              $img.append(img)
#
#          {
#            maxWidth: 600
#          }
#        )
#      false

  return
