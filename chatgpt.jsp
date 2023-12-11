// chatgpt code

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="templates/head.jsp"/>

<body>
<div class="site-wrap">
    <jsp:include page="templates/header.jsp"/>

    <!-- Skip to Content Link -->
    <a href="#main-content" class="sr-only sr-only-focusable">Skip to main content</a>

    <div class="bg-light py-3">
        <div class="container">
            <div class="row">
                <div class="col-md-12 mb-0"><a href="/" tabindex="0">Home</a> <span class="mx-2 mb-0">/</span> <strong
                        class="text-black" tabindex="0">Cart</strong></div>
            </div>
        </div>
    </div>

    <div class="site-section" tabindex="-1">

        <form class="container" method="post" action="checkout">
            <!-- Form Validation Message -->
            <div role="alert" id="form-validation-error" aria-live="assertive" aria-atomic="true">
                <!-- Your form validation error message goes here -->
            </div>

            <div class="row mb-5">
                <div class="col-md-12">
                    <div class="site-blocks-table">
                        <table class="table table-bordered">
                            <!-- Existing table content -->
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="row mb-5">
                        <div class="col-md-6 mb-3 mb-md-0">
                            <a href="shop" class="btn btn-outline-primary btn-sm btn-block" tabindex="0">Continue shopping</a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="text-black h4" for="coupon">Coupon:</label>
                            <p>Enter your coupon code if you have one.</p>
                        </div>
                        <div class="col-md-8 mb-3 mb-md-0">
                            <label for="coupon-input" class="sr-only">Coupon Code:</label>
                            <input type="text" id="coupon-input" name="coupon" class="form-control py-3" placeholder="Enter Coupon Code" tabindex="0">
                        </div>
                        <div class="col-md-4">
                            <button class="btn btn-primary btn-sm" type="button" id="apply-coupon-btn" tabindex="0">Apply Coupon</button>
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
                                    <span class="text-black" style="font-size: 1.5em">Total</span>
                                </div>
                                <div class="col-md-6 text-right" tabindex="0">
                                    <input name="order-price-total" class="form-control-plaintext h5 text-black" value="${total_price}" style="text-align: center" readonly tabindex="0">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <button class="btn btn-primary btn-lg py-3 btn-block" type="button" id="proceed-to-checkout-btn" tabindex="0">Proceed To Checkout</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- Toggle High Contrast Button -->
        <button onclick="toggleHighContrast()" class="btn btn-secondary btn-sm" style="position: fixed; bottom: 10px; right: 10px;">Toggle High Contrast</button>

    </div>

    <jsp:include page="templates/footer.jsp"/>
</div>

<jsp:include page="templates/scripts.jsp"/>

<script>
    // JavaScript for handling alternative ways of form submission

    document.getElementById("apply-coupon-btn").addEventListener("click", function() {
        document.forms[0].submit(); // Submit the form when the "Apply Coupon" button is clicked
    });

    document.getElementById("proceed-to-checkout-btn").addEventListener("click", function() {
        window.location.href = "checkout.jsp"; // Redirect to the checkout page when the "Proceed To Checkout" button is clicked
    });

    // JavaScript function to toggle high contrast mode
    function toggleHighContrast() {
        const bodyElement = document.body;

        // Toggle the 'high-contrast' class on the body
        bodyElement.classList.toggle('high-contrast');
    }
</script>

</body>
</html>
    
