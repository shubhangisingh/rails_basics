require 'json'
data= {
  k1: "v1",
  k2: ["v2", "v3", "", { k21: "v21", k22: "" }],
  k3: {
    k4: "v4",
    k5: ["v5", "v6", nil],
    k6: {
      k7: "v7",
      k8: ""
    }
  },
  k9: [],
  k10: nil,
  k11: [23, true, false, "hello"]
}

def removing_nil_and_empty(hash_or_array)
  case hash_or_array
  when Hash
    hash_or_array.each do |key, val|
        puts "recursively calling #{val}"
        removing_nil_and_empty(val)
    end
    hash_or_array.reject! {|key,val|  val.nil? || (val.respond_to?(:empty?) && val.empty?)}
  when Array
    hash_or_array.each {|item|  removing_nil_and_empty(item)}
    hash_or_array.reject! {|val| val.nil? || (val.respond_to?(:empty?) && val.empty?) }
  end
    hash_or_array

end

result = removing_nil_and_empty(data)
puts result.to_json

#expected result
# {
#   "k1": "v1",
#   "k2": ["v2", "v3", { "k21": "v21" }],
#   "k3": {
#     "k4": "v4",
#     "k5": ["v5", "v6"],
#     "k6": {
#       "k7": "v7"
#     }
#   },
#   "k11": [23, true, false, "hello"]
# }
