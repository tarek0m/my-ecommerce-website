-- Insert categories
INSERT INTO categories (name) VALUES 
('all'),
('clothes'),
('tech');

-- Get category IDs for reference
SET @all_id = (SELECT id FROM categories WHERE name = 'all');
SET @clothes_id = (SELECT id FROM categories WHERE name = 'clothes');
SET @tech_id = (SELECT id FROM categories WHERE name = 'tech');

-- Insert products
INSERT INTO products (id, name, description, category_id, inStock, brand, price, currency, gallery, attributes) VALUES
-- Nike Air Huarache Le
('huarache-x-stussy-le', 'Nike Air Huarache Le', '<p>Great sneakers for everyday use!</p>', @clothes_id, TRUE, 'Nike x Stussy', 144.69,
JSON_OBJECT(
  'label', 'USD',
  'symbol', '$'
),
JSON_ARRAY(
  'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_2_720x.jpg?v=1612816087',
  'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_1_720x.jpg?v=1612816087',
  'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_3_720x.jpg?v=1612816087',
  'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_5_720x.jpg?v=1612816087',
  'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_4_720x.jpg?v=1612816087'
),
JSON_ARRAY(
  JSON_OBJECT(
    'id', 'Size',
    'name', 'Size',
    'type', 'text',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', '40', 'value', '40', 'id', '40'),
      JSON_OBJECT('displayValue', '41', 'value', '41', 'id', '41'),
      JSON_OBJECT('displayValue', '42', 'value', '42', 'id', '42'),
      JSON_OBJECT('displayValue', '43', 'value', '43', 'id', '43')
    )
  )
)),

-- Jacket
('jacket-canada-goosee', 'Jacket', '<p>Awesome winter jacket</p>', @clothes_id, TRUE, 'Canada Goose', 518.47,
JSON_OBJECT(
  'label', 'USD',
  'symbol', '$'
),
JSON_ARRAY(
  'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016105/product-image/2409L_61.jpg',
  'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016107/product-image/2409L_61_a.jpg',
  'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016108/product-image/2409L_61_b.jpg',
  'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016109/product-image/2409L_61_c.jpg',
  'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016110/product-image/2409L_61_d.jpg',
  'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058169/product-image/2409L_61_o.png',
  'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058159/product-image/2409L_61_p.png'
),
JSON_ARRAY(
  JSON_OBJECT(
    'id', 'Size',
    'name', 'Size',
    'type', 'text',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', 'Small', 'value', 'S', 'id', 'Small'),
      JSON_OBJECT('displayValue', 'Medium', 'value', 'M', 'id', 'Medium'),
      JSON_OBJECT('displayValue', 'Large', 'value', 'L', 'id', 'Large'),
      JSON_OBJECT('displayValue', 'Extra Large', 'value', 'XL', 'id', 'Extra Large')
    )
  )
)),

-- PlayStation 5
('ps-5', 'PlayStation 5', '<p>A good gaming console. Plays games of PS4! Enjoy if you can buy it mwahahahaha</p>', @tech_id, TRUE, 'Sony', 844.02,
JSON_OBJECT(
  'label', 'USD',
  'symbol', '$'
),
JSON_ARRAY(
  'https://images-na.ssl-images-amazon.com/images/I/510VSJ9mWDL._SL1262_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/610%2B69ZsKCL._SL1500_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51iPoFwQT3L._SL1230_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/61qbqFcvoNL._SL1500_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/51HCjA3rqYL._SL1230_.jpg'
),
JSON_ARRAY(
  JSON_OBJECT(
    'id', 'Color',
    'name', 'Color',
    'type', 'swatch',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', 'Green', 'value', '#44FF03', 'id', 'Green'),
      JSON_OBJECT('displayValue', 'Cyan', 'value', '#03FFF7', 'id', 'Cyan'),
      JSON_OBJECT('displayValue', 'Blue', 'value', '#030BFF', 'id', 'Blue'),
      JSON_OBJECT('displayValue', 'Black', 'value', '#000000', 'id', 'Black'),
      JSON_OBJECT('displayValue', 'White', 'value', '#FFFFFF', 'id', 'White')
    )
  ),
  JSON_OBJECT(
    'id', 'Capacity',
    'name', 'Capacity',
    'type', 'text',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', '512G', 'value', '512G', 'id', '512G'),
      JSON_OBJECT('displayValue', '1T', 'value', '1T', 'id', '1T')
    )
  )
)),

