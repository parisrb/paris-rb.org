$(function() {
  $('[data-replace]').on('click', function() {
    let $toggle = $(this);
    let targetSelector = $toggle.data('replace');
    let $target = $(targetSelector);

    $target.css('height', 'initial');
    $toggle.hide();
  });
});
