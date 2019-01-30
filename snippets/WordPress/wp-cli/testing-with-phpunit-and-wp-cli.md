# WP-CLI and PHP Unit Testing

Source: [WPMU Dev - Unit Testing WordPress Plugins with PHPUnit](https://premium.wpmudev.org/blog/unit-testing-wordpress-plugins-phpunit/)

```bash
$cd /srv/www/wordpress-installation
$wp scaffold plugin-tests your_plugin
$sh  wp-content/plugins/your_plugin/bin/install-wp-tests.sh  <db_args>
```

PHPUnit will overwrite the WordPress database so it’s best to use a fresh installation or create a backup of your existing one. Needless to say, don’t run it in your production environment.

I’ll refer to folders as directories when working in the Linux VM.

Let’s walk through this in detail. You can also refer to the WP-CLI handbook.

## The Basics

### Step#1

To set up PHPUnit with your WordPress plugin, start your Vagrant instance with vagrant up and then ssh into it with vagrant ssh. Once you’re in, navigate to the root directory of your WordPress installation.

In my case, I’m working with the WordPress installation test.dev

>$cd /srv/www/test/htdocs/

Navigate to WordPress install
### Step#2

Your plugin (from your host machine) should already be available in the wp-contents directory. To configure unit tests for the plugin, we need to use the WP-CLI’s scaffold command as below:

wp scaffold plugin-tests your_plugin

>$wp scaffold plugin-tests phpunit-demo-plugin


This is what just happened:

Cat test sample
If you now check your plugin’s directory, you’ll notice a few additional files, the most important being in the test subdirectory. PHPUnit will automatically run any tests (files prefixed with test-) it finds under the tests directory. The auto discovery happens through the phpunit.xml, which is the main manifest file that tells PHPUnit where to find the tests and how things are setup.

PHP Unit XML
### Step#3

We now only need to set up a testing copy of the database for our plugin. When tests are run, PHPUnit will use this for our test environment. If you wish to use a working db instance, be sure to back it up.

We need to execute the install-wp-tests.sh script located under “bin/” that was also created by the wp scaffold command:

bash plugin_dir/bin/install-wp-tests.sh db_name db_user db_password db_host version

db_name is the name of the test database (all data will be deleted!)
db_user is the MySQL user name
db_pass  is the MySQL user password
db_host is the MySQL server host
Version is the WordPress version
>$bash bin/install-wp-tests.sh wordpress_test root root localhost latest

Install WP tests
### Step#4

To test if everything installed correctly, all you need to do is run the command phpunit. A sample test file test-sample.php that was created earlier will be executed.

>$phpunit


## WordPress Testing API
Writing Unit Tests for WordPress
If you look at the included test-sample.php under tests, you’ll notice that the class SampleTest extends WP_UnitTestCase and not PHPUnit_Framework_TestCase. That’s because WordPress ships with its own testing library that offers WordPress specific functionality and is built on top of PHPUnit_Framework_TestCase.

With WP_UnitTestCase, every method that begins with test will be run automatically.

When we ran phpunit above, the test_sample() was executed as it was prefixed with test_ and asserted that True was true.

Guarantee Stamp1.6 million WordPress Superheroes read and trust our blog. Join them and get daily posts delivered to your inbox - free!
Email address
Your email address
 SUBSCRIBE
WP unit test case
Here’s how we can make use of WP_UnitTestCase for our own tests:

WP_UnitTestCase provides us with Object Factories, Utility Methods, and WordPress specific assertions in addition to assertions provided by PHPUnit,

### WordPress Test Assertions

#### Assertions for Errors
$this->assertWPError($actual, $message)
$this->assertNotWPError($actual, $message)
$this->assertIXRError($actual, $message)
$this->assertNotIXRError($actual, $message)
Assertions to test WP_Query for conditional tags
$this->assertQueryTrue($args)
E.g. $this->assertQueryTrue('is_single', 'is_feed') means is_single() and is_feed() must be true to pass.

### WordPress Object Factories

Factories make it very simple to create posts, taxonomies, users, etc. They use the following three methods to create objects:

```php
create() – returns the object ID of the created object
create_and_get() – creates and return the entire object
create_many($count) – creates multiple posts based on $count
To create a user and get its user id we can simply do –

$user_id = $this->factory->user->create();

Or to create a user with a specific WordPress role

$user_id = $this->factory->user->create( array( 'role' => 'author' ) );
```

Other factory types include post, attachment, comment, user, term, category, tag, blog, network.

Examples of using Factories

```php
<?php
//create a tag
$tag_id = $this->factory->tag->create( array( 'slug' => 'tag-slug' ) );
$tax_with_slug_id = $this->factory->term->create( array( 'taxonomy' => 'tax', 'slug' => 'tax-slug-1' ) );
//create a category
$cat_id = $this->factory->category->create( array( 'slug' => 'cat-slug' ) );
$cat_with_slud_id = $this->factory->term->create( array( 'taxonomy' => 'tax', 'slug' => 'tax-slug-2' ) );
//create posts
$page_id = $this->factory->post->create( array( 'post_title' => 'My Page') ); $this->factory->post->create_many(15);
You can find more details about each factory on the WordPress Trac
```
## Additional setUp() and tearDown()

WP_UnitTestCase also provides its own setUp() and tearDown() methods, which can be used with PHPUnit’s setUp() and tearDown(). With tearDown, WP_UnitTestCase will reset the WordPress state that may have changed by a test method. And with setUp it’ll take care of clearing caches and resetting global variables. To use them, simply call them with parent::setUp() or parent::tearDown()

For example:

```php
<?php
class SomeTest extends WP_UnitTestCase {

    public function setUp() {
        parent::setUp();

        $this->editor_user_id = $this->factory->user->create( array( 'role' => 'editor' ) );
        //set the current user to the newly created user
        wp_set_current_user( $this->editor_user_id );
    }

    public function tearDown() () {
        parent::tearDown();
    }
//rest of the code ...
}
```
The WordPress tests run on the root page of your website. To run tests on a different page, you’ll have to instruct it to do so.

For example, to run tests on the Edit Posts Administration screen:

```php
<?php
class SomeTest extends WP_UnitTestCase {

    public function setUp() {
        parent::setUp();

        set_current_screen('edit.php');
        //this will cause is_admin to return true

        $this->assertTrue( is_admin() );

        }
    //rest of the code ...
}
```

If you want to test by navigating to a specific url you can make use of $this->go_to($url), and then test with assertQueryTrue

For example:

```php
<?php
class Some_Test extends WP_UnitTestCase {
        function test_some_page() {

                $this->go_to( '/' );
                $this->assertQueryTrue ( 'is_home', 'is_front_page' );

                $this->go_to( '/?p=123456789' );
                $this->assertQueryTrue( 'is_404' );
    }
    //rest of the code ...
}
```

## Testing Our Plugin (Finally!)

Let’s use this information and write some tests for our demo plugin. Here’s the link to the phpunit-demo-plugin, which adds an additional user meta item when a new user of type “Editor” is created. It also displays the user meta on the profile screens for administrators and the user to modify.

Start by deleting the test-sample.php from the tests directory, and create a new file, test-phpunit-demo-plugin.php.

Note: I’ll be writing my tests in NetBeans on my host, and will run them with PHPUnit on the VVV instance. All changes will be auto-synced between the two systems. This way I can take advantage of auto completion, code reference, and debugging using Xdebug with NetBeans.


Now let’s write some tests for our plugin. Here we are creating a user with the role of “author”, and checking that the meta key was not created.

```php
<?php
/**
 * Test case for the PHPUnit Demo Plugin
 */
class PhpUnitDemoPluginTest extends WP_UnitTestCase {
    public function setUp() {
            parent::setUp();
    }
    public function tearDown() {
            parent::tearDown();
    }
    /**
     * Test add_user_meta for new user with author role
     */
    function test_nds_custom_meta_add() {
            $factory_user_id = $this->factory->user->create( array('role' => 'author') );
            $get_user_meta = get_user_meta($factory_user_id, 'preferred_browser', true );

            //an empty string will be returned as the user was not an editor
            $this->assertEquals($get_user_meta, '');
    }

}
```

When you run the test using phpunit (I’m using phpunit --debug for a detailed output) it should pass:

First unit test
Now, let’s create a failing test by creating a user with a role of “Editor,” and then compare the user meta value for preferred_browser with an empty string.

First failing test code
On running phpunit the test fails.

First failed test phpunit
Note: When an assertion fails, no other tests are run. You can modify this behavior in phpunit.xml.

To fix this, we can either test that the meta value was not empty or perform a string comparison for “chrome”. Also, we’ll split the tests into two functions – to test users with and without an “Editor” role. This way, by separating the assertions, we have a good model to find bugs as they appear.

```php
<?php
    /**
     * Test add_user_meta for new user with a non-editor role
     */
    function test_nds_custom_meta_add_for_non_editors() {
            $factory_user_id = $this->factory->user->create( array('role' => 'author') );
            $get_user_meta = get_user_meta($factory_user_id, 'preferred_browser', true );
            //an empty string will be returned as user was not an editor

            $this->assertEquals($get_user_meta, '');

    }

    /**
     * Test add_user_meta for new user with an editor role
     */
    function test_nds_custom_meta_add_for_editors() {

            $factory_editor_id = $this->factory->user->create( array('role' => 'editor') );
            $get_editor_user_meta = get_user_meta($factory_editor_id, 'preferred_browser', true );

            //for users with editor role meta key for preferred browser cannot be empty
            $this->assertEquals($get_editor_user_meta, 'chrome');
    }
```

### Passing test metakey chrome
Testing callback or its priority

In our plugin, we added a callback for the user_register action hook with a priority value different from the default one of 10. Here, we can use the has_action function, which returns the priority of the callback on a specified hook.

A failing test as the priority needs to be greater than 10

Failing test callback code

Passing the test with a priority check greater than 10


### Testing form submission

To test whether the preferred_browser field is correctly updated from the user’s profile, we’ll have to spoof the POST variable, and then call the method that updates the user meta. This is testing in isolation. We’re only concerned about our plugin’s function that updates the meta, and not with the rest of the system like if the profile form was submitted correctly or not.

A failing test after updating the meta value

Failing test meta update code
Failing test meta update phpunit
A passing test by comparing that preferred_browser was updated to Opera


Passing test meta update phpunit
Here is the complete code for the tests in this post:

```php
<?php
/**
 * Class PhpUnitDemoPluginTest
 *
 * @package Phpunit_Demo_Plugin
 */
/**
 * Test case for the PHPUnit Demo Plugin
 */
class PhpUnitDemoPluginTest extends WP_UnitTestCase {
    public function setUp() {
            parent::setUp();
    }
    public function tearDown() {
            parent::tearDown();
    }
    /**
     * Test add_user_meta for new user with a non-editor role
     */
    function test_nds_custom_meta_add_for_non_editors() {
            $factory_user_id = $this->factory->user->create( array('role' => 'author') );
            $get_user_meta = get_user_meta($factory_user_id, 'preferred_browser', true );
            //an empty string will be returned as user was not an editor

            $this->assertEquals($get_user_meta, '');

    }

    /**
     * Test add_user_meta for new user with an editor role
     */
    function test_nds_custom_meta_add_for_editors() {

            $factory_editor_id = $this->factory->user->create( array('role' => 'editor') );
            $get_editor_user_meta = get_user_meta($factory_editor_id, 'preferred_browser', true );

            //for users with editor role meta key for preferred browser cannot be empty
            $this->assertEquals($get_editor_user_meta, 'chrome');
    }

    /**
     * Test callback priority
     */
    function test_callback_for_user_register() {
            $this->assertGreaterThan(
                    10,
                    has_action( 'user_register', 'nds_custom_meta_add' )
                    );
    }

    /**
     * Test meta value update
     */
    function test_nds_custom_meta_update_for_editors() {
            $factory_editor_id = $this->factory->user->create( array('role' => 'editor') );
            $get_editor_user_meta = get_user_meta($factory_editor_id, 'preferred_browser', true );

            //for new users with editor role the default meta value for preferred_browser is chrome
            $this->assertEquals($get_editor_user_meta, 'chrome');

            //spoof $_POST
            $_POST['preferred_browser'] = 'opera';

            //make sure we are admin
            wp_set_current_user(1);

            //call the update method
            nds_update_usermeta_field_browser($factory_editor_id);
            $get_editor_user_meta = get_user_meta($factory_editor_id, 'preferred_browser', true );

            //test the meta value was updated correctly
            $this->assertEquals($get_editor_user_meta, 'opera');
    }

}
```


## Real World Examples of Unit Tests in WordPress
Here are some tests I wrote for a simple admin plugin utility that uses object-oriented constructs.

Note: To take advantage of PHPUnit TestDoubles in a plugin without a class you’ll need to use namespaces, and PHP 5.3 or above.

For some advanced test examples check out:

* Tests for the WordPress core
* WooCommerce Unit Tests
* Tests for ajax requests
* WordPress API Mocking Framework
* Testing a WordPress Theme

A simple way to test a WordPress theme is to use Theme Unit Test Data. We’ve got a great article that explains how to set it up.

If your theme provides plugin-like functionality or you want to make use of PHPUnit you can have a look at Tom McFarlin’s Basic Theme tests. How you set it up will depend on the structure of your theme.

## Test Driven Development (TDD)
TDD is a software design paradigm where unit tests are written first, and then the code is written to pass the tests. The idea is to write failing unit tests, and then writing code to pass those tests. The cycle continues until all missing functionality has been added. With each iteration, the code is refactored without changing the behavior. Whether you use TDD or not writing tests as you develop is the key here.

## Taking Plugin Unit Tests Further
I hope this article helps you get started with PHPUnit tests in WordPress. You could also look at automating your tests using a task runner like gulp or grunt. Finally, you can follow WordPress Trac, which will help you write tests using best practices for WordPress.

## Additional Resources
https://make.wordpress.org/cli/2013/02/19/plugin-unit-tests/
http://wordpress.tv/?s=unit+test
https://carlalexander.ca/introduction-wordpress-unit-testing/
https://jtreminio.com/2013/03/unit-testing-tutorial-part-5-mock-methods-and-overriding-constructors/

