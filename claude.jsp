//claude code

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<body>
    <div class="site-wrap">
        <jsp:include page="templates/header.jsp"/>

        <header class="bg-light py-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mb-0"><a href="/" tabindex="0">Home</a> <span class="mx-2 mb-0">/</span> <strong
                            class="text-black" tabindex="0">Cart</strong></div>
                </div>
            </div>
        </header>

        <main class="site-section" tabindex="-1">
            <form class="container" method="post" action="checkout" role="form" aria-label="Shopping cart">
                <div class="row mb-5">
                    <div class="col-md-12">
                        <div class="site-blocks-table">
                            <table class="table table-bordered" role="grid">
                                <thead>
                                    <tr>
                                        <th class="product-thumbnail">Image</th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-total">Total</th>
                                        <th class="product-remove">Remove</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${order.cartProducts}" var="o">
                                        <tr>
                                            <td class="product-thumbnail">
                                                <img src="data:image/jpg;base64,${o.product.base64Image}" alt="${o.product.name} Thumbnail" class="img-fluid">
                                            </td>

                                            <td>
                                                <input name="product-name" class="form-control-plaintext h5 text-black"
                                                    value="${o.product.name}" style="text-align: center" readonly>
                                            </td>

                                            <td>
                                                <input name="product-price" class="form-control-plaintext h5 text-black"
                                                    value="${o.price}" style="text-align: center" readonly>
                                            </td>

                                            <td style="min-width: 180px">
                                                <div class="input-group" style="max-width: fit-content; margin: 0;">
                                                    <div class="input-group-prepend">
                                                        <button
                                                            class="btn btn-outline-primary js-btn-minus"
                                                            type="button" aria-label="Decrease quantity">
                                                            &minus;
                                                        </button>
                                                    </div>

                                                    <input name="product-quantity" type="text"
                                                        class="form-control text-center" value="${o.quantity}"
                                                        placeholder="" aria-label="Quantity" aria-describedby="button-addon1" role="spinbutton" aria-valuenow="${o.quantity}" aria-valuemin="0">

                                                    <div class="input-group-append">
                                                        <button
                                                            class="btn btn-outline-primary js-btn-plus"
                                                            type="button" aria-label="Increase quantity">
                                                            &plus;
                                                        </button>
                                                    </div>
                                                </div>
                                            </td>

                                            <td>
                                                <input name="product-price-total"
                                                    class="form-control-plaintext h5 text-black"
                                                    value="${o.price * o.quantity}" style="text-align: center"
                                                    readonly>
                                            </td>

                                            <td><a href="cart?remove-product-id=${o.product.id}"
                                                    class="btn btn-primary btn-sm" aria-label="Remove product">Remove</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row mb-5">
                    <div class="col-md-8 mb-3 mb-md-0">
                        <div class="row">
                            <div class="col-md-12">
                                <label class="text-black h4" for="coupon">Coupon:</label>
                                <p>Enter your coupon code if you have one.</p>
                            </div>
                            <div class="col-md-12">
                                <label for="coupon-input" class="sr-only">Coupon Code:</label>
                                <input type="text" id="coupon-input" name="coupon" class="form-control py-3" placeholder="Enter Coupon Code" tabindex="0">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-primary btn-sm" type="button" id="apply-coupon-btn" tabindex="0" aria-label="Apply Coupon">Apply Coupon</button>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="row mb-5">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <a href="shop" class="btn btn-outline-primary btn-sm btn-block" tabindex="0">Continue
                                    shopping</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 pl-5">
                        <div class="row justify-content-end">
                            <div class="col-md-7">
                                <div class="row">
                                    <div class="col-md-12 text-right border-bottom mb-5">
                                        <h3 class="text-black h4 text-uppercase" tabindex="0">Cart Totals</h3>
                                    </div>
                                </div>
                                <div class="row mb-5">
                                    <div class="col-md-6" tabindex="-1">
                                        <span tabindex="0" class="text-black">Total</span>
                                    </div>
                                    <div class="col-md-6 text-right" tabindex="0">
                                        <input name="order-price-total"
                                            class="form-control-plaintext h5 text-black"
                                            value="${total_price}" style="text-align: center"
                                            readonly tabindex="0">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <button class="btn btn-primary btn-lg py-3 btn-block" type="button" id="proceed-to-checkout-btn" tabindex="0" aria-label="Proceed To Checkout">Proceed To Checkout</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </main>

        <jsp:include page="templates/footer.jsp"/>
    </div>

    <jsp:include page="templates/scripts.jsp"/>

    <script>
        // JavaScript for handling alternative ways of form submission

        document.getElementById("apply-coupon-btn").addEventListener("click", function () {
            document.forms[0].submit(); // Submit the form when the "Apply Coupon" button is clicked
        });

        document.getElementById("proceed-to-checkout-btn").addEventListener("click", function () {
            window.location.href = "checkout.jsp"; // Redirect to the checkout page when the "Proceed To Checkout" button is clicked
        });

        // JavaScript for updating quantity value for screen readers
        $('.js-btn-minus').click(() => {
            // update input value
            input.value--;
            input.setAttribute('aria-valuenow', input.value);
        });

        $('.js-btn-plus').click(() => {
            // update input value
            input.value++;
            input.setAttribute('aria-valuenow', input.value);
        });

        // JavaScript for form validation
        $("form").submit(function () {
            if (inputsInvalid) {
                // set focus and announce error
                return false;
            }
        });
    </script>

</body>
</html>
