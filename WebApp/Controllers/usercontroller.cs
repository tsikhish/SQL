using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using WebApp.Model;

namespace WebApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class usercontroller : Controller
    {
        [HttpPost("adduser")]
        public IActionResult adduser(person person)
        {
            var validator = new validation();
            var result= validator.Validate(person);
            var errormessage = "";
            if (!result.IsValid)
            {
                foreach(var item in result.Errors)
                {
                    errormessage += item.ErrorMessage+',';
                }
                return BadRequest(errormessage);
            }
            var userList = new List<person> {
                new person{ FirstName="mariam",LastName="tsikhishvili",PersonAddress=new address { City="tbilisi"},},
            };
            userList.Add(person);
            return Ok(userList);
        }
        
    }
}
