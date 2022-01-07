require "application_system_test_case" 

class PostsTest < ApplicationSystemTestCase 
    setup do 
        @post = posts(: one) 
    end 
    test "visiting the index" do 
        visit posts_url 
        assert_selector "h1" , text : "posts" 
    end 
 test "creating a post " do 
    visit posts_url 
    click_on "New Post" 

fill_in "published at" , with : @post_url.published_at
fill_in "Title" , with : @post.title 
click_on "Create Post" 

assert_text "Post was successfully created" 
click_on "Back" 
 end 
 test "updating a post " do 
    visit posts_url 
    click_on "edit" , match : first 
    fill_in "published at " , with @post.published_at 
    fill_in "title" , with @post.title
    click_on "update post" 
    assert_text "post was successfully updated" 
    click_on "back" 
 end 
 test "destroying a post" do 
    visit posts_url 
    page.accept_confirm do 
        click_on "destroy" , match :first
    end 
    assert_text "post was successfully destroyed" 
end 
end 

