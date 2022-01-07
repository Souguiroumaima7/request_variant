require "test_helper" 

class PostControllerTest < ActionDispatch : : IntegrationTest 
    setup do 
        @post = posts (:none) 
    end 
    test "should get index " do 
        get posts_url
        assert_response : success 
    end 
 test "should create post" do 
    assert_difference('post.count') do 
        post posts_url , params : {post : {published_at : @post.published_at, title : @post.title} 
    end 
    assert_redirected_to post_url (post.last) 
end 
test "should show post" do 
    get post_url(@post) 
    assert_response : success 
end 
 test "should get edit" do 
    get edit_post_url(@post) 
    assert_response : success 
 end 
 test "should update post" 
 patch post_url(@post), params: { post: { published_at: @post.published_at, title: @post.title } }
 assert_redirected_to post_url(@post)
end 
test "should destory post" do 
    assert_difference('Post.count' ,-1) do 
        delete post_url(@post) 
    end 
    assert_redirected_to posts_url 
end 
end 
