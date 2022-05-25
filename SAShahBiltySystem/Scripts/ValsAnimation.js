$(document).ready(function () {




    $(".datepicker").datepicker();

    $(".customer_info,.location_info,.cosigment_info,.Vehicle_info,.product_info,.dispatch_info,.Reciving_info,.document_info,.expense_info,.damage_info").hide();
    $("#CollapseAll").click(function () {
        $(".customer_info,.location_info,.cosigment_info,.Vehicle_info,.product_info,.dispatch_info,.Reciving_info,.document_info,.expense_info,.damage_info").hide("slow");
        $("#ForCustomerInfo,#ForLocationInfo,#ForCosigmentInfo,#ForVehicleInfo,#ForProductInfo,#ForDispatchInfo,#ForRecievingInfo,#ForRecDocumentInfo,#ForReimbursableInfo,#ForDamageInfo").show("slow");
    });
    $("#hideAll").click(function () {
        $(".customer_info,.location_info,.cosigment_info,.Vehicle_info,.product_info,.dispatch_info,.Reciving_info,.document_info,.expense_info,.damage_info").hide("slow");
        $("#ForCustomerInfo,#ForLocationInfo,#ForCosigmentInfo,#ForVehicleInfo,#ForProductInfo,#ForDispatchInfo,#ForRecievingInfo,#ForRecDocumentInfo,#ForReimbursableInfo,#ForDamageInfo").show();
    });
   


    //OPEN SPECIFIC PANEL ON DROPDOWN BUTTON
    $("#lnkCI").click(function () {
        $(".customer_info").show("slow");
    });
    $("#lnkLI").click(function () {
        $(".location_info").show("slow");
    });
    $("#lnkCosI").click(function () {
        $(".cosigment_info").show("slow");
    });
    $("#lnkVI").click(function () {
        $(".Vehicle_info").show("slow");
    });
    $("#lnkPI").click(function () {
        $(".product_info").show("slow");
    });
    $("#lnkDD").click(function () {
        $(".dispatch_info").show("slow");
    });
    $("#lnkRI").click(function () {
        $(".Reciving_info").show("slow");
    });
    $("#lnkDI").click(function () {
        $(".document_info").show("slow");
    });
    $("#lnkEI").click(function () {
        $(".expense_info").show("slow");
    });
    $("#Damage").click(function () {
        $(".damage_info").show("slow");
    });


    //LOAD MORE FUNCTIOANLITY
   

    //HIDE PANEL ON CLOSE BUTTON


    $("#CI").click(function () {

        $(".customer_info").fadeOut(800);
    });

    $("#LI").click(function () {

        $(".location_info").fadeOut();
    });

    $("#Cons").click(function () {

        $(".cosigment_info").fadeOut();
    });

    $("#VI").click(function () {

        $(".Vehicle_info").fadeOut();

    });

    $("#PI").click(function () {

        $(".product_info").fadeOut();

    });

    $("#dispatch").click(function () {

        $(".dispatch_info").fadeOut();

    });

    $("#RI").click(function () {

        $(".Reciving_info").fadeOut();

    });


    $("#DI").click(function () {

        $(".document_info").fadeOut();

    });

    $("#EI").click(function () {

        $(".expense_info").fadeOut();

    });

    $("#DMG").click(function () {

        $(".damage_info").fadeOut();

    });

})
