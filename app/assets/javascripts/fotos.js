$(function(){

var $pswp = $('.pswp')[0];
var image = [];


$(".gallery").each(function(){
     var $pic = $(this),
        getItems = function() {
            var Items = [];
            $pic.find('figure').each(function(){

                var $mhref = $(this).find('img').attr('src'),
                    $href = $(this).find('a').attr('href'),
                    $size = $(this).find('a').data('size').split('x'),
                    $title = $(this).find('figcaption').html()
                    $width = $size[0],
                    $height = $size[1];


                var item = {
                    msrc: $mhref,
                    src: $href,
                    w  : $width,
                    h  : $height,
                    title: $title
                }
                Items.push(item);
            });
            return Items;
        };

    var items = getItems();
     $.each(items, function(index, value) {
            image[index]     = new Image();
            image[index].src = value['src'];
        });

    $('figure').on('click', function(event) {
        event.preventDefault();

        var $index = +$(this).data('index');

        var options = {
            index: $index,
            history:false
        }
       var lightBox = new PhotoSwipe($pswp, PhotoSwipeUI_Default, items, options);
       lightBox.init();
    });
    }); 
});


