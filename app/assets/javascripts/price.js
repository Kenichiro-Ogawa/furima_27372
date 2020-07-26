$(function () {
  $(".price-input").on("change", function () {
    let fee = $(".price-input").val() * 0.1;
    let profit = $(".price-input").val() - fee;
    $("#add-tax-price").append(fee);
    $("#profit").append(profit);
  });
});
