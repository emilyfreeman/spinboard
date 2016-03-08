$(document).ready(function() {
  fetchLinks()
})

  function renderLink(link) {
  $("#link-info").append(
    "<div class='link margin-bottom-40' data-id='" + link.id + "' data-read='" + link.read +
    "' data-title='" + link.title + "' data-url='" + link.url +
    "'><span class='title-span'><span><strong>Title: </strong></span><h4 contentEditable='true' class='link-title'>" + link.title + "</h4></span>" +
    "<span><strong>URL: </strong></span><p contentEditable='true' class='link-url'>" + link.url + "</p>" +
    "<div>" + readButton(link) +
    "<a href='/links/" + link.id + "/edit'><button class='edit-link' name='edit-button' class=''>Edit</button></a>"
  )
}

function fetchLinks() {
  var linkUri = '/api/v1/links'

  $.getJSON(linkUri, function(data) {
    $('#link-info').html('');
    $.each(data, function(key, val) {
      renderLink(val)
    })
  })
}