-- Xbox Series S
('xbox-series-s', 'Xbox Series S 512GB', '
<div>
    <ul>
        <li><span>Hardware-beschleunigtes Raytracing macht dein Spiel noch realistischer</span></li>
        <li><span>Spiele Games mit bis zu 120 Bilder pro Sekunde</span></li>
        <li><span>Minimiere Ladezeiten mit einer speziell entwickelten 512GB NVMe SSD und wechsle mit Quick Resume nahtlos zwischen mehreren Spielen.</span></li>
        <li><span>Xbox Smart Delivery stellt sicher, dass du die beste Version deines Spiels spielst, egal, auf welcher Konsole du spielst</span></li>
        <li><span>Spiele deine Xbox One-Spiele auf deiner Xbox Series S weiter. Deine Fortschritte, Erfolge und Freundesliste werden automatisch auf das neue System übertragen.</span></li>
        <li><span>Erwecke deine Spiele und Filme mit innovativem 3D Raumklang zum Leben</span></li>
        <li><span>Der brandneue Xbox Wireless Controller zeichnet sich durch höchste Präzision, eine neue Share-Taste und verbesserte Ergonomie aus</span></li>
        <li><span>Ultra-niedrige Latenz verbessert die Reaktionszeit von Controller zum Fernseher</span></li>
        <li><span>Verwende dein Xbox One-Gaming-Zubehör -einschließlich Controller, Headsets und mehr</span></li>
        <li><span>Erweitere deinen Speicher mit der Seagate 1 TB-Erweiterungskarte für Xbox Series X (separat erhältlich) und streame 4K-Videos von Disney+, Netflix, Amazon, Microsoft Movies &amp; TV und mehr</span></li>
    </ul>
</div>', @tech_id, FALSE, 'Microsoft', 333.99,
JSON_OBJECT(
  'label', 'USD',
  'symbol', '$'
),
JSON_ARRAY(
  'https://images-na.ssl-images-amazon.com/images/I/71vPCX0bS-L._SL1500_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/71q7JTbRTpL._SL1500_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/71iQ4HGHtsL._SL1500_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/61IYrCrBzxL._SL1500_.jpg',
  'https://images-na.ssl-images-amazon.com/images/I/61RnXmpAmIL._SL1500_.jpg'
),
JSON_ARRAY(
  JSON_OBJECT(
    'id', 'Color',
    'name', 'Color',
    'type', 'swatch',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', 'Green', 'value', '#44FF03', 'id', 'Green'),
      JSON_OBJECT('displayValue', 'Cyan', 'value', '#03FFF7', 'id', 'Cyan'),
      JSON_OBJECT('displayValue', 'Blue', 'value', '#030BFF', 'id', 'Blue'),
      JSON_OBJECT('displayValue', 'Black', 'value', '#000000', 'id', 'Black'),
      JSON_OBJECT('displayValue', 'White', 'value', '#FFFFFF', 'id', 'White')
    )
  ),
  JSON_OBJECT(
    'id', 'Capacity',
    'name', 'Capacity',
    'type', 'text',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', '512G', 'value', '512G', 'id', '512G'),
      JSON_OBJECT('displayValue', '1T', 'value', '1T', 'id', '1T')
    )
  )
)),

