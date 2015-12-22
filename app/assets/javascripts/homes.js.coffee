$(document).ready ->
  (($) ->
    'use strict'
    $('body').scrollspy
      target: '.navbar-fixed-top'
      offset: 60
    (new WOW).init()
    $('a.page-scroll').bind 'click', (event) ->
      $ele = $(this)
      $('html, body').stop().animate { scrollTop: $($ele.attr('href')).offset().top - 40 }, 1450, 'easeInOutExpo'
      event.preventDefault()
      return
    $('.navbar-collapse ul li a').click ->
      $('.navbar-toggle:visible').click()
      return
    return
  ) jQuery

  $portfolio_container = $('.portfolioContainer')
  $tools_container = $('.tools-container')
  $body = $('body')
  colW = 375
  columns = null

  $portfolio_container.isotope
    resizable: true
    masonry: columnWidth: colW
  $tools_container.isotope
    resizable: true
    masonry: columnWidth: colW

  $(window).smartresize(->
    currentColumns = Math.floor(($body.width() - 30) / colW)
    if currentColumns != columns
      columns = currentColumns
      $portfolio_container.width(columns * colW).isotope 'reLayout'
      $tools_container.width(columns * colW).isotope 'reLayout'
    return
  ).smartresize()

  $('.portfolioFilter a').click ->
    $('.portfolioFilter .current').removeClass 'current'
    $(this).addClass 'current'
    selector = $(this).attr('data-filter')
    $portfolio_container.isotope filter: selector
    false
  return
