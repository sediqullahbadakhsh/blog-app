User.create!({
               { name: 'Sara', photo: 'https://unsplash.com/photos/mEZ3PoFGs_k', bio: " simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," },
               { name: 'John', photo: 'https://unsplash.com/photos/d1UPkiFd04A', bio: " when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting" }
             })

Post.create!({
               { author_id: 1, title: 'how to draw', text: 'how to draw a someones face' },
               { author_id: 2, title: 'A simple article', text: "I don't know what I am writing" }
             ])

Comment.create!([
                  { author_id: 1, post_id: 1, text: 'Really nice' },
                  { author_id: 1, post_id: 1, text: 'Me niether' }
                ])
