(function () {
    function updateQty(button, delta) {
        var wrap = button.closest('.cart-qty');
        if (!wrap) {
            return;
        }
        var input = wrap.querySelector('.qty-input');
        if (!input) {
            return;
        }
        var current = parseInt(input.value, 10);
        if (isNaN(current) || current < 1) {
            current = 1;
        }
        var next = current + delta;
        if (next < 1) {
            next = 1;
        }
        input.value = next;
    }

    document.addEventListener('click', function (event) {
        var target = event.target;
        if (target.classList.contains('qty-btn')) {
            var action = target.getAttribute('data-action');
            updateQty(target, action === 'plus' ? 1 : -1);
        }
    });
})();
