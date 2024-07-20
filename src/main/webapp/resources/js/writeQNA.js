$(document).ready(function() {
  // Initialize the Summernote editor
  $('.summernote').summernote({
    placeholder: '내용을 입력하세요...',
    minHeight: 300,
    maxHeight: 600,
    focus: true,
    lang: 'ko-KR',
    toolbar: [
      ['fontname', ['fontname']],
      ['fontsize', ['fontsize']],
      ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
      ['color', ['forecolor', 'color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['view', ['codeview', 'fullscreen', 'help']]
    ]
  });

  // Form submission event handler
  $('#qnaForm').submit(function(event) {
    event.preventDefault(); // Prevent the default form submission

    var formData = new FormData(this); // Use 'this' to refer to the form
    formData.append('qattach', $('#qattach')[0].files[0]); // Append the file

    $.ajax({
      type: 'POST',
      enctype: 'multipart/form-data',
      url: 'http://localhost:8080/viewport_mini_web/board/writeQNA',
      data: formData,
      processData: false,
      contentType: false,
      cache: false,
      success: function(response) {
        window.location.href = response;
      },
      error: function(xhr, status, error) {
        console.error('Error:', error);
        alert('제출 실패: ' + error);
      }
    });
  });



});
