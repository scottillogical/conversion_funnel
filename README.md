conversion_funnel
=================

Rails (example) app for hosting easily customizable landing pages to drive SEM at.

# Goal/features

- Be able to create many sets of entirely unique landing pages.
- Supports a/b testing different landing pages against one and other at the targeting level
- Be able to inject a/b tests at different levels inside of those landing pages (content, forms, design, etc - try to keep these landing pages * plain old rails * for ease of customization
- Seperate "targeting" (aka mapping a keyword/ad to a specific landing page) and the actual display of landing pages
- Provides full end to end tracking of click to conversion while recording all the relevant data
- Designers can create new landing pages using just HTML/CSS - no need for a CMS.
- Supports landing page customization via query string parameters


# Tour

**app/controllers/targets_controller**  
This is where you store all your entry points into the application.  Typically you will have at least 2: one for google/sem traffic, and another for testing.  

**app/controllers/conversions_controller**  
Handles rendering actual experiences, responses from users.

**app/views/experiences**  
Here you can create new "experiences" (otherwise known as landing pages).   Each contains a set of views (namespaced by resoures) and a css file for easy of creating custom css just for this experience, which is common.  

Views typically contain forms for users to submit their info or CTAs (calls to action) to jump off to another page to submit their info

Creating new experiences is a simple as copying an existing experience, renaming the assets, and then viewing the experiene via the preview url localhost:3000/targets/preview?experience=my_experience


# Glossary

**Arrival**   
Kind of like a session.  Stores references to which ad the user clicked on, and what landing page they were shown.

**Conversion**   
A conversion typically stores the users answers.

**Form**  
Stored in the code for maximum flexibility.  Forms in some cases might be database driven for ease of administration, but in other case, you want to be able to create and deploy new experiences with specific sets of questions.  Other times, you might want to a/b test specific question sets without the overhead of an entire database structure and admin. 
