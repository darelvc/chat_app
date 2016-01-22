$ ->
  chatId = $('#comments').data('chatId');
  chanel = '/chats/' + chatId + '/messages'
  PrivatePub.subscribe chanel, (data, chanel) ->
    console.log(data)
    message = $.parseJSON(data['message'])
    $('#comments').append(message.content)
    $('.new_message #message_content').val('');