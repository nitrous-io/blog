---
---

# Material buttons
# --------------------------------
$('.ripple').on 'click', (event) ->
  event.preventDefault()
  $this = $(this)
  href = $this.attr('href')
  $div = $('<div/>')
  btnOffset = $(this).offset()
  xPos = event.pageX - btnOffset.left
  yPos = event.pageY - btnOffset.top
  $div.addClass 'ripple-effect'
  $ripple = $('.ripple-effect')
  $ripple.css 'height', $(this).height()
  $ripple.css 'width', $(this).height()
  $div.css(
    top: yPos - ($ripple.height() / 2)
    left: xPos - ($ripple.width() / 2)
    background: $(this).data('ripple-color')).appendTo $(this)

  window.setTimeout (->
    $div.remove()
    if $this.is('input[type="submit"]')
      $(this).parents("form").submit()
    else if href
      window.location = href
      false
  ), 985