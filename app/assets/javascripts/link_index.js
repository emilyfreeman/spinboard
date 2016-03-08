$(document).ready(function() {
  fetchLinks()
  linkFilter()
  fetchLinksAlphabetically()
  fetchLinksByStatus()
  changeReadStatus()
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

function readButton(link) {
  if (link.read) {
    return "<button class='mark-as-read-button' name='mark-as-unread-button' class=''>Mark as Unread</button></div>"
  } else {
    return "<button class='mark-as-read-button' name='mark-as-read-button' class=''>Mark as Read</button>"
  }
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

function fetchLinksAlphabetically() {
  $('#filter-list-alphabetically').on('click', function() {
    var linkUri = '/api/v1/links'

    $.getJSON(linkUri, function(data) {
      data.sort(function(a, b){
        var x = a.title.toLowerCase(), y = b.title.toLowerCase();

        return x < y ? -1 : x > y ? 1 : 0;
      });

      $('#link-info').html('');
      $.each(data, function(key, val) {
        renderLink(val)
      })
    })
  })
}

function fetchLinksByStatus() {
  $('#filter-list-by-status').on('click', function() {
    var linkUri = '/api/v1/links'

    $.getJSON(linkUri, function(data) {
      data.sort(function(a, b){
        var x = a.read, y = b.read;

        return x < y ? -1 : x > y ? 1 : 0;
      });

      $('#link-info').html('');
      $.each(data, function(key, val) {
        renderLink(val)
      })
    })
  })

}


function changeReadStatus() {
  $('#link-info').delegate('.mark-as-read-button', 'click', function() {

    var $link = $(this).closest(".link")
    var isRead = $link.data('read')
    $link.data('read', !isRead)

    $.ajax({
      type: 'PUT',
      url: "/api/v1/links/" + $link.attr('data-id') + "",
      data: { "read": !isRead },
      success: function(updatedIdea) {
        console.log("success")
      },
      error: function(xhr) {
        console.log(xhr.responseText)
      }
    })
    fetchLinks()
  })
}

function linkFilter () {
  $('#link_filter_title').keyup('change', function () {
    var currentIdea = document.getElementById('search_by_title').value
    $('.link').each(function (index, link) {
      $link = $(link);
      $linkTitle = $(link).data('title')
      $linkUrl = $(link).data('url')
      if ($linkTitle.includes(currentIdea) || $linkUrl.includes(currentIdea)) {
        $link.show()
      } else {
        $link.hide()
      }
    })
  })
}