-- iMac 2021
('apple-imac-2021', 'iMac 2021', 'The new iMac!', @tech_id, TRUE, 'Apple', 1688.03,
JSON_OBJECT(
  'label', 'USD',
  'symbol', '$'
),
JSON_ARRAY(
  'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-selection-hero-202104?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1617492405000'
),
JSON_ARRAY(
  JSON_OBJECT(
    'id', 'Capacity',
    'name', 'Capacity',
    'type', 'text',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', '256GB', 'value', '256GB', 'id', '256GB'),
      JSON_OBJECT('displayValue', '512GB', 'value', '512GB', 'id', '512GB')
    )
  ),
  JSON_OBJECT(
    'id', 'With USB 3 ports',
    'name', 'With USB 3 ports',
    'type', 'text',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', 'Yes', 'value', 'Yes', 'id', 'Yes'),
      JSON_OBJECT('displayValue', 'No', 'value', 'No', 'id', 'No')
    )
  ),
  JSON_OBJECT(
    'id', 'Touch ID in keyboard',
    'name', 'Touch ID in keyboard',
    'type', 'text',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', 'Yes', 'value', 'Yes', 'id', 'Yes'),
      JSON_OBJECT('displayValue', 'No', 'value', 'No', 'id', 'No')
    )
  )
)),


-- iPhone 12 Pro
('apple-iphone-12-pro', 'iPhone 12 Pro', 'This is iPhone 12. Nothing else to say.', @tech_id, TRUE, 'Apple', 1000.76,
JSON_OBJECT(
  'label', 'USD',
  'symbol', '$'
),
JSON_ARRAY(
  'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&amp;hei=1112&amp;fmt=jpeg&amp;qlt=80&amp;.v=1604021663000'
),
JSON_ARRAY(
  JSON_OBJECT(
    'id', 'Capacity',
    'name', 'Capacity',
    'type', 'text',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', '512G', 'value', '512G', 'id', '512G'),
      JSON_OBJECT('displayValue', '1T', 'value', '1T', 'id', '1T')
    )
  ),
  JSON_OBJECT(
    'id', 'Color',
    'name', 'Color',
    'type', 'swatch',
    'items', JSON_ARRAY(
      JSON_OBJECT('displayValue', 'Green', 'value', '#44FF03', 'id', 'Green'),
      JSON_OBJECT('displayValue', 'Cyan', 'value', '#03FFF7', 'id', 'Cyan'),
      JSON_OBJECT('displayValue', 'Blue', 'value', '#030BFF', 'id', 'Blue'),
      JSON_OBJECT('displayValue', 'Black', 'value', '#000000', 'id', 'Black'),
      JSON_OBJECT('displayValue', 'White', 'value', '#FFFFFF', 'id', 'White')
    )
  )
)),

-- AirPods Pro
('apple-airpods-pro', 'AirPods Pro', '<h3>Magic like you''ve never heard</h3>
<p>AirPods Pro have been designed to deliver Active Noise Cancellation for immersive sound, Transparency mode so you can hear your surroundings, and a customizable fit for all-day comfort. Just like AirPods, AirPods Pro connect magically to your iPhone or Apple Watch. And they''re ready to use right out of the case.

<h3>Active Noise Cancellation</h3>
<p>Incredibly light noise-cancelling headphones, AirPods Pro block out your environment so you can focus on what you''re listening to. AirPods Pro use two microphones, an outward-facing microphone and an inward-facing microphone, to create superior noise cancellation. By continuously adapting to the geometry of your ear and the fit of the ear tips, Active Noise Cancellation silences the world to keep you fully tuned in to your music, podcasts, and calls.

<h3>Transparency mode</h3>
<p>Switch to Transparency mode and AirPods Pro let the outside sound in, allowing you to hear and connect to your surroundings. Outward- and inward-facing microphones enable AirPods Pro to undo the sound-isolating effect of the silicone tips so things sound and feel natural, like when you''re talking to people around you.</p>

<h3>All-new design</h3>
<p>AirPods Pro offer a more customizable fit with three sizes of flexible silicone tips to choose from. With an internal taper, they conform to the shape of your ear, securing your AirPods Pro in place and creating an exceptional seal for superior noise cancellation.</p>

<h3>Amazing audio quality</h3>
<p>A custom-built high-excursion, low-distortion driver delivers powerful bass. A superefficient high dynamic range amplifier produces pure, incredibly clear sound while also extending battery life. And Adaptive EQ automatically tunes music to suit the shape of your ear for a rich, consistent listening experience.</p>

<h3>Even more magical</h3>
<p>The Apple-designed H1 chip delivers incredibly low audio latency. A force sensor on the stem makes it easy to control music and calls and switch between Active Noise Cancellation and Transparency mode. Announce Messages with Siri gives you the option to have Siri read your messages through your AirPods. And with Audio Sharing, you and a friend can share the same audio stream on two sets of AirPods — so you can play a game, watch a movie, or listen to a song together.</p>', 
@tech_id, FALSE, 'Apple', 300.23,
JSON_OBJECT(
  'label', 'USD',
  'symbol', '$'
),
JSON_ARRAY(
  'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634795000'
),
JSON_ARRAY()
),

