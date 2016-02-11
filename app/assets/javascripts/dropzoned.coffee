$ ->
  app.dropzone_selector = '.dropzone-uploader'

  previewNode = document.querySelector("#template");
  previewNode.id = "";
  previewTemplate = previewNode.parentNode.innerHTML;
  previewNode.parentNode.removeChild(previewNode);

  if $(app.dropzone_selector).length > 0
    options = {
      headers: { 'X-CSRF-Token': app.token() },
      url: '/images',
      paramName: 'image[file]',
      thumbnailWidth: 80,
      thumbnailHeight: 80,
      previewTemplate: previewTemplate,
      autoQueue: false,
      previewsContainer: "#previews",
#      clickable: ".fileinput-button"
    }
    dropzone = new Dropzone(app.dropzone_selector, options)

    dropzone.on "addedfile", (file) ->
      file.previewElement.querySelector(".dz-start-upload").onclick = ->
        dropzone.enqueueFile(file)

    dropzone.on "sending", (file, xhr, formData)->
      formData.append('authenticity_token', app.token())

    app.dropzone = dropzone
