document.addEventListener("DOMContentLoaded", function() {
    var thumbs = document.querySelectorAll('.product-miniature .thumbnail-container');
    thumbs.forEach(function(thumb) {
        var existing = thumb.querySelectorAll('.custom-ring-outer, .custom-ring-inner');
        existing.forEach(e => e.remove());

        var outerRing = document.createElement('div');
        outerRing.className = 'custom-ring-outer';
        
        var innerRing = document.createElement('div');
        innerRing.className = 'custom-ring-inner';

        thumb.appendChild(outerRing);
        thumb.appendChild(innerRing);
    });

    var selectors = '.featured-products .products, .bestsellers-products .products, .new-products .products, .viewed-products .products';
    var productLists = document.querySelectorAll(selectors);

    productLists.forEach(function(list) {
        var wrapper = document.createElement('div');
        wrapper.style.position = 'relative';
        wrapper.style.margin = '0 60px';
        
        list.parentNode.insertBefore(wrapper, list);
        wrapper.appendChild(list);

        var leftBtn = document.createElement('button');
        leftBtn.className = 'custom-arrow-btn custom-arrow-left';
        
        var rightBtn = document.createElement('button');
        rightBtn.className = 'custom-arrow-btn custom-arrow-right';

        var scrollItem = function(direction) {
            var item = list.querySelector('.product-miniature');
            if (item) {
                var width = item.offsetWidth + 50;
                
                if (direction === 'left') {
                    list.scrollBy({ left: -width, behavior: 'smooth' });
                } else {
                    list.scrollBy({ left: width, behavior: 'smooth' });
                }
            }
        };

        leftBtn.onclick = function() { scrollItem('left'); this.blur(); };
        rightBtn.onclick = function() { scrollItem('right'); this.blur(); };

        wrapper.appendChild(leftBtn);
        wrapper.appendChild(rightBtn);
    });
});