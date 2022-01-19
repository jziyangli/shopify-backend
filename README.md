# shopify-backend
## How to run
* Make sure that ASP.NET and web development is workload is installed under Visual Studio Installer
* Clone the project and open in visual studio
* If project is unloaded, right click and select 'Reload with Dependenies'
* Open Package Manager Console under View->Other WIndows->Package Manager Console
  * PM> add-migration init
  * PM> update-database
* Run the application
  * There are 2 tabs, Inventory and Tags
  * Tags are essentially categories that can be assigned to products.
    * You are able to create, view, edit, and delete tags and view the products associated with each tag under 'Details'
    * Under details, you can click on a product and view that product's details
  * Products can be created and modified under the Inventory page.
    * Products can be associated with multiple tags
    * You are able to see all of the products tags and view the tag details under 'Details' for each product
    * You can filter the inventory by specific tags using the search bar at the top.
      * The filter matches substrings of tags so searching 'abc' will show the products with tags 'abc', 'abcd', and 'abcz'
