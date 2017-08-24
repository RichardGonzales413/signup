## Recent edits : We can keep summaries of what we've done here.
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

(8/22)
A lot of random changes. I'm sorry I know I should focus on one task but I get stuck a lot. Anyways, there's a lot of experimental changes that I've started. The first is the Groovy service that calls "createProduct" from the localhost/listing/control/createListing page. This currently does not detect the correct filepath for the Groovy file. Second, we have the Event that calls the Groovy service with some modifications. This is accessed at /listing/control/createListingEvent and currently has errors because I didn't include every attribute from Product. I assumed I could specify which entries I wanted but I guess events don't work like that. Lastly, there's the Listing.ftl file that I'm hoping will become a permanent change. It's accessed at listing/control/testListing and this one actually manages to succeed at showing specific entries from the createProduct form. I'm planning to work on this and hopefully make a decent looking page with it. Unfortunately the guide I'm using tied it to the event they were using, so it's unable to create a product currently. I'm planning to remove the event dependencies so we just have a functioning page with the ftl changes. Also, forgot to mention that the drop down menu is actually working for some reason but it shows a bunch of blanks and the descriptions for each category. I've edited one of the categories to have a noticable description and I saw 5 repeated entries for it in the drop down list. Something weird is going on with that, but it actually does work in assigning the product to be placed into that category.

(8/23)
Some actual progress! There are 2 changes so far that are looking to be permanent additions to the project. The first is small but I've looked into the CSS on the sign up page. In the documentation, under the Sign Up Page section, you'll find some stuff on some edits I did that look relatively decent. Honestly with those edits the sign up page is practically complete unless you wanted to edit further. The secod thing is replacing the pages with ftl files. These are called Freemarker Template and act as a limited sort of HTML file. This sucks because I'd love to use HTML but it's better than what I was working with before. Anyways, for the Listing component I've replaced the "main" screen and "step2" so we have a cleaner looking form for both. The drop down list is now fully functional and shows "Model" and "Photographer", which are 2 categories I manually created in Web Tools which I forgot to add to the documentation. In addition, there's a script on the "main" page that generates a unique productId based on the time. The problem is that I don't know yet how to automate that into the form as a hidden automatic thing. Furthermore, the "step2" is completely independent from "main" so it doesn't get that unique productId. I'm looking into ways to save that productId from "main" and transfer it into "step2". But other than that the ftl files are working great and allow me to try some new stuff.

(8/24)
I think the ftl files are a way better solution than what I've had previously. However, I've been attempting to recreate the Listing component using our own custom made entity and service. We have two entities that are defined inside the Listing component, Listing and ListingType. These are used by the service createListing. All of this was configured to be accessed at localhost/listing/control/Listing but somehow there was an error. I found out I made a small typo in the entity definition. However, once it was running, I wasn't able to create a "Listing" entity. There was something wrong with the way the values were interacting. I'll have to look into this further and hopefully we can use these custom created services and entities within our ftl files for further customization as well as replacing step2 since we can combine all that information into a single entity.


# Objectives

* Signup Page:
  1. CSS

* Model Listing Page:
  1. ~~Need to delete unecessary entries~~ - Use Google Slide as reference
  2. Replace the Global Decorator from Webtools
  3. Fix "Product Type Id" field -LEFT AS AN OPTIONAL INPUT
  4. ~~Extend Service Permissions for new users to access localhost/listing~~ 
  5. Dependent Selects: "step2" needs a context sensitive form based on Models or Photographers
  6. Redirects: Get rid of "complete" and possibly "step2"
  7. Create new entity to replace the Product entity since it refers to inanimate objects and not human beings
  8. Display listings on Ecommerce site.

* Profiles: FUTURE

* Messaging: FUTURE
