$(function(){

$("#footer").stickyFooter({
    // The class that is added to the footer.
    class: 'sticky-footer',

    // The footer will stick to the bottom of the given frame. The parent of the footer is used when an empty string is given.
    frame: '',

    // The content of the frame. You can use multiple selectors. e.g. "#header, #body"
    content: '#page'
});

});

