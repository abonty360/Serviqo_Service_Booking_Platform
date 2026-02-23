<?php

namespace Tests\Feature;

use Tests\TestCase;

class AuthPagesTest extends TestCase
{
    /**
     * Test that the /login route returns a successful response and contains the login form.
     */
    public function test_login_page_is_accessible(): void
    {
        $response = $this->get('/login');

        $response->assertStatus(200);
        $response->assertSee('Welcome Back'); // Text from the login form
        $response->assertSee('Login to manage your bookings'); // Another text from login form
    }

    /**
     * Test that the /signup route returns a successful response and contains the registration form.
     */
    public function test_signup_page_is_accessible(): void
    {
        $response = $this->get('/signup');

        $response->assertStatus(200);
        $response->assertSee('Create Account'); // Text from the register form
        $response->assertSee('Join Serviqo today'); // Another text from register form
    }

    /**
     * Test that the home page no longer contains the login/register modals and has direct links.
     */
    public function test_home_page_does_not_contain_auth_modals_and_has_links(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
        $response->assertDontSee('id="loginModal"');
        $response->assertDontSee('id="registerModal"');
        $response->assertDontSee('onclick="toggleModal(\'loginModal\')"', false);
        $response->assertDontSee('onclick="toggleModal(\'registerModal\')"', false);
        $response->assertSee('<a href="/login"', false);
        $response->assertSee('<a href="/signup"', false);
    }
}
