-- Insert categories
INSERT INTO categories (name) VALUES 
('all'),
('clothes'),
('tech');

-- Insert attribute sets
INSERT INTO attribute_sets (name, type) VALUES
('Size', 'text'),
('Color', 'swatch'),
('Capacity', 'text'),
('With USB 3 ports', 'text'),
('Touch ID in keyboard', 'text');

-- Insert attribute items
-- Size attribute items
INSERT INTO attribute_items (attribute_set_id, display_value, value, attribute_id) VALUES
(1, '40', '40', '40'),
(1, '41', '41', '41'),
(1, '42', '42', '42'),
(1, '43', '43', '43'),
(1, 'Small', 'S', 'Small'),
(1, 'Medium', 'M', 'Medium'),
(1, 'Large', 'L', 'Large'),
(1, 'Extra Large', 'XL', 'Extra Large');

-- Color attribute items
INSERT INTO attribute_items (attribute_set_id, display_value, value, attribute_id) VALUES
(2, 'Green', '#44FF03', 'Green'),
(2, 'Cyan', '#03FFF7', 'Cyan'),
(2, 'Blue', '#030BFF', 'Blue'),
(2, 'Black', '#000000', 'Black'),
(2, 'White', '#FFFFFF', 'White');

-- Capacity attribute items
INSERT INTO attribute_items (attribute_set_id, display_value, value, attribute_id) VALUES
(3, '512G', '512G', '512G'),
(3, '1T', '1T', '1T'),
(3, '256GB', '256GB', '256GB'),
(3, '512GB', '512GB', '512GB');

-- USB ports attribute items
INSERT INTO attribute_items (attribute_set_id, display_value, value, attribute_id) VALUES
(4, 'Yes', 'Yes', 'Yes'),
(4, 'No', 'No', 'No');

-- Touch ID attribute items
INSERT INTO attribute_items (attribute_set_id, display_value, value, attribute_id) VALUES
(5, 'Yes', 'Yes', 'Yes'),
(5, 'No', 'No', 'No');

-- Insert products
INSERT INTO products (id, name, description, category_id, inStock, brand, price, currency, gallery) VALUES
-- Nike Air Huarache Le
('huarache-x-stussy-le', 'Nike Air Huarache Le', '<p>Great sneakers for everyday use!</p>', 2, TRUE, 'Nike x Stussy', 144.69, 
 JSON_OBJECT('label', 'USD', 'symbol', '$'),
 JSON_ARRAY('https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_2_720x.jpg?v=1612816087', 
            'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_1_720x.jpg?v=1612816087',
            'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_3_720x.jpg?v=1612816087',
            'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_5_720x.jpg?v=1612816087',
            'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_4_720x.jpg?v=1612816087')),

-- Jacket
('jacket-canada-goosee', 'Jacket', '<p>Awesome winter jacket</p>', 2, TRUE, 'Canada Goose', 518.47,
 JSON_OBJECT('label', 'USD', 'symbol', '$'),
 JSON_ARRAY('https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016105/product-image/2409L_61.jpg',
            'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016107/product-image/2409L_61_a.jpg',
            'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016108/product-image/2409L_61_b.jpg',
            'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016109/product-image/2409L_61_c.jpg',
            'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016110/product-image/2409L_61_d.jpg')),

-- PlayStation 5
('ps-5', 'PlayStation 5', '<p>A good gaming console. Plays games of PS4! Enjoy if you can buy it mwahahahaha</p>', 3, TRUE, 'Sony', 844.02,
 JSON_OBJECT('label', 'USD', 'symbol', '$'),
 JSON_ARRAY('https://images-na.ssl-images-amazon.com/images/I/510VSJ9mWDL._SL1262_.jpg',
            'https://images-na.ssl-images-amazon.com/images/I/610%2B69ZsKCL._SL1500_.jpg',
            'https://images-na.ssl-images-amazon.com/images/I/51iPoFwQT3L._SL1230_.jpg',
            'https://images-na.ssl-images-amazon.com/images/I/61qbqFcvoNL._SL1500_.jpg',
            'https://images-na.ssl-images-amazon.com/images/I/51HCjA3rqYL._SL1230_.jpg')),

-- Xbox Series S
('xbox-series-s', 'Xbox Series S 512GB', '<div><ul><li><span>Hardware-beschleunigtes Raytracing macht dein Spiel noch realistischer</span></li><li><span>Spiele Games mit bis zu 120 Bilder pro Sekunde</span></li><li><span>Minimiere Ladezeiten mit einer speziell entwickelten 512GB NVMe SSD und wechsle mit Quick Resume nahtlos zwischen mehreren Spielen.</span></li></ul></div>', 3, FALSE, 'Microsoft', 333.99,
 JSON_OBJECT('label', 'USD', 'symbol', '$'),
 JSON_ARRAY('https://images-na.ssl-images-amazon.com/images/I/71vPCX0bS-L._SL1500_.jpg',
            'https://images-na.ssl-images-amazon.com/images/I/71q7JTbRTpL._SL1500_.jpg',
            'https://images-na.ssl-images-amazon.com/images/I/71iQ4HGHtsL._SL1500_.jpg',
            'https://images-na.ssl-images-amazon.com/images/I/61IYrCrBzxL._SL1500_.jpg',
            'https://images-na.ssl-images-amazon.com/images/I/61RnXmpAmIL._SL1500_.jpg')),

-- iMac 2021
('apple-imac-2021', 'iMac 2021', 'The new iMac!', 3, TRUE, 'Apple', 1688.03,
 JSON_OBJECT('label', 'USD', 'symbol', '$'),
 JSON_ARRAY('https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-selection-hero-202104?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1617492405000')),