-- AirTag
('apple-airtag', 'AirTag', '<h1>Lose your knack for losing things.</h1>
<p>AirTag is an easy way to keep track of your stuff. Attach one to your keys, slip another one in your backpack. And just like that, they''re on your radar in the Find My app. AirTag has your back.</p>',
@tech_id, TRUE, 'Apple', 120.57,
JSON_OBJECT(
  'label', 'USD',
  'symbol', '$'
),
JSON_ARRAY(
  'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-double-select-202104?wid=445&hei=370&fmt=jpeg&qlt=95&.v=1617761672000'
),
JSON_ARRAY()
);


-- Insert orders with items
INSERT INTO orders (total_amount, items) VALUES
-- Order 1: Mix of tech and clothes
(2189.48,
JSON_ARRAY(
  JSON_OBJECT(
    'product_id', 'huarache-x-stussy-le',
    'quantity', 2,
    'unit_price', 144.69,
    'selected_attributes', JSON_OBJECT('Size', '42')
  ),
  JSON_OBJECT(
    'product_id', 'ps-5',
    'quantity', 1,
    'unit_price', 844.02,
    'selected_attributes', JSON_OBJECT('Color', '#000000', 'Capacity', '1T')
  ),
  JSON_OBJECT(
    'product_id', 'apple-airpods-pro',
    'quantity', 2,
    'unit_price', 300.23,
    'selected_attributes', JSON_OBJECT()
  )
)),

-- Order 2: Apple products bundle
(3009.36,
JSON_ARRAY(
  JSON_OBJECT(
    'product_id', 'apple-imac-2021',
    'quantity', 1,
    'unit_price', 1688.03,
    'selected_attributes', JSON_OBJECT('Capacity', '512GB', 'With USB 3 ports', 'Yes', 'Touch ID in keyboard', 'Yes')
  ),
  JSON_OBJECT(
    'product_id', 'apple-iphone-12-pro',
    'quantity', 1,
    'unit_price', 1000.76,
    'selected_attributes', JSON_OBJECT('Color', '#030BFF', 'Capacity', '1T')
  ),
  JSON_OBJECT(
    'product_id', 'apple-airtag',
    'quantity', 2,
    'unit_price', 120.57,
    'selected_attributes', JSON_OBJECT()
  )
)),

-- Order 3: Winter clothing order
(1181.63,
JSON_ARRAY(
  JSON_OBJECT(
    'product_id', 'jacket-canada-goosee',
    'quantity', 2,
    'unit_price', 518.47,
    'selected_attributes', JSON_OBJECT('Size', 'L')
  ),
  JSON_OBJECT(
    'product_id', 'huarache-x-stussy-le',
    'quantity', 1,
    'unit_price', 144.69,
    'selected_attributes', JSON_OBJECT('Size', '41')
  )
));


