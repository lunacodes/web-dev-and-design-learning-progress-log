# WordPress Test Assertions

From: https://wpmudev.com/blog/unit-testing-wordpress-plugins-phpunit/

## Windows Issue

1. Add `PATH=$PATH:/c/laragon/bin/mysql/mysql-5.7.24-winx64/bin/` in `bin/install-wp-tests.sh` in order for this to work
2. Add `define( 'ABSPATH', 'C:\Users\lunac\AppData\Local\Temp/wordpress/' );` to `C:\Users\lunac\AppData\Local\Temp/wordpress/wp-tests-/config`

https://maheshwaghmare.com/fixed-php-unit-test-issue-php-warning-warning-fatal-error-failed-to-open-stream-no-such-file-mock-mailer-php-for-windows/

## Assertions for Errors

```php
$this->assertWPError($actual, $message)
$this->assertNotWPError($actual, $message)
$this->assertIXRError($actual, $message)
$this->assertNotIXRError($actual, $message)
// Assertions to test WP_Query for conditional tags
$this->assertQueryTrue($args)
// E.g. $this->assertQueryTrue('is_single', 'is_feed') means is_single() and is_feed() must be true to pass.
```

## WordPress Object Factories

Factories make it very simple to create posts, taxonomies, users, etc. They use the following three methods to create objects:

`create()` – returns the object ID of the created object
`create_and_get()` – creates and return the entire object
`create_many($count)` – creates multiple posts based on $count
To create a user and get its user id we can simply do –

`$user_id = $this->factory->user->create();`

Or to create a user with a specific WordPress role

`$user_id = $this->factory->user->create( array( 'role' => 'author' ) );`

Other factory types include post, attachment, comment, user, term, category, tag, blog, network.

### Examples of using Factories

```php
//create a tag
$tag_id = $this->factory->tag->create( array( 'slug' => 'tag-slug' ) );
$tax_with_slug_id = $this->factory->term->create( array( 'taxonomy' => 'tax', 'slug' => 'tax-slug-1' ) );

//create a category
$cat_id = $this->factory->category->create( array( 'slug' => 'cat-slug' ) );
$cat_with_slud_id = $this->factory->term->create( array( 'taxonomy' => 'tax', 'slug' => 'tax-slug-2' ) );

//create posts
$page_id = $this->factory->post->create( array( 'post_title' => 'My Page') ); $this->factory->post->create_many(15);
```

## Setup & tearDown

WP_UnitTestCase also provides its own setUp() and tearDown() methods, which can be used with PHPUnit’s setUp() and tearDown(). With tearDown, WP_UnitTestCase will reset the WordPress state that may have changed by a test method. And with setUp it’ll take care of clearing caches and resetting global variables. To use them, simply call them with parent::setUp() or parent::tearDown()

```php
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

For example, to run tests on the Edit Posts Administration screen:

```php
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

```php
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


