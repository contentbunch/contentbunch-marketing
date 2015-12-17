$(document).ready ->
  (($) ->
    'use strict'
    $('body').scrollspy
      target: '.navbar-fixed-top'
      offset: 60
    (new WOW).init()
    $('a.page-scroll').bind 'click', (event) ->
      $ele = $(this)
      console.log $($ele.attr('href')).offset().top
      console.log $ele.attr('href')
      $('html, body').stop().animate { scrollTop: $($ele.attr('href')).offset().top - 40 }, 1450, 'easeInOutExpo'
      event.preventDefault()
      return
    $('.navbar-collapse ul li a').click ->
      $('.navbar-toggle:visible').click()
      return
    return
  ) jQuery

  $container = $('.portfolioContainer')
  $body = $('body')
  colW = 375
  columns = null
  $container.isotope
    resizable: true
    masonry: columnWidth: colW
  $(window).smartresize(->
    currentColumns = Math.floor(($body.width() - 30) / colW)
    if currentColumns != columns
      columns = currentColumns
      $container.width(columns * colW).isotope 'reLayout'
    return
  ).smartresize()
  $('.portfolioFilter a').click ->
    $('.portfolioFilter .current').removeClass 'current'
    $(this).addClass 'current'
    selector = $(this).attr('data-filter')
    $container.isotope filter: selector
    false
  return
