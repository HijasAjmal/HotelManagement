//  side menu toggle functionality begin
pinSidenav = function() {
    $('.sidenav-toggler').addClass('active');
    $('.sidenav-toggler').data('action', 'sidenav-unpin');
    $('body').removeClass('g-sidenav-hidden').addClass('g-sidenav-show g-sidenav-pinned');
    $('body').append('<div class="backdrop d-xl-none" data-action="sidenav-unpin" data-target='+$('#sidenav-main').data('target')+' />');
}

unpinSidenav = function() {
    $('.sidenav-toggler').removeClass('active');
    $('.sidenav-toggler').data('action', 'sidenav-pin');
    $('body').removeClass('g-sidenav-pinned').addClass('g-sidenav-hidden');
    $('body').find('.backdrop').remove();

}
