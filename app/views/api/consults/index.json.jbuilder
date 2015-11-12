json.women do 
  json.partial! 'api/consults/consult', collection: @women, as: :consult
end
json.children do 
  json.partial! 'api/consults/consult', collection: @children, as: :consult
end
json.immunes do 
  json.partial! 'api/consults/consult', collection: @immunes, as: :consult
end