-- iPhone 12 Pro
('apple-iphone-12-pro', 'iPhone 12 Pro', 'This is iPhone 12. Nothing else to say.', 3, TRUE, 'Apple', 1000.76,
 JSON_OBJECT('label', 'USD', 'symbol', '$'),
 JSON_ARRAY('https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&amp;hei=1112&amp;fmt=jpeg&amp;qlt=80&amp;.v=1604021663000')),

-- Apple AirPods Pro
 ('apple-airpods-pro', 'AirPods Pro', '<h3>Magic like you\'ve never heard</h3><p>AirPods Pro have been designed to deliver Active Noise Cancellation for immersive sound, Transparency mode so you can hear your surroundings, and a customizable fit for all-day comfort.</p>', 3, FALSE, 'Apple', 300.23,
 JSON_OBJECT('label', 'USD', 'symbol', '$'),
 JSON_ARRAY('https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634795000')),

-- Apple AirTag
('apple-airtag', 'AirTag', '<h1>Lose your knack for losing things.</h1><p>AirTag is an easy way to keep track of your stuff. Attach one to your keys, slip another one in your backpack. And just like that, they\'re on your radar in the Find My app. AirTag has your back.</p>', 3, TRUE, 'Apple', 120.57,
 JSON_OBJECT('label', 'USD', 'symbol', '$'),
 JSON_ARRAY('https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-double-select-202104?wid=445&hei=370&fmt=jpeg&qlt=95&.v=1617761672000'));

-- Insert product attributes
-- Nike Air Huarache Le sizes
INSERT INTO product_attributes (product_id, attribute_item_id) VALUES
('huarache-x-stussy-le', 1), -- Size 40
('huarache-x-stussy-le', 2), -- Size 41
('huarache-x-stussy-le', 3), -- Size 42
('huarache-x-stussy-le', 4); -- Size 43

-- Jacket sizes
INSERT INTO product_attributes (product_id, attribute_item_id) VALUES
('jacket-canada-goosee', 5), -- Size Small
('jacket-canada-goosee', 6), -- Size Medium
('jacket-canada-goosee', 7), -- Size Large
('jacket-canada-goosee', 8); -- Size XL

-- PlayStation 5 attributes
INSERT INTO product_attributes (product_id, attribute_item_id) VALUES
('ps-5', 9),  -- Green color
('ps-5', 10), -- Cyan color
('ps-5', 11), -- Blue color
('ps-5', 12), -- Black color
('ps-5', 13), -- White color
('ps-5', 14), -- 512G capacity
('ps-5', 15); -- 1T capacity

-- Xbox Series S attributes
INSERT INTO product_attributes (product_id, attribute_item_id) VALUES
('xbox-series-s', 9),  -- Green color
('xbox-series-s', 10), -- Cyan color
('xbox-series-s', 11), -- Blue color
('xbox-series-s', 12), -- Black color
('xbox-series-s', 13), -- White color
('xbox-series-s', 14), -- 512G capacity
('xbox-series-s', 15); -- 1T capacity

-- iMac 2021 attributes
INSERT INTO product_attributes (product_id, attribute_item_id) VALUES
('apple-imac-2021', 16), -- 256GB capacity
('apple-imac-2021', 17), -- 512GB capacity
('apple-imac-2021', 18), -- USB ports: Yes
('apple-imac-2021', 19), -- USB ports: No
('apple-imac-2021', 20); -- Touch ID: Yes
('apple-imac-2021', 21); -- Touch ID: No

-- iPhone 12 Pro attributes
INSERT INTO product_attributes (product_id, attribute_item_id) VALUES
('apple-iphone-12-pro', 9),  -- Green color
('apple-iphone-12-pro', 10), -- Cyan color
('apple-iphone-12-pro', 11), -- Blue color
('apple-iphone-12-pro', 12), -- Black color
('apple-iphone-12-pro', 13), -- White color
('apple-iphone-12-pro', 14), -- 512G capacity
('apple-iphone-12-pro', 15); -- 1T capacity

-- Order 1
INSERT INTO orders (total_amount, items) VALUES
(1688.03, JSON_ARRAY(
  JSON_OBJECT(
    'product_id', 'apple-imac-2021',
    'quantity', 1,
    'unit_price', 1688.03,
    'selected_attributes', JSON_OBJECT('Capacity', '512GB', 'With USB 3 ports', 'Yes', 'Touch ID in keyboard', 'Yes')
  )
));

-- Order 2
INSERT INTO orders (total_amount, items) VALUES
(1688.03, JSON_ARRAY(
  JSON_OBJECT(
    'product_id', 'apple-imac-2021',
    'quantity', 1,
    'unit_price', 1688.03,
    'selected_attributes', JSON_OBJECT('Capacity', '512GB', 'With USB 3 ports', 'Yes', 'Touch ID in keyboard', 'Yes')
  )
)),
(844.02, JSON_ARRAY(
  JSON_OBJECT(
    'product_id', 'ps-5',
    'quantity', 1,
    'unit_price', 844.02,
    'selected_attributes', JSON_OBJECT('Color', '#030BFF', 'Capacity', '1T')
  )
));

-- Order 3
INSERT INTO orders (total_amount, items) VALUES
(1463.46, JSON_ARRAY(
  JSON_OBJECT(
    'product_id', 'jacket-canada-goosee',
    'quantity', 2,
    'unit_price', 518.47,
    'selected_attributes', JSON_OBJECT('Size', 'L')
  ),
  JSON_OBJECT(
    'product_id', 'apple-airpods-pro',
    'quantity', 1,
    'unit_price', 300.23,
    'selected_attributes', JSON_OBJECT()
  ),
  JSON_OBJECT(
    'product_id', 'apple-airtag',
    'quantity', 1,
    'unit_price', 120.57,
    'selected_attributes', JSON_OBJECT()
  )
));