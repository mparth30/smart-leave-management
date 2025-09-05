using System;
using System.Web.Mvc;

namespace SmartLeave.Controllers
{
    public class LeaveController : Controller
    {
        // GET: /Leave/Apply
        public ActionResult Apply()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Apply(string leaveType, DateTime startDate, DateTime endDate, string reason)
        {
            // Placeholder - insert into DB (use ADO.NET or Entity Framework)
            ViewBag.Message = "Leave request submitted (this is a placeholder - implement DB save).";
            return View();
        }

        public ActionResult Status()
        {
            return View();
        }
    }
}
