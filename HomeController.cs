using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using WebApp.Model;

namespace WebApp.Controllers
{
    [ApiController]
    [Route("/controller")]
    public class HomeController : Controller
    {
        public readonly string filepath = "appsettings.json";
        [HttpPost("adduser")]
        public IActionResult getUser(person person)
        {
            List<person> list = getUserList();
            var userInput = new List<person> {
                 new person
                 {
                     Id = 1,FirstName="mariam",LastName="tsikhishvili",JobPosition="developer",Salary=6000,PersonAddress=new address{Country="Georgia",City="Tbilisi",HomeNumber=77}
                 },
            new person
            {
                Id=2,FirstName = "ana", LastName = "tsikhishvili", Salary = 4000, PersonAddress = new address
                {
                    Country = "Georgia",
                    City = "Tbilisi",
                    HomeNumber = 77
                }
            },
            };
            list.AddRange(userInput);
            saveToJson(list);
        if(userInput.Count == 1)
            {
                return Ok(userInput);
            }
        else
            {
                return BadRequest(userInput);
            }
        }

        private List<person> getUserList()
        {
            if (!System.IO.File.Exists(filepath))
            {
                return new List<person>();
            }
            string data=System.IO.File.ReadAllText(filepath);
            return JsonConvert.DeserializeObject<List<person>>(data);
        }
        public void saveToJson(List<person> personList)
        {
            string data=JsonConvert.SerializeObject(personList);
            System.IO.File.WriteAllText(filepath, data);
        }

        [HttpGet("userById")]
        public IActionResult getUserById(int id, person person)
        {
            List<person> people = getUserList();
            people[id].FirstName = person.FirstName;
            people[id].LastName = person.LastName;
            return Ok(people);
        }
        [HttpGet("filterperson")]
        public object filtered([FromQuery] person person)
        {
            List<person> people = getUserList();
            return people.Where(x => x.Salary > x.Salary && x.PersonAddress.City.Contains("tbilisi"));
        }
        [HttpDelete]
        public IActionResult deleteUser(int id)
        {
            List<person> people = getUserList();
            people.RemoveAt(id); return Ok(people);
        }
        [HttpPut("id")]
        public IActionResult updateItem(int id, [FromBody] person person)
        {
            List<person> people = getUserList();
            var personToUpdate = people.FirstOrDefault(x => x.Id == id);
            if (personToUpdate != null)
            {
                personToUpdate.FirstName = person.FirstName;
                personToUpdate.LastName = person.LastName;
                saveToJson(people);
                return Ok(personToUpdate);
            }
            else
            {
                return NotFound();
            }
        }
    }
}
