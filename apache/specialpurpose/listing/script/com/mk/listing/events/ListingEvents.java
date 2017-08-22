package com.mk.listing.events;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.apache.ofbiz.base.util.Debug;
import org.apache.ofbiz.base.util.UtilMisc;
import org.apache.ofbiz.base.util.UtilValidate;
import org.apache.ofbiz.entity.Delegator;
import org.apache.ofbiz.entity.GenericValue;
import org.apache.ofbiz.service.GenericServiceException;
import org.apache.ofbiz.service.LocalDispatcher;
 
public class ListingEvents {
 
 public static final String module = ListingEvents.class.getName();
 
    public static String createListingEvent(HttpServletRequest request, HttpServletResponse response) {
        Delegator delegator = (Delegator) request.getAttribute("delegator");
        LocalDispatcher dispatcher = (LocalDispatcher) request.getAttribute("dispatcher");
        GenericValue userLogin = (GenericValue) request.getSession().getAttribute("userLogin");
 
        String internalName = request.getParameter("internalName");
        String productName = request.getParameter("productName");
 
        if (UtilValidate.isEmpty(productName) {
            String errMsg = "Internal Name is a required field. Use default input: testproduct.";
            request.setAttribute("_ERROR_MESSAGE_", errMsg);
            return "error";
        }
        String comments = request.getParameter("comments");
 
        try {
            Debug.logInfo("=======Creating Listing record in event using service createListingByGroovyService=========", module);
            dispatcher.runSync("createListingByGroovyService", UtilMisc.toMap("internalName", internalName, 
		"productName", productName, "comments", comments));
        } catch (GenericServiceException e) {
            String errMsg = "Unable to create new records in Product entity: " + e.toString();
            request.setAttribute("_ERROR_MESSAGE_", errMsg);
            return "error";
        }
        request.setAttribute("_EVENT_MESSAGE_", "Product created succesfully.");
        return "success";
    }
}
