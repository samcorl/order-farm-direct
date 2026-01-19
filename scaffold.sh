# A cooperative will use this. Modeling is from scope of a coop

# system-level resources
rails generate scaffold Farm                       user_id:integer aasm_state:string name:string location_id:integer
rails generate scaffold Location                   user_id:integer aasm_state:string latitude:float longitude:float street:string city:string state:string postcode:string country:string active:boolean  ;
rails generate scaffold DistributorFarm            user_id:integer aasm_state:string distributor_id:integer farm_id:integer
rails generate scaffold FarmProduct                user_id:integer aasm_state:string farm_id:integer product_id:integer name:string price_cents:integer net_weight_grams:float
rails generate scaffold Product                    user_id:integer aasm_state:string brand_id:integer product_category_id:integer name:string price_cents:integer net_weight_grams:float
rails generate scaffold Brand                      user_id:integer aasm_state:string name:string price_cents:integer net_weight_grams:float
rails generate scaffold ProductCategory            user_id:integer aasm_state:string name:string


# farm inventory
rails generate scaffold Distributor                user_id:integer aasm_state:string name:string location_id:integer
rails generate scaffold DistributionCenter         user_id:integer aasm_state:string name:string location_id:integer distributor_id:integer code:string

# storage and packaging
rails generate scaffold Bin                        user_id:integer aasm_state:string name:string distribution_center_id:integer
rails generate scaffold BinProduct                 user_id:integer aasm_state:string name:string bin_id:integer product_id:integer
rails generate scaffold Receivable                 user_id:integer aasm_state:string name:string product_id:integer uom:string quantity:float net_weight_grams:float ship_weight_grams:float

# sales direct to consumer
rails generate scaffold Order                      user_id:integer aasm_state:string name:string customer_id:integer num_lines:integer total_cents:integer
rails generate scaffold OrderLine                  user_id:integer aasm_state:string name:string order_id:integer quantity:float price_cents:integer total_cents:integer sales_tax_cents:integer
rails generate scaffold Payment                    user_id:integer aasm_state:string name:string order_id:integer total_cents:integer
rails generate scaffold ShoppingList               user_id:integer aasm_state:string name:string customer_id:integer num_lines:integer total_cents:integer
rails generate scaffold ShoppingListLine           user_id:integer aasm_state:string name:string order_id:integer quantity:float price_cents:integer total_cents:integer
rails generate scaffold Shipment                   user_id:integer aasm_state:string name:string order_id:integer starting_location_id:integer ending_location_id:integer shipping_method_id:integer shipped_at:datetime arrived_at:datetime ship_weight_grams:integer
rails generate scaffold ShippingMethod             user_id:integer aasm_state:string name:string carrier:string service:string code:string
rails generate scaffold AvailableShippingMethod    user_id:integer aasm_state:string farm_id:integer product_id:integer shipping_method_id:integer

rails generate scaffold ShipmentDocument           user_id:integer aasm_state:string name:string customer_id:integer first_name:string last_name:string expires_at:datetime document_identifier:string
rails generate scaffold ShipmentLog                user_id:integer aasm_state:string name:string shipment_id:integer token:string expires_at:datetime view_type:string

