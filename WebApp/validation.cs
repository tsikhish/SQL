using FluentValidation;
using System;
using WebApp.Model;

namespace WebApp
{
    public class validation:AbstractValidator<person>
    {
        public validation()
        {
            RuleFor(x => x.CreateDate.Day).LessThan(DateTime.Now.Day).WithMessage("day should be before today");
            RuleFor(x=>x.FirstName).NotEmpty().WithMessage("name should be filled")
                                   .Length(0,50).WithMessage("length should be 0-50");
            RuleFor(x => x.LastName).NotEmpty().WithMessage("lastname should be filled")
                                  .Length(0, 50).WithMessage("length should be 0-50");
            RuleFor(x => x.JobPosition).NotEmpty().WithMessage("jobposition should be filled")
                                  .Length(0, 50).WithMessage("length should be 0-50");
            RuleFor(x => x.WorkExperience).NotNull().WithMessage("workexperience should be filled");
            RuleFor(x => x.Salary).LessThan(10000).GreaterThan(0).WithMessage("salary should be between 0 and 10000");
            RuleFor(x => x.PersonAddress.HomeNumber).NotNull().When(x => x.PersonAddress is not null).WithMessage("homewnumber should be filled");
            RuleFor(x => x.PersonAddress.City).NotEmpty().Length(0,50).When(x => x.PersonAddress is not null).WithMessage("city should be filled");
            RuleFor(x => x.PersonAddress.Country).NotEmpty().Length(0, 50).When(x => x.PersonAddress is not null).WithMessage("country should be filled");
        }
    }
}
