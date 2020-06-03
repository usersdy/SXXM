const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get('/car',(req,res)=>{
    var uid=req.query.uid;
    // console.log(uid)
    // var sql="select c.cid,p.title,p.price,p.src from shop_car as c,tplink_product as p where p.pid=c.pid and c.uid=?";
    var sql="select  c.cid,p.price,c.num,c.uid,c.cid,p.title,p.src from shop_car as c,tplink_product as p where p.pid=c.pid and c.uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err 
        res.writeHead(200,{
            "Content-Type":"application/json,charset=uft-8",
            "Access-Control-Allow-Origin":"*"
        })
        res.write(JSON.stringify(result))
        res.end()
    })
});
router.get('/c_product',(req,res)=>{
    var uid=req.query.uid;
    // console.log(uid)
    // var sql="select c.cid,p.title,p.price,p.src from shop_car as c,tplink_product as p where p.pid=c.pid and c.uid=?";
    var sql="select  c.num,c.cid,p.title,p.src,p.price from shop_car as c,tplink_product as p where p.pid=c.pid and c.uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err 
        res.writeHead(200,{
            "Content-Type":"application/json,charset=uft-8",
            "Access-Control-Allow-Origin":"*"
        })
        res.write(JSON.stringify(result))
        res.end()
    })
})

router.get('/delete_product',(req,res)=>{
    var uid=req.query.uid;
    var cid=req.query.cid;
    console.log(uid.cid)
    var sql=`delete from shop_car where uid=? and cid=?`;
    pool.query(sql,[uid,cid],(err,result)=>{
        if(err) throw err ;
        res.writeHead(200,{
            "Content-Type":"application/json,charset=uft-8",
            "Access-Control-Allow-Origin":"*"
        })
        if(result.affectedRows>0){
            res.write(JSON.stringify({code:1,msg:"删除成功"}))
        }else{
            res.write(JSON.stringify({code:0,msg:"删除失败"}))
        }
        res.end();
    })

})

router.post('/pAdd',(req,res)=>{
    var obj=req.body;
    var uid=req.body.uid;
    var pid=req.body.pid;
    console.log(uid,pid)
    var sql='insert into shop_car set ?';
    var sql1="select*from shop_car where pid=? and uid=?";

   
    pool.query(sql1,[pid,uid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            var cid=result[0].cid;
            var num1=parseInt(result[0].num)
            num1++
            var sql2='update shop_car SET num=? where uid=? and pid=?'
            pool.query(sql2,[num1,uid,pid],(err,result)=>{
                if(err) throw err;
                res.writeHead(200,{
                    "Content-Type":"application/json,charset=uft-8",
                    "Access-Control-Allow-Origin":"*"
                });
                if(result.affectedRows>0){
                    // console.log(result)
                    res.write(JSON.stringify({code:1,msg:'添加成功'}));
                    res.end();
                }else{
                    res.write(JSON.stringify({code:0,msg:'添加失败'}));
                    res.end();
                };
            })
        }else{
            pool.query(sql,[obj],(err,result)=>{
                if(err) throw err;
                res.writeHead(200,{
                    "Content-Type":"application/json,charset=uft-8",
                    "Access-Control-Allow-Origin":"*"
                });
                if(result.affectedRows>0){
                    // console.log(result)
                    res.write(JSON.stringify({code:1,msg:'添加成功'}));
                    res.end();
                }else{
                    res.write(JSON.stringify({code:0,msg:'添加失败'}));
                    res.end();
                };
            });   
        }
    })

});
module.exports=router;