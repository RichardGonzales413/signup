## Recent edits : Delete these once you've read them. They're for you not me. Also we could keep them for Ryan.
(8/1)
I've edited about 6 files in total. They're all in the Listing folder. We currently have a functioning "create product" page. Following the instructions in the documentation allows you to create a product, however it doesn't have a "Product Type Id" because it was giving errors. I could try to fix that later on but currently it's removed, but still works. Also, if you decide to try checking it out, you don't have to call it "listing". The name is optional, however, you would also have to rename all the file dependencies since they're using the "Listing" name. I'll work on changing the name later on but we're stuck with "listing" for now.

(8/3)
Continuing on from creating a product through the "localhost/listing" page, the product simply "existed". Now after you create the product, you'll be asked to enter in a Category to put it in. You need to enter the exact Category term for it to work currently. Also, once you submit that part, known as "step2", you'll be redirected to "complete". I don't know if these are separate pages and I can't get real redirects to work. I want "step2" to redirect to the Ecommerce site, but a temporary solution is loading a "complete" screen that just confirms the product has been moved to the Category. Everything is functional, but there's still a ton of things to change.

(8/8)
Very slow day, sorry. Most of the time was spent figuring out the security stuff. In the documentation I mentioned that I created a CUSTOMER security group that gives access to the Listing component. It also gives viewing access to Webtools since Listing still uses the Webtools template. However, you need to manually add users to the security group and I haven't figured out how to include it as an automatic service. I thought maybe I could add a form on one of the pages but make it hidden so it doesn't appear but you still need to Submit on forms so that's no good. Anyways, I'm working on automating the security groups as well as fixing the drop down menu for the "Step2" of the Listing component.

(8/10)
This was another slow day, sorry about that. I tried to automate the creating a product process but it's really difficult to understand how Ofbiz's system works. Some files I've uploaded have temporary edits and I probably shouldn't have included them but I thought they could work once I figure out how to code that. I'm writing a SECA (Service Event Condition Actions) to call all the services that are needed in the process for creating a product but nothing actually happens. I'll most likely eventually scrap the idea. The changes are highlighted in the documentation to show that it's temporary. On the bright side, one of the files allows new users to access the Listing component, which wasn't possible before. Next up is working on the Dependent Selects drop down menu during "Step 2" of creating a product.

(8/15)
There wasn't too much completed today either. I tried to focus on cleaning up the pages for the Listing page. I don't know how to remove fields from there, and the "auto-fields-service" seems to automatically load them. Deleting that results in the fields not loading at all, and manually typing out the fields makes the service not detect them. Other than that, the security permissions for the Customer group are fine now. Also I tried to replace our two services with createProductInCategory which would reduce the number of pages in Listing. However, it seems that this service can't be directly called or I implemented it wrong. I reverted all the changes back so there's nothing changed in our files except for a bunch of commented code for the failed implementation of the new service. As for the Dependent Selects drop down list, my Ofbiz populated the drop down list with "$description" so I think it had an error loading the categories even though I didn't change anything. I'm still working on that part too.


# Objectives

* Signup Page:
  1. CSS

* Model Listing Page:
  1. Need to delete unecessary entries - Need list of relevant fields from Gurudharam 
  2. Replace the Global Decorator from Webtools
  3. Fix "Product Type Id" field -LEFT AS AN OPTIONAL INPUT
  4. ~~Extend Service Permissions for new users to access localhost/listing~~ 
  5. Dependent Selects: "step2" needs a context sensitive form based on Models or Photographers - Drop Down Menu not working
  6. Redirects: Get rid of "complete" and possibly "step2"
  7. Create new entity to replace the Product entity since it refers to inanimate objects and not human beings
  8. Display listings on Ecommerce site. Create a Category for Models, Photographers, etc...

* Profiles: FUTURE

* Messaging: FUTURE
