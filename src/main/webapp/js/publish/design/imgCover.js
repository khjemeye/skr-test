// 차량, 이미지 크기에 상관없이 가로세로 무조건 가운데 꽉채워서 뜨게함
$(document).ready(function() {
    // Detect objectFit support
    if('objectFit' in document.documentElement.style === false) {

        // assign HTMLCollection with parents of images with objectFit to variable
        var container = document.getElementsByClassName('imgWrap'); // img를 감싸고 있는 div의 class name 을 써주세요.

        // Loop through HTMLCollection
        for(var i = 0; i < container.length; i++) {

            // Asign image source to variable
            var imageSource = container[i].querySelector('img').src;

            // Hide image
            container[i].querySelector('img').style.display = 'none';

            // Add background-size: cover
            container[i].style.backgroundSize = 'cover';

            // Add background-image: and put image source here
            container[i].style.backgroundImage = 'url(' + imageSource + ')';

            // Add background-position: center center
            container[i].style.backgroundPosition = 'center center';
        }
    }
    else {
        // You don't have to worry
        console.log('No worries, your browser supports objectFit')
    }
});