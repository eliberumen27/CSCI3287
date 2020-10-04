//Query #1
db.restaurants.find( { name: /Ice Cream/ },{ name: 1 })
//Query #2
db.restaurants.find(
    {$and: [{cuisine :{$in  :["Italian","American"]}}, {borough: "Brooklyn"}
        ]
    }
)
//Query #3
db.restaurants.aggregate(


{
   $match : {cuisine : "American"}
},


{
    $group : {
        _id : "$borough",
        total : {$sum : 1}

    }
}

{
    $sort : { total : -1}
}


)
//Query #4
db.restaurants.aggregate(


{
   $match : {cuisine : "American", borough: "Manhattan"}
},

{
    $unwind : "$grades"
}

{
    $group : {
        _id : "$name",
        total : {$sum : "$grades.score"}
        }
}

{
    $sort : { _id : -1}
}

//Query #5

//Sample "OR" Query
/*
db.restaurants.find(
    {
        $and: [
            {}
            {}
        ]
    }
)
*/

/*Interview Grading Queries

db.restaurants.find(
    {name: "Caffe Dante"},{"grades.score": 1}
)

db.restaurants.aggregate(


{
   $match : {"address.zipcode" : "10462"}
},


{
    $group : {
        _id : "$address.zipcode",
        grade: {$sum: 1}
    }
}

)

*/
