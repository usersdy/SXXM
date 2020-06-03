const express=require("express")
const router=express.Router()
const pool=require("../pool");

// 全部商品路由
router.get('/product',(req,res)=>{
    console.log(req.query)
    var search=req.query.search;
    // console.log(search)
    //第几页
    var page=req.query.page;
    //每页的数量
    var pagesize = 8;
    //总页数;
    var pageCount;
    //商品数据
    var data;
    //根据当前的页码来计算SQL语句中offset参数值
    var offset = (page - 1) * pagesize;
    var obj={data,pageCount};
    if(search=='product'){
        var sql=`select src,href,price,title from tplink_product LIMIT ${offset},${pagesize} `;
        var sql1=`select count(id) as count from tplink_product`;
        Promise.all([
           new Promise(function(open){
                pool.query(sql,(err,result)=>{
                    if(err) throw err;
                    obj.data=result;
                    open();
                })
           }),
           new Promise(function(open){
                pool.query(sql1,(err,result)=>{
                    if(err) throw err;
                    obj.pageCount= Math.ceil(result[0].count/pagesize);;
                    open();
                })
           })         
        ]).then(()=>{
            res.writeHead(200,{
                "Content-Type":"application/json;charset=utf-8",
            });
            res.write(JSON.stringify(obj))
            res.end();
        });
    }else{
        var sql=`select src,href,price,title from tplink_product where title like'%${search}%' LIMIT ${offset},${pagesize} `;
        var sql1=`select count(id) as count from tplink_product where title like'%${search}%'`;
        Promise.all([
            new Promise(function(open){
                 pool.query(sql,(err,result)=>{
                     if(err) throw err;
                     if(result.length==0){result=[]}
                     obj.data=result;
                     open();
                 })
            }),
            new Promise(function(open){
                 pool.query(sql1,(err,result)=>{
                     if(err) throw err;
                     obj.pageCount= Math.ceil(result[0].count/pagesize);;
                     open();
                 })
            })         
         ]).then(()=>{
             res.writeHead(200,{
                 "Content-Type":"application/json;charset=utf-8",
             });
             console.log(obj.pageCount)
             res.write(JSON.stringify(obj))
             res.end();
         });
    }
      
})	



module.exports=router